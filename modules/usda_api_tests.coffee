# Test functions for usda_api.coffee

print "Loading usda_api_tests.coffee..."

# --- Mocking Framework for Utils.HTTPRequest ---
mockResponses = {}
originalHTTPRequest = Utils.HTTPRequest

class MockHTTPRequest
	constructor: (options) ->
		@options = options
		@listeners = {}
		# Ensure URL is captured for matching
		# print "MockHTTPRequest created for URL: #{@options.url}" 

	on: (event, callback) ->
		@listeners[event] = callback
		# Simulate async behavior for testing promises by trying to run simulateResponse
		# This makes sure the .then/.catch are set up before response simulation
		Utils.delay 0.001, => @simulateResponse() 

	simulateResponse: ->
		# print "Attempting to simulate response for URL: #{@options.url}"
		# print "Available mock responses:", Object.keys(mockResponses)
		
		# Find a matching mock response (can be a simple string match or regex for more complex patterns)
		# For now, assume exact URL match.
		urlToMatch = @options.url
		
		if mockResponses[urlToMatch]
			responseDetails = mockResponses[urlToMatch]
			# print "Mock response found for #{@options.url}:", responseDetails
			if responseDetails.error
				# print "Simulating error for #{@options.url}"
				@listeners["error"]?.(responseDetails.error)
			else
				# print "Simulating success for #{@options.url}"
				# Data should be stringified, as the original HTTPRequest would return a string
				responseData = JSON.stringify(responseDetails.success)
				@listeners["success"]?.(responseData)
		else
			print "ERROR: No mock response for #{@options.url}"
			@listeners["error"]?.("No mock response set for " + @options.url)

Utils.setMockResponse = (urlPattern, response) ->
	# print "Setting mock response for URL pattern: #{urlPattern}", response
	mockResponses[urlPattern] = response

Utils.startMocking = ->
	print "--- Starting HTTPRequest Mocking ---"
	Utils.HTTPRequest = MockHTTPRequest

Utils.stopMocking = ->
	print "--- Stopping HTTPRequest Mocking ---"
	Utils.HTTPRequest = originalHTTPRequest
	mockResponses = {} # Clear responses for next run

# --- End Mocking Framework ---

# Import the module to be tested
# Assuming usda_api_tests.coffee is in the same 'modules' folder as usda_api.coffee
usdaAPI = require "./usda_api"

# Helper to run tests sequentially
currentTestPromise = Promise.resolve()

runTest = (testName, testFn) ->
	currentTestPromise = currentTestPromise.then ->
		print "\n--- Running Test: #{testName} ---"
		new Promise (resolve, reject) ->
			testFn(resolve, reject)
	.catch (error) ->
		print "Unhandled error in test runner for #{testName}: #{error}"


# --- Test Functions ---

testSetApiKey = (resolve, reject) ->
	testKey = "TEST_KEY_FOR_API"
	usdaAPI.setApiKey(testKey)
	retrievedKey = usdaAPI.getApiKey()
	if retrievedKey is testKey
		print "testSetApiKey: PASSED"
		resolve()
	else
		print "testSetApiKey: FAILED. Expected '#{testKey}', got '#{retrievedKey}'"
		reject("testSetApiKey FAILED")

testSearchFoodsSuccess = (resolve, reject) ->
	usdaAPI.setApiKey("TEST_KEY_123") # Ensure API key is set for the test
	searchQuery = "test apple"
	expectedUrl = "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=TEST_KEY_123&query=#{encodeURIComponent(searchQuery)}"
	mockSuccessData = { foods: [{fdcId: 1, description: "Apple"}] }
	
	Utils.setMockResponse(expectedUrl, { success: mockSuccessData })
	
	usdaAPI.searchFoods(searchQuery)
		.then (results) ->
			if results and results.length is 1 and results[0].description is "Apple"
				print "testSearchFoodsSuccess: PASSED"
				resolve()
			else
				print "testSearchFoodsSuccess: FAILED. Unexpected results:", results
				reject("testSearchFoodsSuccess FAILED - Unexpected results")
		.catch (error) ->
			print "testSearchFoodsSuccess: FAILED with error:", error
			reject("testSearchFoodsSuccess FAILED - Promise rejected")

testSearchFoodsError = (resolve, reject) ->
	usdaAPI.setApiKey("TEST_KEY_123")
	searchQuery = "test orange error"
	expectedUrl = "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=TEST_KEY_123&query=#{encodeURIComponent(searchQuery)}"
	mockError = { message: "Network Error" }

	Utils.setMockResponse(expectedUrl, { error: mockError })

	usdaAPI.searchFoods(searchQuery)
		.then (results) ->
			print "testSearchFoodsError: FAILED. Promise should have rejected but resolved with:", results
			reject("testSearchFoodsError FAILED - Promise resolved")
		.catch (error) ->
			if error and error.message is "Network Error"
				print "testSearchFoodsError: PASSED. Promise rejected with correct error."
				resolve()
			else
				print "testSearchFoodsError: FAILED. Promise rejected with unexpected error:", error
				reject("testSearchFoodsError FAILED - Incorrect error")
				
testGetFoodDetailsSuccess = (resolve, reject) ->
	usdaAPI.setApiKey("TEST_KEY_123")
	fdcId = "food123"
	nutrientNumbers = ["205", "291"]
	expectedUrl = "https://api.nal.usda.gov/fdc/v1/food/#{fdcId}?api_key=TEST_KEY_123&nutrients=#{nutrientNumbers.join(',')}"
	mockSuccessData = { fdcId: fdcId, description: "Detailed Food", foodNutrients: [] }

	Utils.setMockResponse(expectedUrl, { success: mockSuccessData })

	usdaAPI.getFoodDetails(fdcId, nutrientNumbers)
		.then (details) ->
			if details and details.fdcId is fdcId and details.description is "Detailed Food"
				print "testGetFoodDetailsSuccess: PASSED"
				resolve()
			else
				print "testGetFoodDetailsSuccess: FAILED. Unexpected details:", details
				reject("testGetFoodDetailsSuccess FAILED - Unexpected details")
		.catch (error) ->
			print "testGetFoodDetailsSuccess: FAILED with error:", error
			reject("testGetFoodDetailsSuccess FAILED - Promise rejected")

testGetFoodDetailsNoNutrients = (resolve, reject) ->
	usdaAPI.setApiKey("TEST_KEY_123")
	fdcId = "food456_no_nutrients"
	expectedUrl = "https://api.nal.usda.gov/fdc/v1/food/#{fdcId}?api_key=TEST_KEY_123" # No nutrient params
	mockSuccessData = { fdcId: fdcId, description: "Food No Nutrients Specified" }

	Utils.setMockResponse(expectedUrl, { success: mockSuccessData })

	usdaAPI.getFoodDetails(fdcId) # Call without nutrientNumbersArray
		.then (details) ->
			if details and details.fdcId is fdcId
				print "testGetFoodDetailsNoNutrients: PASSED"
				resolve()
			else
				print "testGetFoodDetailsNoNutrients: FAILED. Unexpected details:", details
				reject("testGetFoodDetailsNoNutrients FAILED - Unexpected details")
		.catch (error) ->
			print "testGetFoodDetailsNoNutrients: FAILED with error:", error
			reject("testGetFoodDetailsNoNutrients FAILED - Promise rejected")

testGetFoodDetailsError = (resolve, reject) ->
	usdaAPI.setApiKey("TEST_KEY_123")
	fdcId = "food789_error"
	expectedUrl = "https://api.nal.usda.gov/fdc/v1/food/#{fdcId}?api_key=TEST_KEY_123"
	mockError = { message: "Food not found" }

	Utils.setMockResponse(expectedUrl, { error: mockError })

	usdaAPI.getFoodDetails(fdcId)
		.then (details) ->
			print "testGetFoodDetailsError: FAILED. Promise should have rejected but resolved with:", details
			reject("testGetFoodDetailsError FAILED - Promise resolved")
		.catch (error) ->
			if error and error.message is "Food not found"
				print "testGetFoodDetailsError: PASSED. Promise rejected with correct error."
				resolve()
			else
				print "testGetFoodDetailsError: FAILED. Promise rejected with unexpected error:", error
				reject("testGetFoodDetailsError FAILED - Incorrect error")

# --- Main Test Runner ---
runApiTests = ->
	print "\n===== Starting USDA API Tests ====="
	Utils.startMocking()
	
	currentTestPromise = Promise.resolve() # Reset promise chain for new run

	runTest "Set API Key", testSetApiKey
	runTest "Search Foods - Success", testSearchFoodsSuccess
	runTest "Search Foods - Error", testSearchFoodsError
	runTest "Get Food Details - Success (with nutrients)", testGetFoodDetailsSuccess
	runTest "Get Food Details - Success (no nutrients)", testGetFoodDetailsNoNutrients
	runTest "Get Food Details - Error", testGetFoodDetailsError
	
	currentTestPromise.then ->
		print "\n===== All USDA API Tests Completed ====="
		Utils.stopMocking()
	.catch (finalError) ->
		print "\n===== USDA API Tests Failed: #{finalError} ====="
		Utils.stopMocking()
	
	return currentTestPromise # Return promise for chaining if needed

module.exports = { runApiTests }

print "usda_api_tests.coffee loaded. Call runApiTests() to execute."
