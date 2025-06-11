import numpy as np
from sklearn.linear_model import LinearRegression

# Define the feature column names, matching the order in X_from_R_data (excluding the intercept column)
# This is for printing coefficients with names.
FEATURE_COLS = [
    'Protein', 'Lipid_Tot', 'Carbohydrt', 'Fiber_TD', 'Sugar_Tot',
    'Calcium_DV', 'Iron_DV', 'Sodium', 'Vit_C_DV', 'Vit_A_DV',
    'FA_Sat', 'Cholestrl'
]

# Hardcoded R-Generated Data
# X_from_R_data: 62 rows, 13 columns. First column is intercept.
# Corrected rows that previously had 14 elements by removing the last element.
X_from_R_data = [
  [1, 0.85, 81.11, 0.06, 0, 0.06, 2.4, 0.25, 576, 0, 312.375, 51.368, 215],
  [1, 21.4, 28.74, 2.34, 0, 0.5, 52.8, 3.875, 1395, 0, 95.375, 18.669, 75],
  [1, 25.96, 20.03, 3.83, 0, 0.6, 73.1, 3.125, 528, 0, 75.625, 10.877, 54],
  [1, 3.3, 1.98, 4.8, 0, 5.06, 12, 0.25, 47, 0.25, 23.75, 1.257, 8],
  [1, 3.57, 0.25, 5.02, 0, 5.02, 12.9, 0.625, 53, 1.25, 26.75, 0.162, 2],
  [1, 2.99, 1.9, 12.13, 0.7, 9.55, 10.9, 3, 66, 0, 28.375, 1.177, 8],
  [1, 12.57, 9.94, 0.78, 0, 0.77, 5.3, 22.875, 140, 0, 60.875, 3.1, 423],
  [1, 18.6, 15.06, 0, 0, 0, 1.1, 11.25, 70, 2, 17.5, 4.31, 75],
  [1, 21.39, 3.08, 0, 0, 0, 1.2, 11.125, 77, 2.875, 6.5, 0.79, 70],
  [1, 20.42, 8.02, 0, 0, 0, 1.5, 17.875, 65, 0, 0.75, 2.26, 68],
  [1, 3.02, 1.41, 7.84, 1.2, 1.67, 2.8, 13.75, 417, 6.375, 167.5, 0.88, 6],
  [1, 2.54, 1.52, 12, 1.7, 0.27, 0.9, 11.25, 4, 0, 0, 0.31, 0],
  [1, 5.5, 1, 88, 0.3, 31, 0.8, 225, 726, 25, 208.375, 0.3, 0],
  [1, 10.9, 4.7, 76, 7, 22, 4.5, 41.25, 241, 68.125, 286, 0.9, 0],
  [1, 0.26, 0.17, 13.81, 2.4, 10.39, 0.6, 1.5, 1, 5.75, 6.75, 0.028, 0],
  [1, 0.17, 0.1, 11.27, 1.1, 9.39, 0.4, 2.875, 2, 1.25, 3.625, 0.008, 0],
  [1, 1.4, 0.39, 11.12, 2, 9.24, 1.3, 4.875, 1, 12.5, 240.75, 0.027, 0],
  [1, 1.09, 0.33, 22.84, 2.6, 12.23, 0.5, 3.25, 1, 10.875, 8, 0.112, 0],
  [1, 1.06, 0.2, 16.01, 2.1, 12.82, 1.3, 4.5, 0, 8.75, 8, 0.038, 0],
  [1, 16.88, 21.19, 0, 0, 0, 0, 1.4, 11, 56, 0.875, 0.875, 7.87], # Corrected: 13 elements
  [1, 29.86, 8.11, 0, 0, 0, 0, 0.5, 17.375, 64, 1.25, 0.875, 2.93], # Corrected: 13 elements
  [1, 2.2, 0.12, 3.88, 2.1, 1.88, 2.4, 26.75, 2, 7, 94.5, 0.04, 0],
  [1, 1.83, 0.22, 6.97, 2.7, 3.26, 3.7, 12.875, 6, 15.25, 86.25, 0.05, 0],
  [1, 1.61, 0.17, 9.56, 2.8, 6.76, 1.6, 10, 78, 6.125, 4.125, 0.027, 0],
  [1, 2.82, 0.37, 6.64, 2.6, 1.7, 4.7, 9.125, 33, 111.5, 77.875, 0.039, 0],
  [1, 3.38, 0.3, 8.95, 3.8, 2.2, 4.2, 17.5, 25, 106.25, 94.25, 0.062, 0],
  [1, 0.93, 0.24, 9.58, 2.8, 4.74, 3.3, 3.75, 69, 7.375, 2088.25, 0.037, 0],
  [1, 3.09, 0.34, 3.26, 1, 1.98, 0.3, 6.25, 5, 2.625, 0, 0.05, 0],
  [1, 1.1, 0.1, 9.34, 1.7, 4.24, 2.3, 2.625, 4, 9.25, 0.25, 0.042, 0],
  [1, 1.68, 0.1, 15.71, 2.4, 1.15, 0.9, 6.5, 6, 24.625, 1, 0.025, 0],
  [1, 12.95, 6.8, 11.05, 4.2, 0, 0, 19.7, 44.375, 15, 36.25, 22.5, 0.786], # Corrected: 13 elements
  [1, 2.86, 0.39, 3.63, 2.2, 0.42, 9.9, 33.875, 79, 35.125, 1172.125, 0.063, 0],
  [1, 0.88, 0.2, 3.92, 1.2, 2.63, 1, 3.375, 5, 15.875, 104.125, 0.028, 0],
  [1, 20.72, 7.37, 0, 0, 0, 0, 0.5, 24, 79, 0, 0, 2.59], # Corrected: 13 elements
  [1, 0.09, 0, 10.42, 0, 10.19, 0.2, 0.25, 10, 0, 0, 0, 0],
  [1, 17.41, 0.97, 0.74, 0, 0, 0, 4.6, 4.625, 295, 4.375, 11.25, 0.132], # Corrected: 13 elements
  [1, 12.77, 0.97, 2.57, 0, 0, 0, 4.6, 174.75, 56, 16.25, 37.5, 0.094], # Corrected: 13 elements
  [1, 20.42, 13.42, 0, 0, 0, 0, 0.9, 4.25, 59, 4.875, 6.25, 3.05], # Corrected: 13 elements
  [1, 19.3, 6.04, 60.65, 17.4, 10.7, 10.5, 78, 24, 5, 8.375, 0.626, 0],
  [1, 6.24, 27.84, 63.64, 1.9, 53.96, 13.8, 10.5, 64, 1.625, 11.5, 17.99, 9],
  [1, 11, 5.7, 80, 5.3, 0.67, 15.9, 20, 419, 0.25, 13, 0.85, 0],
  [1, 9.64, 0.6, 83.76, 7.5, 3.69, 3.5, 44.625, 643, 11.625, 1.375, 0.15, 0],
  [1, 4.82, 5.56, 26.03, 0.2, 21.11, 15.5, 2.625, 73, 1.125, 61.125, 3.22, 53],
  [1, 8.7, 15.2, 71.6, 4.8, 0, 0, 15.9, 20.375, 1003, 0.25, 47.5, 2.91], # Corrected: 13 elements
  [1, 6.1, 15.5, 70.8, 4, 0, 0, 8.9, 32.125, 316, 0, 5.875, 9.18],    # Corrected: 13 elements
  [1, 9.8, 23.8, 62.3, 2.9, 0, 0, 4.1, 30, 283, 0.25, 2, 3.2],       # Corrected: 13 elements
  [1, 8.5, 12.1, 72.35, 10.7, 7.29, 35.7, 16, 1285, 26.75, 31.25, 2.1, 1],
  [1, 9.1, 3.5, 79.2, 2.8, 2.21, 3.6, 54, 289, 0, 0, 0.75, 0],
  [1, 8.2, 2.8, 81.5, 4.2, 0.88, 1.1, 18.625, 26, 0, 0, 0.57, 0],
  [1, 5.8, 0.93, 30.86, 1.8, 0.56, 0.7, 16, 1, 0, 0, 0.176, 0],
  [1, 8.38, 30.76, 57.54, 3.9, 0.26, 2, 59.125, 439, 0, 0.125, 4.384, 0],
  [1, 6.61, 0.58, 79.34, 0, 0, 0, 0.9, 10, 1, 0, 0, 0.158], # Corrected: 13 elements
  [1, 6, 17.74, 41.21, 1.4, 9.89, 5.3, 24, 428, 0, 0.625, 3.989, 0],
  [1, 7.14, 2.64, 14.44, 1.9, 5.04, 1.2, 9.375, 129, 6.25, 37.5, 0.87, 17],
  [1, 3.57, 2.78, 13.1, 0.8, 4.76, 6, 13.375, 393, 3, 24.75, 0.992, 8],
  [1, 17.88, 9.23, 59.58, 5.9, 27.3, 43.4, 65, 486, 24.125, 22.375, 4.687, 0],
  [1, 2.73, 1.3, 20.72, 1, 12.83, 8.6, 5.625, 58, 17.375, 7.375, 0.041, 5],
  [1, 4.6, 9.5, 53.3, 1.8, 4.85, 1.3, 6.375, 478, 0, 39.75, 1.398, 6],
  [1, 1.8, 10, 34.9, 1, 9.89, 0.8, 3.75, 325, 3.375, 25.125, 1.679, 0],
  [1, 4.4, 10.2, 72.02, 1.1, 33.7, 2.3, 43.75, 334, 0, 120.25, 1.69, 0],
  [1, 4.67, 10.56, 69.23, 1.1, 28.59, 1.1, 48.125, 334, 0, 128.5, 2.618, 0],
  [1, 5, 19, 49, 1, 28, 1.5, 12.5, 380, 0, 1.875, 4, 70]
]

y_from_R_data = [ # 62 values
  2, 3, 4.333333333, 6.833333333, 7.666666667, 5.666666667, 8, 8.066666667, 8.666666667, 8.9, 4.466666667, 6, 3.9, 5.6, 8.666666667, 6.8, 8.666666667, 8.333333333, 7.666666667, 7.333333333, 7.1, 9.5, 9.233333333, 8.566666667, 9.566666667, 9.566666667, 9.166666667, 8.833333333, 9.333333333, 7.3, 8.8, 9.6, 9.333333333, 7.3, 2, 6.333333333, 7.333333333, 7.933333333, 8.466666667, 1.333333333, 3.666666667, 3.2, 2.866666667, 2.766666667, 3.333333333, 3.5, 2.666666667, 3.666666667, 3.9,
  5.666666667, 5, 5.8, 3, 5.666666667, 3.466666667, 3.833333333, 4.333333333, 3.833333333, 3, 3.333333333, 3.4, 3.5
]

# Target R Coefficients for comparison
TARGET_R_COEFFICIENTS = {
    "(Intercept)": 0.990402610,
    "Protein": 0.036017814,
    "Lipid_Tot": -0.003467092,
    "Carbohydrt": 0.008032481,
    "Fiber_TD": 0.066520298,
    "Sugar_Tot": 0.003417181,
    "Calcium_DV": 0.001091842,
    "Iron_DV": 0.000340020,
    "Sodium": -0.000061385,
    "Vit_C_DV": 0.001533269,
    "Vit_A_DV": 0.000000012,
    "FA_Sat": -0.001243618,
    "Cholestrl": 0.000030670
}

def main():
    print("--- Using Hardcoded R-Generated Data for OLS Test ---")

    # Validate all rows in X_from_R_data have 13 elements
    for i, row in enumerate(X_from_R_data):
        if len(row) != 13:
            print(f"Error: Row {i} in X_from_R_data has {len(row)} elements, expected 13.")
            return

    # Convert to NumPy arrays
    X = np.array(X_from_R_data)
    y = np.array(y_from_R_data)

    print(f"Shapes for regression: X={X.shape}, y={y.shape}")

    if X.shape[0] != y.shape[0]:
        print(f"Error: Row mismatch between X ({X.shape[0]}) and y ({y.shape[0]}) data.")
        return
    # X.shape[1] should be 13 (1 intercept + 12 features)
    if X.shape[1] != len(FEATURE_COLS) + 1:
        print(f"Error: Column count mismatch in X. Expected {len(FEATURE_COLS) + 1} (features + intercept), got {X.shape[1]}.")
        return


    # Fit Linear Regression Model
    # Since X_from_R_data already includes the intercept column, set fit_intercept=False
    print("\nFitting Linear Regression model (fit_intercept=False)...")
    model = LinearRegression(fit_intercept=False)
    model.fit(X, y)

    # Extract and Print Coefficients
    # model.coef_ will contain all coefficients, including the one for the intercept column
    coefficients_sklearn = model.coef_ # Renamed to avoid confusion with any other 'coefficients' variable

    print("\nCalculated Coefficients (Python - scikit-learn with hardcoded R data):")
    print(f"Intercept (from X's first column): {coefficients_sklearn[0]}")
    print("Feature Coefficients:")
    for i, feature_name in enumerate(FEATURE_COLS):
        print(f"  {feature_name}: {coefficients_sklearn[i+1]}") # i+1 because coefficients_sklearn[0] is the intercept

    print(f"\nNumber of rows used in regression: {X.shape[0]}")

    print("\n--- Target R Coefficients (for comparison) ---")
    # Print target coefficients in the same order for easier comparison
    print(f"// (Intercept)  {TARGET_R_COEFFICIENTS['(Intercept)']}")
    for name in FEATURE_COLS:
        print(f"// {name:<12} {TARGET_R_COEFFICIENTS[name]}")

if __name__ == '__main__':
    main()
