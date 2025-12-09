import csv
import math
import os
# Attempt to import pinecone, but don't fail if not installed yet (for local testing)
try:
    import pinecone
except ImportError:
    pinecone = None # Allows script to run data processing part without pinecone
    print("Warning: Pinecone library not found. Pinecone operations will be skipped.")


# Define constants
VECTOR_FEATURES = [
    'Protein', 'Lipid_Tot', 'Carbohydrt', 'Fiber_TD', 'Sugar_Tot',
    'Calcium_DV', 'Iron_DV', 'Sodium', 'Vit_C_DV', 'Vit_A_DV',
    'FA_Sat', 'Cholestrl'
]

METADATA_FEATURES = [
    'R_SLR', 'Score', 'Protein', 'Lipid_Tot', 'Carbohydrt', 'Fiber_TD',
    'Sugar_Tot', 'Calcium_DV', 'Iron_DV', 'Sodium', 'Vit_C_DV',
    'Vit_A_DV', 'FA_Sat', 'Cholestrl'
]
# Metadata fields to be indexed in Pinecone for filtering
INDEXED_METADATA_FIELDS = ['Score', 'Protein', 'Sugar_Tot', 'Sodium', 'FA_Sat']


def load_and_clean_csv(filepath):
    cleaned_data = []
    try:
        with open(filepath, mode='r', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row_dict in reader:
                processed_row = {}
                for key, value_str in row_dict.items():
                    if key in METADATA_FEATURES:
                        try:
                            if value_str is None or value_str.strip() == '' or value_str.strip().upper() == 'NA' or value_str.strip().upper() == 'N/A':
                                processed_row[key] = 0.0
                            else:
                                processed_row[key] = float(value_str)
                        except ValueError:
                            processed_row[key] = 0.0
                    else:
                        processed_row[key] = value_str

                for feature_key in METADATA_FEATURES:
                    if feature_key not in processed_row:
                        processed_row[feature_key] = 0.0
                cleaned_data.append(processed_row)
    except FileNotFoundError:
        print(f"Error: File not found at {filepath}")
        return None
    except Exception as e:
        print(f"An error occurred during CSV loading: {e}")
        return None
    return cleaned_data

def calculate_min_max(data):
    if not data: return None
    min_max_values = {feature: {'min': float('inf'), 'max': float('-inf')} for feature in VECTOR_FEATURES}
    for row in data:
        for feature in VECTOR_FEATURES:
            value = row.get(feature, 0.0)
            min_max_values[feature]['min'] = min(min_max_values[feature]['min'], value)
            min_max_values[feature]['max'] = max(min_max_values[feature]['max'], value)
    return min_max_values

def normalize_and_prepare_data(data, min_max_values):
    if not data or not min_max_values: return []
    data_for_pinecone = []
    for index, row in enumerate(data):
        food_id = f"food_item_{index + 1}"
        normalized_vector = []
        for feature in VECTOR_FEATURES:
            value = row.get(feature, 0.0)
            min_val = min_max_values[feature]['min']
            max_val = min_max_values[feature]['max']
            normalized_value = 0.0 if (max_val - min_val) == 0 else (value - min_val) / (max_val - min_val)
            normalized_vector.append(normalized_value)
        metadata_dict = {key: row.get(key) for key in METADATA_FEATURES if key in row}
        data_for_pinecone.append({'id': food_id, 'values': normalized_vector, 'metadata': metadata_dict})
    return data_for_pinecone

def init_pinecone():
    """Initializes Pinecone connection."""
    if not pinecone:
        print("Pinecone library is not available. Skipping Pinecone initialization.")
        return None

    api_key = os.environ.get('PINECONE_API_KEY')
    environment = os.environ.get('PINECONE_ENVIRONMENT')

    if not api_key or not environment:
        print("Error: PINECONE_API_KEY or PINECONE_ENVIRONMENT not found in environment variables.")
        print("Pinecone initialization failed. Skipping upsert.")
        return None

    try:
        pinecone.init(api_key=api_key, environment=environment)
        print("Pinecone initialized successfully.")
        return pinecone
    except Exception as e:
        print(f"Error initializing Pinecone: {e}")
        return None

def get_or_create_pinecone_index(pinecone_instance, index_name, dimension, metric='cosine'):
    """Gets or creates a Pinecone index."""
    if not pinecone_instance: return None

    try:
        if index_name not in pinecone_instance.list_indexes():
            print(f"Index '{index_name}' not found. Creating new index...")
            pinecone_instance.create_index(
                index_name,
                dimension=dimension,
                metric=metric,
                metadata_config={'indexed': INDEXED_METADATA_FIELDS}
            )
            print(f"Index '{index_name}' created successfully.")
        else:
            print(f"Index '{index_name}' already exists.")

        index = pinecone_instance.Index(index_name)
        print("Connected to index. Current stats:")
        print(index.describe_index_stats())
        return index
    except Exception as e:
        print(f"Error creating or connecting to Pinecone index '{index_name}': {e}")
        return None

def upsert_data_to_pinecone(index, data_to_upsert, batch_size=100):
    """Upserts data to Pinecone index in batches."""
    if not index or not data_to_upsert: return

    num_batches = math.ceil(len(data_to_upsert) / batch_size)
    print(f"\nStarting upsert of {len(data_to_upsert)} items in {num_batches} batches...")
    for i in range(num_batches):
        start_idx = i * batch_size
        end_idx = min((i + 1) * batch_size, len(data_to_upsert))
        batch = data_to_upsert[start_idx:end_idx]
        try:
            index.upsert(vectors=batch)
            print(f"Upserted batch {i+1}/{num_batches} ({len(batch)} items)")
        except Exception as e:
            print(f"Error upserting batch {i+1}/{num_batches}: {e}")
            # Optionally, decide if you want to stop or continue on batch error

def main():
    csv_filepath = 'nutrition score algorithm/nutrition_DV_SLR.csv'

    print("Loading and cleaning data...")
    cleaned_data = load_and_clean_csv(csv_filepath)
    if not cleaned_data:
        print("Halting due to issues in data loading.")
        return
    print(f"\nSuccessfully loaded and cleaned {len(cleaned_data)} records.")

    print("\nCalculating min and max values for vector features...")
    min_max_values = calculate_min_max(cleaned_data)
    if not min_max_values:
        print("Halting due to issues in min/max calculation.")
        return
    print("Min-Max Values:")
    for feature, values in min_max_values.items():
        print(f"  {feature}: Min={values['min']}, Max={values['max']}")

    print("\nNormalizing data and preparing items for Pinecone...")
    data_to_upsert = normalize_and_prepare_data(cleaned_data, min_max_values)
    print(f"\nPrepared {len(data_to_upsert)} items.")

    # Print sample data regardless of Pinecone initialization
    print("Sample of data prepared (first 3 items):")
    for i, item in enumerate(data_to_upsert[:3]):
        vector_preview = item['values'][:5]
        if len(item['values']) > 5: vector_preview.append("...")
        print(f"  Item {i+1}:")
        print(f"    ID: {item['id']}")
        print(f"    Vector (preview): {vector_preview}")
        print(f"    Metadata: {item['metadata']}")

    # Pinecone operations
    if pinecone: # Check if library was imported
        PINECONE_INDEX_NAME = 'nutrition-data'

        if not data_to_upsert:
            print("No data prepared for upsert. Skipping Pinecone operations.")
            return

        VECTOR_DIMENSION = len(data_to_upsert[0]['values'])

        print("\nAttempting Pinecone initialization...")
        pinecone_client = init_pinecone()

        if pinecone_client:
            index = get_or_create_pinecone_index(pinecone_client, PINECONE_INDEX_NAME, VECTOR_DIMENSION)
            if index:
                upsert_data_to_pinecone(index, data_to_upsert)
                print("\nData upsertion to Pinecone finished.")
                print("Final index stats:")
                try:
                    stats = index.describe_index_stats()
                    print(stats)
                except Exception as e:
                    print(f"Error fetching final index stats: {e}")
        # If pinecone_client is None, init_pinecone() already printed failure message
    else:
        print("\nPinecone library not imported. All Pinecone operations skipped.")

if __name__ == '__main__':
    main()
