# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: "NutritionUp"
	author: "Lois Yang"
	twitter: ""
	description: ""

# Import USDA API module
usdaAPI = require "modules/usda_api"
usdaAPI.setApiKey("DEMO_KEY") # TODO: Replace with a real API key mechanism

# Import file "Screens- for David"
s = Framer.Importer.load("imported/Screens- for David@1x")

s.Start_Screen.x = 0
s.Start_Screen.y = 0
s.Food_Nutrient_Blueberry_Muffin.sendToBack()

#Onboarding screen (no animations)
s.NutritionUp.onTouchStart ->
	s.Start_Screen.sendToBack()
	s.Onboarding_1.x = 0
	s.Onboarding_1.y = 0
	Utils.delay 2, ->
		s.Onboarding_1.sendToBack()
		s.Onboarding_2.x = 0
		s.Onboarding_2.y = 0
	Utils.delay 4, ->
		s.Onboarding_2.sendToBack()
		s.Onboarding_3.x = 0
		s.Onboarding_3.y = 0

#Questionnaire screens
s.CTA.onTouchStart ->
	s.CTA.animate
		properties:
			opacity: 0.5
			scale: 0.75
		time: 0.2
		curve: "ease-in-out"

s.CTA.onTouchEnd ->
	s.Onboarding_3.sendToBack()
	s.CTA.animate
		properties:
			opacity: 1.0
			scale: 1.0
		time: 0.15
		curve: "ease-in-out"
	s.Q0.x = 0
	s.Q0.y = 0

s.Button_23.onTouchEnd ->
	s.Food_Nutrient_Blueberry_Muffin.sendToBack()
	s.Main.x = 0
	s.Main.y = 0
	s.Tab_Bar.y = 1334-98
	s.Tab_Bar.x = 0
	s.Q0.animate
		properties:
			opacity: 0
			scale: 0
		time: 2
		curve: "ease-in-out"
	Utils.delay 1.5, ->
		s.Q0.sendToBack()
		bg = new BackgroundLayer
			backgroundColor: "#e6e6e6"
		bg.bringToFront()
		s.Main.bringToFront()
		s.Tab_Bar.bringToFront()

		scrollFrame = new ScrollComponent
			y: 39
			height: 1334 - 98 - 39
			width: 750
		scrollFrame.scrollHorizontal = false
		s.ScrollContent.x = 0
		s.ScrollContent.y = 0
		s.ScrollContent.scrollVertical = true
		s.ScrollContent.scrollHorizontal = false
		s.ScrollContent.height = 1794-39
		s.ScrollContent.width = 750
		s.ScrollContent.superLayer = scrollFrame.content
	
	
s.Button_13.onTouchStart ->
	s.Button_13.animate
		properties:
			opacity: 0.5
			scale: 0.75
		time: 0.2
		curve: "ease-in-out"

s.Button_13.onTouchEnd ->
	s.Q0.sendToBack()
	s.Q1.x = 0
	s.Q1.y = 0
	s.Button_active5.opacity = 0
	
s.Button_12.onTouchStart ->
	s.Button_12.animate
		properties:
			backgroundColor: "#93CCEA"
	s.Button_inactive5.opacity = 0
	s.Button_active5.opacity = 1
			
s.Button_active5.onTouchStart ->
	s.Button_active5.animate
		properties:
			opacity: 0.15
		
s.Button_active5.onTouchEnd ->
	s.Q1.sendToBack()
	s.Q2.x = 0
	s.Q2.y = 0
	s.Button_active4.opacity = 0
	
s.Active_Date.onTouchStart ->
	s.Cursor2.opacity = 0
	s.Button_inactive4.opacity = 0
	s.Button_active4.opacity = 1

s.Button_active4.onTouchStart ->
	s.Button_active4.animate
		properties:
			opacity: 0.15
			
s.Button_active4.onTouchEnd ->
	s.Q2.sendToBack()
	s.Q3.x = 0
	s.Q3.y = 0
	s.Button_active3.opacity = 0
	
s.Phone_Pad_Light1.onTouchStart ->
	s.Button_active3.opacity = 1
	s.Button_inactive3.opacity = 0
	
s.Button_active3.onTouchStart ->
	s.Button_active3.animate
		properties:
			opacity: 0.15
	
s.Button_active3.onTouchEnd ->
	s.Q3.sendToBack()
	s.Q4.x = 0
	s.Q4.y = 0
	s.Button_active2.opacity = 0

s.Phone_Pad_Light.onTouchStart ->
	s.Button_active2.opacity = 1
	s.Button_inactive2.opacity = 0
	s.Cursor.opacity = 0

s.Button_active2.onTouchStart ->
	s.Button_active2.animate
		properties:
			opacity: 0.15

s.Button_active2.onTouchEnd ->
	s.Q4.sendToBack()
	s.Q5.x = 0
	s.Q5.y = 0
	s.Button_active1.opacity = 0

s.Button_11.onTouchStart ->
	s.Button_11.animate
		properties:
			backgroundColor: "#93CCEA"
	s.Button_inactive1.opacity = 0
	s.Button_active1.opacity = 1

s.Button_active1.onTouchStart ->
	s.Button_active1.animate
		properties:
			opacity: 0.15

s.Button_active1.onTouchEnd ->
	s.Q5.sendToBack()
	s.Q6.x = 0
	s.Q6.y = 0
	s.Button_active.opacity = 0

s.Button_3.onTouchStart -> 
	s.Button_3.animate
		properties:
			backgroundColor: "#93CCEA"
	s.Button_inactive.opacity = 0
	s.Button_active.opacity = 1
	
s.Button_active.onTouchStart -> 
	s.Q6.sendToBack()
	s.Main.x = 0
	s.Main.y = 0
	bg = new BackgroundLayer
		backgroundColor: "#e6e6e6"
	bg.bringToFront()
	s.Main.bringToFront()
	s.Tab_Bar.bringToFront()
	
	s.Tab_Bar.y = 1334-98
	s.Tab_Bar.x = 0
	scrollFrame = new ScrollComponent
		y: 39
		height: 1334 - 98 - 39
		width: 750
	scrollFrame.scrollHorizontal = false
	s.ScrollContent.x = 0
	s.ScrollContent.y = 0
	s.ScrollContent.scrollVertical = true
	s.ScrollContent.scrollHorizontal = false
	s.ScrollContent.height = 1794-39
	s.ScrollContent.width = 750
	s.ScrollContent.superLayer = scrollFrame.content

# --- Test Function for Filtering Logic ---
testFilteringLogic = ->
	print "\n===== Starting Filtering Logic Tests ====="

	# Sample Data (Nutrient IDs are numbers in the actual API response for foodNutrients[].nutrient.id)
	food1 = 
		description: "Test Food 1 - Low Carb, High Fiber, Low Sugar"
		fdcId: 1
		foodNutrients: [
			{ nutrient: { id: 205, name: "Carbohydrate, by difference", unitName: "G" }, amount: 10 }, # Carbs
			{ nutrient: { id: 291, name: "Fiber, total dietary", unitName: "G" }, amount: 15 },      # Fiber
			{ nutrient: { id: 269, name: "Sugars, total including NLEA", unitName: "G" }, amount: 2 } # Sugars
		]
	food2 = # High Carb
		description: "Test Food 2 - High Carb"
		fdcId: 2
		foodNutrients: [
			{ nutrient: { id: 205, name: "Carbohydrate, by difference", unitName: "G" }, amount: 100 },
			{ nutrient: { id: 291, name: "Fiber, total dietary", unitName: "G" }, amount: 5 },
			{ nutrient: { id: 269, name: "Sugars, total including NLEA", unitName: "G" }, amount: 10 }
		]
	food3 = # Low Fiber
		description: "Test Food 3 - Low Fiber"
		fdcId: 3
		foodNutrients: [
			{ nutrient: { id: 205, name: "Carbohydrate, by difference", unitName: "G" }, amount: 30 },
			{ nutrient: { id: 291, name: "Fiber, total dietary", unitName: "G" }, amount: 1 },
			{ nutrient: { id: 269, name: "Sugars, total including NLEA", unitName: "G" }, amount: 10 }
		]
	food4 = # High Sugar
		description: "Test Food 4 - High Sugar"
		fdcId: 4
		foodNutrients: [
			{ nutrient: { id: 205, name: "Carbohydrate, by difference", unitName: "G" }, amount: 30 },
			{ nutrient: { id: 291, name: "Fiber, total dietary", unitName: "G" }, amount: 5 },
			{ nutrient: { id: 269, name: "Sugars, total including NLEA", unitName: "G" }, amount: 30 }
		]
	food5 = # Missing Carb data
		description: "Test Food 5 - Missing Carb"
		fdcId: 5
		foodNutrients: [
			{ nutrient: { id: 291, name: "Fiber, total dietary", unitName: "G" }, amount: 5 },
			{ nutrient: { id: 269, name: "Sugars, total including NLEA", unitName: "G" }, amount: 10 }
		]
	food6 = # All values null (should pass if filters allow nulls, i.e., filter not active)
		description: "Test Food 6 - All Nutrients Null"
		fdcId: 6
		foodNutrients: [
			{ nutrient: { id: 205, name: "Carbohydrate, by difference", unitName: "G" }, amount: null },
			{ nutrient: { id: 291, name: "Fiber, total dietary", unitName: "G" }, amount: null },
			{ nutrient: { id: 269, name: "Sugars, total including NLEA", unitName: "G" }, amount: null }
		]
	food7 = # All values good, should pass most strict filters
		description: "Test Food 7 - All Good"
		fdcId: 7
		foodNutrients: [
			{ nutrient: { id: 205, name: "Carbohydrate, by difference", unitName: "G" }, amount: 20 },
			{ nutrient: { id: 291, name: "Fiber, total dietary", unitName: "G" }, amount: 10 },
			{ nutrient: { id: 269, name: "Sugars, total including NLEA", unitName: "G" }, amount: 5 }
		]
	
	sampleFoods = [food1, food2, food3, food4, food5, food6, food7]

	testCases = [
		{ name: "All filters active (Strict)", filters: { maxCarbs: 50, minFiber: 5, maxSugars: 15 }, expected: ["Test Food 1 - Low Carb, High Fiber, Low Sugar", "Test Food 7 - All Good"] },
		{ name: "Only maxCarbs active", filters: { maxCarbs: 25, minFiber: null, maxSugars: null }, expected: ["Test Food 1 - Low Carb, High Fiber, Low Sugar", "Test Food 7 - All Good"] }, # Food5 missing carbs fails, Food6 null carbs passes
		{ name: "Only minFiber active", filters: { maxCarbs: null, minFiber: 10, maxSugars: null }, expected: ["Test Food 1 - Low Carb, High Fiber, Low Sugar", "Test Food 7 - All Good"] },
		{ name: "Only maxSugars active", filters: { maxCarbs: null, minFiber: null, maxSugars: 5 }, expected: ["Test Food 1 - Low Carb, High Fiber, Low Sugar", "Test Food 7 - All Good"] },
		{ name: "No filters active (all not null should pass, nulls also pass)", filters: { maxCarbs: null, minFiber: null, maxSugars: null }, expected: ["Test Food 1 - Low Carb, High Fiber, Low Sugar", "Test Food 2 - High Carb", "Test Food 3 - Low Fiber", "Test Food 4 - High Sugar", "Test Food 5 - Missing Carb", "Test Food 6 - All Nutrients Null", "Test Food 7 - All Good"] },
		{ name: "Filters that should exclude foods with missing data (e.g. maxCarbs: 100, food5 has no carbs)", filters: { maxCarbs: 100, minFiber: null, maxSugars: null }, expected: ["Test Food 1 - Low Carb, High Fiber, Low Sugar", "Test Food 3 - Low Fiber", "Test Food 4 - High Sugar", "Test Food 7 - All Good"] }, # Food2 (100 carbs) passes, Food5 (missing carbs) fails. Food6 (null carbs) passes as `carbs <= 100` is true for null.
		{ name: "Filters that should exclude foods with null data if condition is strict (e.g. minFiber: 0, food6 has null fiber)", filters: { maxCarbs: null, minFiber: 0, maxSugars: null }, expected: ["Test Food 1 - Low Carb, High Fiber, Low Sugar", "Test Food 2 - High Carb", "Test Food 3 - Low Fiber", "Test Food 4 - High Sugar", "Test Food 5 - Missing Carb", "Test Food 7 - All Good"] } # Food6 (null fiber) fails `fiber >= 0`.
	]

	for tc in testCases
		print "\n--- Testing Case: #{tc.name} ---"
		print "Filters: ", JSON.stringify(tc.filters)
		filteredResults = filterDetailedFoods(sampleFoods, tc.filters)
		
		resultDescriptions = (food.description for food in filteredResults)
		print "Passed Foods (#{resultDescriptions.length}):"
		for desc in resultDescriptions
			print "  - #{desc}"

		# Simple assertion for logging
		expectedSet = new Set(tc.expected)
		resultSet = new Set(resultDescriptions)
		passed = expectedSet.size is resultSet.size and tc.expected.every((item) -> resultSet.has(item))

		if passed
			print "VERDICT: PASSED"
		else
			print "VERDICT: FAILED"
			print "  Expected (#{expectedSet.size}): ", JSON.stringify(tc.expected)
			print "  Actual (#{resultSet.size}): ", JSON.stringify(resultDescriptions)
			# Find differences
			missing = tc.expected.filter (item) -> not resultSet.has(item)
			extra = resultDescriptions.filter (item) -> not expectedSet.has(item)
			if missing.length > 0
				print "  Missing from actual: ", JSON.stringify(missing)
			if extra.length > 0
				print "  Extra in actual: ", JSON.stringify(extra)

	print "\n===== Filtering Logic Tests Completed ====="

# --- Expose Test Functions to Window for Console Execution ---
# Import API tests from the module
apiTests = require "./modules/usda_api_tests"

window.runAPITests = apiTests.runApiTests
window.runFilteringTests = testFilteringLogic

# Optionally, run tests automatically after a delay for quick feedback during development
# Utils.delay 2, ->
# 	window.runAPITests().then ->
# 		window.runFilteringTests()

s.Color_Selector.onTouchEnd ->
	bg = new BackgroundLayer
		backgroundColor: "#e6e6e6"
	s.Main.sendToBack()
		
	s.Tab_Bar.y = 1334-98
	s.Tab_Bar.x = -750
	
	s.Search_1.sendToBack()
	s.Search_2.sendToBack()
	s.Food_Nutrient_Blueberry_Muffin.bringToFront()
	s.Food_Nutrient_Blueberry_Muffin.x = 0
	s.Food_Nutrient_Blueberry_Muffin.y = -2500
	
	s.Scan.animate
		properties:
			brightness: 200
		Utils.delay 2, ->
			s.Scan.animate
				properties:
					y: 1334
				time: 1
			s.Food_Nutrient_Blueberry_Muffin.animate
				properties:
					y: 0
				time: 1
			s.Tab_Bar.animate
				properties:
					x: 0
				time: 1
	Utils.delay 3, ->
		s.Scan.sendToBack()
		bg.bringToFront()
		s.Tab_Bar.bringToFront()
		s.Tab_Bar.y = 1334-98
		s.Tab_Bar.x = 0
		scrollFrame2 = new ScrollComponent
			y: 0
			height: 1334 - 98
			width: 750
		scrollFrame2.scrollHorizontal = false
	
		s.Food_Nutrient_Blueberry_Muffin.x = 0
		s.Food_Nutrient_Blueberry_Muffin.y = 0
		s.Food_Nutrient_Blueberry_Muffin.scrollVertical = true
		s.Food_Nutrient_Blueberry_Muffin.scrollHorizontal = false
		s.Food_Nutrient_Blueberry_Muffin.height = 2128
		s.Food_Nutrient_Blueberry_Muffin.width = 750
		s.Food_Nutrient_Blueberry_Muffin.superLayer = scrollFrame2.content
	
s.Scan_inactive.onTouchEnd ->
	s.Main.sendToBack()
	s.Scan.bringToFront()
	s.Scan.x = 0
	s.Scan.y = 0
	
s.Scan_active.onTouchEnd ->
	s.Main.sendToBack()
	s.Scan.bringToFront()
	s.Scan.x = 0
	s.Scan.y = 0

s.Search_inactive.onTouchEnd ->
	s.Main.sendToBack()
	bg = new BackgroundLayer
		backgroundColor: "#e6e6e6"
	bg.bringToFront()
	s.Search_1.bringToFront()
	s.Tab_Bar.bringToFront()
	
	s.Tab_Bar.y = 1334-98
	s.Tab_Bar.x = 0
	
	scrollFrame3 = new ScrollComponent
		y: 0
		height: 1334 - 98
		width: 750
	scrollFrame3.scrollHorizontal = false
	
	s.Search_1.x = 0
	s.Search_1.y = 0
	s.Search_1.scrollVertical = true
	s.Search_1.scrollHorizontal = false
	s.Search_1.height = 1794-39
	s.Search_1.width = 750
	s.Search_1.superLayer = scrollFrame3.content

	# Create and configure the search input field
	searchInput = new InputField
		superLayer: s.Search_1 # Add to s.Search_1
		x: 50
		y: 150 # Position below the existing Search_Bar_Dark
		width: s.Search_1.width - 100
		height: 60
		placeholderText: "Search for a food..."
		backgroundColor: "#FFFFFF"
		textColor: "#000000"
		fontSize: 28
		style:
			"border-radius": "10px"
			"padding": "10px"

	# Nutrient filter input fields
	filterYStart = searchInput.y + searchInput.height + 20
	filterHeight = 50
	filterPadding = 10

	carbInput = new InputField
		superLayer: s.Search_1
		x: searchInput.x
		y: filterYStart
		width: (searchInput.width - (filterPadding * 2)) / 3
		height: filterHeight
		placeholderText: "Max Carbs (g)"
		keyboardType: "decimal"
		backgroundColor: "#FFFFFF"
		textColor: "#000000"
		fontSize: 24
		style: { "border-radius": "8px", "padding": "8px" }

	fiberInput = new InputField
		superLayer: s.Search_1
		x: carbInput.x + carbInput.width + filterPadding
		y: filterYStart
		width: carbInput.width
		height: filterHeight
		placeholderText: "Min Fiber (g)"
		keyboardType: "decimal"
		backgroundColor: "#FFFFFF"
		textColor: "#000000"
		fontSize: 24
		style: { "border-radius": "8px", "padding": "8px" }

	sugarInput = new InputField
		superLayer: s.Search_1
		x: fiberInput.x + fiberInput.width + filterPadding
		y: filterYStart
		width: carbInput.width # Same width as carbInput
		height: filterHeight
		placeholderText: "Max Sugars (g)"
		keyboardType: "decimal"
		backgroundColor: "#FFFFFF"
		textColor: "#000000"
		fontSize: 24
		style: { "border-radius": "8px", "padding": "8px" }

	# Scrollable area for results
	resultsScrollY = sugarInput.y + sugarInput.height + 20
	resultsScroll = new ScrollComponent
		superLayer: s.Search_1
		x: 50
		y: resultsScrollY
		width: s.Search_1.width - 100
		# Adjust height: consider Tab_Bar height (98) and some padding from bottom of s.Search_1
		# s.Search_1.height is 1794-39, but it's inside scrollFrame3 (height: 1334 - 98)
		# Effective height for s.Search_1 content area is scrollFrame3.height
		# Let's assume s.Search_1 itself is the direct container for resultsScroll.
		# The parent scrollFrame3 has height 1334-98.
		# s.Search_1 is put into scrollFrame3.content.
		# So resultsScroll should be within the visible area of s.Search_1.
		# The search bar for s.Search_1 (s.Search_Bar_Dark) is at y=0 of s.Search_1.
		# The actual visible height for s.Search_1 content is managed by scrollFrame3.
		# Let's make it relative to s.Search_1's visual viewport provided by scrollFrame3.
		# Height of scrollFrame3 is 1334 - 98.
		# Tab_Bar.y is 1334-98, so the bottom of the screen for main content.
		# s.Search_1 is put into scrollFrame3. So it can scroll within that height.
		# Let's calculate remaining height within the typical screen height minus TabBar.
		height: (1334 - 98) - resultsScrollY - 20 # 20 for bottom padding
		scrollHorizontal: false
		# For debugging, make content visible:
		# content:
		# 	backgroundColor: "rgba(0,255,0,0.1)"


	placeholderMessage = new TextLayer
		superLayer: resultsScroll.content
		text: "Search for foods and apply filters to see results here."
		fontSize: 24
		color: "#888888"
		textAlign: "center"
		width: resultsScroll.width - 40 # Padding
		x: 20
		y: 50
		height: 100 # Allow for text wrapping
		autoHeight: true # Framer property to adjust height to content

	resultsScroll.content.height = placeholderMessage.y + placeholderMessage.height + 50 # Ensure placeholder is visible

# --- Helper function to find nutrient value by ID ---
# Moved to top-level for testability and reuse
getNutrientValue = (foodDetail, nutrientId) ->
	# Ensure foodDetail and foodDetail.foodNutrients are defined
	unless foodDetail and foodDetail.foodNutrients
		return null
	
	targetNutrient = _.find foodDetail.foodNutrients, (nutrientEntry) ->
		# nutrientEntry.nutrient.id should be the path for the nutrient ID
		# nutrientId is expected to be a number (e.g., 205, 291, 269)
		# The FDC API uses number for nutrient.id in foodNutrient objects
		nutrientEntry and nutrientEntry.nutrient and nutrientEntry.nutrient.id is nutrientId
	
	return if targetNutrient then targetNutrient.amount else null # amount or value

# --- Standalone Filtering Logic ---
# Extracted for testability and clarity
filterDetailedFoods = (detailedFoods, filters) ->
	# detailedFoods: array of food objects from getFoodDetails
	# filters: object like { maxCarbs, minFiber, maxSugars }
	
	return detailedFoods.filter (detailedFood) ->
		carbs = getNutrientValue(detailedFood, 205) # 205 for Carbohydrate, by difference
		fiber = getNutrientValue(detailedFood, 291) # 291 for Fiber, total dietary
		sugars = getNutrientValue(detailedFood, 269) # 269 for Sugars, total including NLEA

		# print "Filtering Food: #{detailedFood.description}, Carbs: #{carbs}, Fiber: #{fiber}, Sugars: #{sugars}"
		# print "With Filters: MaxCarbs: #{filters.maxCarbs}, MinFiber: #{filters.minFiber}, MaxSugars: #{filters.maxSugars}"

		passesCarbs = if filters.maxCarbs? then (carbs? and carbs <= filters.maxCarbs) else true
		passesFiber = if filters.minFiber? then (fiber? and fiber >= filters.minFiber) else true
		passesSugars = if filters.maxSugars? then (sugars? and sugars <= filters.maxSugars) else true
		
		# print "Passes: Carbs=#{passesCarbs}, Fiber=#{passesFiber}, Sugars=#{passesSugars}"
		return passesCarbs and passesFiber and passesSugars

	# Handle search submission
	searchInput.on "submit", ->
		searchText = searchInput.value
		print "User searched for: #{searchText}"

		# Get filter values (convert empty strings to null, then to float)
		maxCarbsVal = carbInput.value.trim()
		minFiberVal = fiberInput.value.trim()
		maxSugarsVal = sugarInput.value.trim()

		maxCarbs = if maxCarbsVal isnt "" then parseFloat(maxCarbsVal) else null
		minFiber = if minFiberVal isnt "" then parseFloat(minFiberVal) else null
		maxSugars = if maxSugarsVal isnt "" then parseFloat(maxSugarsVal) else null
		
		print "Applied filters - Max Carbs: #{maxCarbs}, Min Fiber: #{minFiber}, Max Sugars: #{maxSugars}"

		usdaAPI.searchFoods(searchText)
			.then (initialResults) ->
				print "Initial search results count: #{initialResults.length}"
				print initialResults

				unless initialResults and initialResults.length > 0
					print "No initial search results found for '#{searchText}'."
					resultsScroll.content.destroyChildren() # Clear placeholder or previous results
					noInitialResultsMessage = new TextLayer
						superLayer: resultsScroll.content
						text: "No foods found for '#{searchText}'.\nTry a different search term or check for typos."
						fontSize: 24
						color: "#555555"
						textAlign: "center"
						width: resultsScroll.width - 40
						x: 20
						y: 50
						autoHeight: true
					resultsScroll.content.height = noInitialResultsMessage.y + noInitialResultsMessage.height + 50
					return

				detailedFoodsResults = []
				errorsFetchingDetails = []
				detailsToFetch = initialResults.length

				if detailsToFetch is 0
					print "No results to fetch details for."
					# Placeholder: Update UI if needed
					return

				processAndFilterResults = ->
					print "All details fetched. Total detailed results: #{detailedFoodsResults.length}"
					
					# Use the extracted filtering function
					currentFilters = { 
						maxCarbs: maxCarbs, 
						minFiber: minFiber, 
						maxSugars: maxSugars 
					}
					filteredFoods = filterDetailedFoods(detailedFoodsResults, currentFilters)
					
					print "Filtered foods count: #{filteredFoods.length}"
					# print "Filtered foods results:" # Avoid logging full objects to keep console clean
					
					resultsScroll.content.destroyChildren() # Clear previous results & placeholder
					
					if filteredFoods.length is 0
						noResultsMessage = new TextLayer
							superLayer: resultsScroll.content
							text: "No matching foods found. Try adjusting your search or filters."
							fontSize: 24
							color: "#555555" # Darker grey for better readability
							textAlign: "center"
							width: resultsScroll.width - 40 # Padding
							x: 20
							y: 50
							autoHeight: true
						resultsScroll.content.height = noResultsMessage.y + noResultsMessage.height + 50 # Give some space for the message
						return

					currentY = 15 # Initial top padding for the first item
					itemPadding = 15 # Padding between items
					itemBaseHeight = 130 # Base height for each item layer, can adjust

					for food in filteredFoods
						foodLayer = new Layer
							superLayer: resultsScroll.content
							x: 10 # Side padding for the layer itself
							y: currentY
							width: resultsScroll.width - 20 # Accommodate side padding
							height: itemBaseHeight 
							backgroundColor: "#FFFFFF"
							borderRadius: 10
							shadowY: 2, shadowBlur: 5, shadowColor: "rgba(0,0,0,0.15)"

						# Food Description
						descriptionText = new TextLayer
							superLayer: foodLayer
							text: food.description or "N/A"
							x: 15, y: 10
							width: foodLayer.width - 30 # Padding within the foodLayer
							height: 45 # Allow for approx 2 lines
							fontSize: 22
							fontWeight: "500" # Slightly bolder for emphasis
							color: "#2C3E50" # Dark blue/grey for good contrast
							lineHeight: 1.2 # Improve readability for wrapped text
							style:
								"overflow": "hidden"
								"text-overflow": "ellipsis"
								# "display": "-webkit-box" # For multi-line ellipsis (might need vendor prefixes)
								# "-webkit-line-clamp": "2"
								# "-webkit-box-orient": "vertical"
						# Adjust height if Framer supports text truncation or auto height for TextLayer with fixed lines
						# For simplicity, we'll stick to a fixed height and ellipsis

						# Nutrient display: Carbs, Fiber, Sugars
						nutrientYPos = descriptionText.y + descriptionText.height + 10 # Space below description
						nutrientValueFontSize = 24 # Larger font for nutrient values
						nutrientLabelFontSize = 20 # Smaller for "Carbs:", "Fiber:", "Sugars:"
						nutrientSectionWidth = (foodLayer.width - 40) / 3 # 3 sections, with padding

						# Helper to create nutrient text group (Label + Value)
						createNutrientText = (labelText, value, unit, xPos) ->
							valueStr = if value? then "#{value}#{unit}" else "N/A"
							
							label = new TextLayer
								superLayer: foodLayer
								text: labelText
								x: xPos, y: nutrientYPos
								width: nutrientSectionWidth
								height: 25 # Height for the label
								fontSize: nutrientLabelFontSize
								color: "#7F8C8D" # Medium grey for label
							
							valText = new TextLayer
								superLayer: foodLayer
								text: valueStr
								x: xPos, y: nutrientYPos + label.height - 2 # Position value below label
								width: nutrientSectionWidth
								height: 30 # Height for the value
								fontSize: nutrientValueFontSize
								fontWeight: "600" # Bold for value
								color: "#E74C3C" # A distinct color for values, e.g., red (adjust as needed for diabetes app context)

						carbsValue = getNutrientValue(food, 205)
						fiberValue = getNutrientValue(food, 291)
						sugarsValue = getNutrientValue(food, 269)

						createNutrientText("Carbs", carbsValue, "g", 20)
						createNutrientText("Fiber", fiberValue, "g", 20 + nutrientSectionWidth)
						createNutrientText("Sugars", sugarsValue, "g", 20 + nutrientSectionWidth * 2)
						
						currentY += itemBaseHeight + itemPadding

					resultsScroll.content.height = currentY # Update scroll content height
					resultsScroll.scrollToTop(false) # Scroll to top (not animated)

				# Fetch details for each food item
				nutrientIdsToFetch = ["205", "291", "269"] # String IDs as per task for API call
				
				for foodItem in initialResults
					unless foodItem.fdcId
						detailsToFetch--
						if detailsToFetch is 0
							processAndFilterResults()
						continue

					usdaAPI.getFoodDetails(foodItem.fdcId, nutrientIdsToFetch)
						.then (detailedFood) ->
							detailedFoodsResults.push(detailedFood)
							detailsToFetch--
							if detailsToFetch is 0
								processAndFilterResults()
						.catch (error) ->
							print "Error fetching details for FDC ID #{foodItem.fdcId}: #{error}"
							errorsFetchingDetails.push({fdcId: foodItem.fdcId, error: error})
							detailsToFetch--
							if detailsToFetch is 0
								processAndFilterResults()
			.catch (error) ->
				print "Error during initial food search: #{error}"
				resultsScroll.content.destroyChildren() # Clear placeholder or previous results
				searchErrorMessage = new TextLayer
					superLayer: resultsScroll.content
					text: "Search Error:\n#{error.message or 'An unknown error occurred.'}\n\nPlease check your connection or try again."
					fontSize: 24
					color: "#E74C3C" # Error color (red)
					textAlign: "center"
					width: resultsScroll.width - 40
					x: 20
					y: 50
					autoHeight: true
				resultsScroll.content.height = searchErrorMessage.y + searchErrorMessage.height + 50

s.Search_Bar_Dark.onTouchEnd ->
	s.Search_2.x = -750
	s.Search_2.y = 0
	s.Search_2.bringToFront()
	s.Search_1.animate
		properties:
			x: -750
		time: .5
	s.Search_2.animate
		properties:
			x: 0
		time: .5
	Utils.delay .5, ->
		s.Search_1.sendToBack()
		s.Search_2.x = 0
		s.Search_2.y = 0

s.Search_Bar_Active_Dark.onTouchEnd ->
	s.Search_1.x = -750
	s.Search_1.y = 0
	s.Search_1.bringToFront()
	s.Search_2.animate
		properties:
			x: -750
		time: .5
	s.Search_1.animate
		properties:
			x: 0
		time: .5
	Utils.delay .5, ->
		s.Search_2.sendToBack()
		s.Search_1.x = 0
		s.Search_1.y = 0
	
s.Home_inactive.onTouchEnd ->
	s.Scan.sendToBack()
	s.Search_1.sendToBack()
	s.Search_2.sendToBack()
	
	s.Main.x = 0
	s.Main.y = 0
	bg = new BackgroundLayer
		backgroundColor: "#e6e6e6"
	bg.bringToFront()
	s.Main.bringToFront()
	s.Tab_Bar.bringToFront()
	
	s.Tab_Bar.y = 1334-98
	s.Tab_Bar.x = 0
	scrollFrame = new ScrollComponent
		y: 39
		height: 1334 - 98 - 39
		width: 750
	scrollFrame.scrollHorizontal = false
	s.ScrollContent.x = 0
	s.ScrollContent.y = 0
	s.ScrollContent.scrollVertical = true
	s.ScrollContent.scrollHorizontal = false
	s.ScrollContent.height = 1794-39
	s.ScrollContent.width = 750
	s.ScrollContent.superLayer = scrollFrame.content
