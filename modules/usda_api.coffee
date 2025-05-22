# USDA FoodData Central API Module

apiKey = null

# Function to set the USDA API key
setApiKey = (key) ->
  apiKey = key
  console.log "USDA API Key set."

# Function to search for foods
# Takes a search query string as input
# Returns a promise that resolves with a list of food items
searchFoods = (query) ->
  return new Promise (resolve, reject) ->
    unless apiKey
      console.error "API key not set. Call setApiKey(key) first."
      return reject("API key not set.")

    encodedQuery = encodeURIComponent(query)
    url = "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{apiKey}&query=#{encodedQuery}"
    
    console.log "Searching for foods with query: #{query} at URL: #{url}"

    request = new Utils.HTTPRequest
      url: url
      method: "GET"

    request.on "success", (dataString) ->
      try
        parsedData = JSON.parse(dataString)
        resolve(parsedData.foods or []) # Resolve with foods array or empty if undefined
      catch e
        console.error "Error parsing JSON response for searchFoods:", e
        console.error "Raw response string:", dataString # Log raw response
        reject("Error parsing JSON response: #{e.message}")

    request.on "error", (error) ->
      console.error "Error searching foods for query '#{query}':", error
      reject(error)

# Function to fetch detailed information for a specific food item
# Takes an FDC ID and an optional array of nutrient numbers as input
# Returns a promise that resolves with the detailed food information
getFoodDetails = (fdcId, nutrientNumbersArray) ->
  return new Promise (resolve, reject) ->
    unless apiKey
      console.error "API key not set. Call setApiKey(key) first."
      return reject("API key not set.")
    unless fdcId
      console.error "FDC ID is required for getFoodDetails."
      return reject("FDC ID is required.")

    url = "https://api.nal.usda.gov/fdc/v1/food/#{fdcId}?api_key=#{apiKey}"

    if nutrientNumbersArray and nutrientNumbersArray.length > 0
      joinedNutrientNumbers = nutrientNumbersArray.join(",")
      url += "&nutrients=#{joinedNutrientNumbers}"
      
    console.log "Fetching details for FDC ID: #{fdcId} with nutrients: #{nutrientNumbersArray?.join(', ')} at URL: #{url}"

    request = new Utils.HTTPRequest
      url: url
      method: "GET"

    request.on "success", (dataString) ->
      try
        parsedData = JSON.parse(dataString)
        resolve(parsedData) # Resolve with the full food detail object
      catch e
        console.error "Error parsing JSON response for getFoodDetails (FDC ID: #{fdcId}):", e
        console.error "Raw response string:", dataString # Log raw response
        reject("Error parsing JSON response: #{e.message}")
        
    request.on "error", (error) ->
      console.error "Error fetching food details for FDC ID '#{fdcId}':", error
      reject(error)

# Function to get the current API key (for testing)
getApiKey = ->
  return apiKey

# Function to get a list of foods (paginated)
# Options can include: pageSize, pageNumber, sortBy, sortOrder
getFoodList = (options = {}) ->
  return new Promise (resolve, reject) ->
    unless apiKey
      console.error "API key not set. Call setApiKey(key) first."
      return reject("API key not set.")

    # Default options
    pageSize = options.pageSize or 20 # Default to 20 items per page
    pageNumber = options.pageNumber or 1 # Default to page 1
    
    url = "https://api.nal.usda.gov/fdc/v1/foods/list?api_key=#{apiKey}&pageSize=#{pageSize}&pageNumber=#{pageNumber}"

    # Append other options if provided
    if options.sortBy
      url += "&sortBy=#{encodeURIComponent(options.sortBy)}"
    if options.sortOrder
      url += "&sortOrder=#{encodeURIComponent(options.sortOrder)}"
      
    console.log "Fetching food list with options: #{JSON.stringify(options)} at URL: #{url}"

    request = new Utils.HTTPRequest
      url: url
      method: "GET"

    request.on "success", (dataString) ->
      try
        # The /foods/list endpoint returns an array directly
        parsedData = JSON.parse(dataString)
        resolve(parsedData or []) # Resolve with the array of AbridgedFoodItem or empty if undefined/null
      catch e
        console.error "Error parsing JSON response for getFoodList:", e
        console.error "Raw response string:", dataString
        reject("Error parsing JSON response: #{e.message}")

    request.on "error", (error) ->
      console.error "Error fetching food list:", error
      reject(error)

# Export functions to be used by other modules
module.exports = {
  setApiKey,
  getApiKey, # Added for testing
  searchFoods,
  getFoodDetails,
  getFoodList # Added new function
}
