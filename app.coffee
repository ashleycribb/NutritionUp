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


# --- Health Check Configuration & Function ---

healthTargets =
	# Per 100g for single foods, or per total recipe for recipe check (PoC simplification)
	maxCarbs: 50      # grams
	minFiber: 5       # grams
	maxSugars: 15     # grams
	maxCalories: 500  # kcal 

performHealthCheck = (nutrientData) ->
	result = { isConsideredHealthy: true, issues: [] }

	unless nutrientData
		result.isConsideredHealthy = false # Or handle as appropriate
		result.issues.push "Nutrient data is missing."
		return result

	if nutrientData.carbs? and nutrientData.carbs > healthTargets.maxCarbs
		result.isConsideredHealthy = false
		result.issues.push "High in Carbohydrates (More than #{healthTargets.maxCarbs}g)"
	
	if nutrientData.fiber? and nutrientData.fiber < healthTargets.minFiber
		result.isConsideredHealthy = false
		result.issues.push "Low in Fiber (Less than #{healthTargets.minFiber}g)"
	
	if nutrientData.sugars? and nutrientData.sugars > healthTargets.maxSugars
		result.isConsideredHealthy = false
		result.issues.push "High in Sugars (More than #{healthTargets.maxSugars}g)"
		
	if nutrientData.calories? and nutrientData.calories > healthTargets.maxCalories
		result.isConsideredHealthy = false
		result.issues.push "High in Calories (More than #{healthTargets.maxCalories}kcal)"
		
	return result


# --- Liked Foods Screen Implementation ---

s.likedFoodsScreen = new Layer
	name: "likedFoodsScreen"
	width: Screen.width
	height: Screen.height
	backgroundColor: "#F0F2F5" # A slightly different background
	visible: false # Initially hidden

# Title for Liked Foods Screen
likedFoodsTitle = new TextLayer
	superLayer: s.likedFoodsScreen
	text: "My Liked Foods"
	fontSize: 36
	fontWeight: "600"
	color: "#2C3E50"
	textAlign: "center"
	width: s.likedFoodsScreen.width
	height: 50
	y: 40 # Status bar height consideration

# Back Button for Liked Foods Screen
backButtonFromLiked = new TextLayer
	superLayer: s.likedFoodsScreen
	text: "< Back to Swiping"
	fontSize: 28
	color: "#3498DB"
	x: 30
	y: likedFoodsTitle.y + (likedFoodsTitle.height - 28) / 2 # Align with title vertically
	width: 300 # Generous width for tap
	height: 50
	
# Scrollable area for liked foods
likedFoodsScroll = new ScrollComponent
	superLayer: s.likedFoodsScreen
	x: 0
	y: likedFoodsTitle.maxY + 20
	width: s.likedFoodsScreen.width
	height: s.likedFoodsScreen.height - (likedFoodsTitle.maxY + 20) - 20 # Leave some bottom padding
	scrollHorizontal: false

# --- Nutrient Detail Overlay ---
nutrientDetailOverlay = new Layer
	name: "nutrientDetailOverlay"
	width: Screen.width * 0.9
	height: Screen.height * 0.5
	x: Align.center()
	y: Align.center()
	backgroundColor: "rgba(255, 255, 255, 0.98)"
	borderRadius: 15
	shadowY: 8, shadowBlur: 20, shadowColor: "rgba(0,0,0,0.25)"
	visible: false
	opacity: 0
	clip: true # Ensure content stays within rounded corners

# Close button for the overlay
closeNutrientOverlayButton = new TextLayer
	superLayer: nutrientDetailOverlay
	text: "✕ Close" # Using a multiplication X for close icon
	fontSize: 26
	fontWeight: "600"
	color: "#3498DB"
	x: Align.right(-20) # Position to the top right
	y: 20
	width: 120 # Adjust width as needed
	height: 40
	textAlign: "right"

# TextLayers for nutrient details
detailDescriptionText = new TextLayer
	superLayer: nutrientDetailOverlay
	text: "Food Description"
	fontSize: 30
	fontWeight: "bold"
	color: "#2C3E50"
	x: 30, y: 70 # Below close button
	width: nutrientDetailOverlay.width - 60
	height: 80 # Allow for 2-3 lines
	style: { "word-wrap": "break-word" }

detailCarbsText = new TextLayer
	superLayer: nutrientDetailOverlay
	text: "Carbs: N/A"
	fontSize: 26
	color: "#333"
	x: 30, y: detailDescriptionText.maxY + 20
	width: nutrientDetailOverlay.width - 60
	height: 35

detailFiberText = new TextLayer
	superLayer: nutrientDetailOverlay
	text: "Fiber: N/A"
	fontSize: 26
	color: "#333"
	x: 30, y: detailCarbsText.maxY + 10
	width: nutrientDetailOverlay.width - 60
	height: 35

detailSugarsText = new TextLayer
	superLayer: nutrientDetailOverlay
	text: "Sugars: N/A"
	fontSize: 26
	color: "#333"
	x: 30, y: detailFiberText.maxY + 10
	width: nutrientDetailOverlay.width - 60
	height: 35

detailErrorText = new TextLayer
	superLayer: nutrientDetailOverlay
	text: "" # Initially empty
	fontSize: 24
	color: "red"
	x: 30, y: detailSugarsText.maxY + 20
	width: nutrientDetailOverlay.width - 60
	height: 60
	textAlign: "center"
	visible: false # Only show if there's an error

healthCheckText = new TextLayer # For displaying health check results
	superLayer: nutrientDetailOverlay
	text: ""
	fontSize: 24
	fontWeight: "500"
	x: 30, y: detailErrorText.y # Position below error text, or adjust as needed
	width: nutrientDetailOverlay.width - 60
	height: 60 # Allow for multiple lines
	textAlign: "center"
	visible: false


# Function to display liked foods
displayLikedFoods = ->
	print "Attempting to display liked foods. Profile length: #{likedFoodsProfile.length}"
	likedFoodsScroll.content.destroyChildren() # Clear previous items
	
	currentY = 10 # Initial Y position for items in scroll content
	itemPadding = 10
	itemHeight = 80 # Height for each liked item layer

	if likedFoodsProfile.length is 0
		noLikedMessage = new TextLayer
			superLayer: likedFoodsScroll.content
			text: "You haven't liked any foods yet!"
			fontSize: 26
			color: "#7F8C8D"
			textAlign: "center"
			width: likedFoodsScroll.width - 40
			x: 20
			y: 50
			autoHeight: true
		likedFoodsScroll.content.height = noLikedMessage.y + noLikedMessage.height + 50
		print "Displayed 'no liked foods' message."
		return

	for foodItem, index in likedFoodsProfile
		print "Displaying liked item: #{foodItem.description}"
		likedItemLayer = new Layer
			superLayer: likedFoodsScroll.content
			name: "likedItem_#{foodItem.fdcId or index}"
			fdcId: foodItem.fdcId # Store fdcId on the layer
			x: 20
			y: currentY
			width: likedFoodsScroll.width - 40
			height: itemHeight
			backgroundColor: "#FFFFFF"
			borderRadius: 8
		
		# Store description on layer for easy access in tap event, if needed, though foodItem is in scope
		likedItemLayer.foodDescription = foodItem.description 
			
		descriptionText = new TextLayer
			superLayer: likedItemLayer
			text: foodItem.description or "N/A"
			x: 15, y: 0 # Centered vertically within itemHeight
			width: likedItemLayer.width - 30
			height: itemHeight
			fontSize: 24
			color: "#333333"
			verticalAlign: "middle" # Framer specific for vertical alignment
			style:
				"overflow": "hidden"
				"text-overflow": "ellipsis"
				# "white-space": "nowrap" # if single line is preferred

		currentY += itemHeight + itemPadding

		# Tap event for each liked item
		likedItemLayer.on Events.Tap, ->
			tappedLayer = @ # 'this' or '@' refers to the likedItemLayer
			print "Tapped on liked food: #{tappedLayer.foodDescription}, FDC ID: #{tappedLayer.fdcId}"
			
			unless tappedLayer.fdcId
				print "Error: FDC ID missing on tapped layer."
				detailDescriptionText.text = "Error"
				detailErrorText.text = "FDC ID is missing for this item."
				detailErrorText.visible = true
				detailCarbsText.text = "Carbs: N/A"
				detailFiberText.text = "Fiber: N/A"
				detailSugarsText.text = "Sugars: N/A"
				nutrientDetailOverlay.opacity = 0 # Ensure it's reset before animation
				nutrientDetailOverlay.visible = true
				nutrientDetailOverlay.animate { properties: { opacity: 1 }, curve: "ease-in-out", time: 0.3 }
				return

			# Show loading state in overlay
			detailDescriptionText.text = "Loading details for..."
			detailCarbsText.text = tappedLayer.foodDescription # Show food name while loading
			detailFiberText.text = "Please wait..."
			detailSugarsText.text = ""
			detailErrorText.visible = false
			
			nutrientDetailOverlay.opacity = 0
			nutrientDetailOverlay.visible = true
			nutrientDetailOverlay.animate { properties: { opacity: 1 }, curve: "ease-in-out", time: 0.3 }
			nutrientDetailOverlay.bringToFront() # Ensure overlay is on top of everything

			usdaAPI.getFoodDetails(tappedLayer.fdcId, ["205", "291", "269"])
				.then (foodDetails) ->
					print "Successfully fetched details for #{foodDetails.description}"
					detailDescriptionText.text = foodDetails.description or "N/A"
					
					carbs = getNutrientValue(foodDetails, 205)
					fiber = getNutrientValue(foodDetails, 291)
					sugars = getNutrientValue(foodDetails, 269)
					
					detailCarbsText.text = "Carbs: #{if carbs? then carbs + 'g' else 'N/A'}"
					detailFiberText.text = "Fiber: #{if fiber? then fiber + 'g' else 'N/A'}"
					detailSugarsText.text = "Sugars: #{if sugars? then sugars + 'g' else 'N/A'}"
					detailErrorText.visible = false

					# Perform health check (assuming values are per 100g for single liked food)
					calories = getNutrientValue(foodDetails, 208) # Kcal, ID 208
					nutrientsForCheck = {
						carbs: carbs
						fiber: fiber
						sugars: sugars
						calories: calories
					}
					
					healthCheckResult = performHealthCheck(nutrientsForCheck)
					healthCheckText.visible = true
					if healthCheckResult.isConsideredHealthy
						healthCheckText.text = "Looks good!"
						healthCheckText.color = "green"
					else
						healthCheckText.text = "Consider alternatives: " + healthCheckResult.issues.join(", ")
						healthCheckText.color = "orange"
					
					# Adjust overlay height if healthCheckText is long
					nutrientDetailOverlay.height = healthCheckText.maxY + 20

				.catch (error) ->
					print "Error fetching details for FDC ID #{tappedLayer.fdcId}: #{error}"
					detailDescriptionText.text = "Error Fetching Details"
					detailErrorText.text = "Could not load details. #{error.message or error}"
					detailErrorText.visible = true
					detailCarbsText.text = "Carbs: N/A"
					detailFiberText.text = "Fiber: N/A"
					detailSugarsText.text = "Sugars: N/A"
					healthCheckText.visible = false # Hide health check text on error
					nutrientDetailOverlay.height = detailErrorText.maxY + 20 # Reset height
		
	likedFoodsScroll.content.height = currentY # Update scroll content height
	likedFoodsScroll.scrollToTop()
	print "Finished displaying liked foods. Scroll content height: #{likedFoodsScroll.content.height}"


# --- Navigation Logic for Liked Foods Screen ---
backButtonFromLiked.on Events.Tap, ->
	print "Back button tapped. Hiding likedFoodsScreen, showing swipeScreen."
	s.likedFoodsScreen.visible = false
	s.swipeScreen.visible = true
	s.swipeScreen.bringToFront() # Ensure swipe screen is on top

closeNutrientOverlayButton.on Events.Tap, ->
	print "Close nutrient overlay button tapped."
	nutrientDetailOverlay.animate 
		properties: { opacity: 0 }
		curve: "ease-out", time: 0.25
	.onAnimationEnd ->
		nutrientDetailOverlay.visible = false
		detailErrorText.visible = false # Reset error visibility
		healthCheckText.visible = false # Reset health check text visibility

# --- Swipe Interface Implementation ---

# 1. New Screen (s.swipeScreen)
s.swipeScreen = new Layer
	name: "swipeScreen"
	width: Screen.width
	height: Screen.height
	backgroundColor: "#D5DBDB" # A light grey for the background

# For development, bring swipeScreen to front.
# Comment out other screen initializations or use a button to navigate later.
s.swipeScreen.bringToFront() 
# Potentially hide other primary screens if they were brought to front earlier
# s.Main.visible = false
# s.Tab_Bar.visible = false
# s.Search_1.visible = false 
# etc. for other screens that might be visible by default or from previous interactions.
# For a cleaner start, ensure only swipeScreen is active.
# This might require identifying which screens are visible by default
# and explicitly hiding them when swipeScreen is active.
# For now, just bringing to front. Other screens might be on top if not handled.

currentFoodCard = null
swipeableFoods = []
currentSwipePageNumber = 1
isFetchingFoods = false # Flag to prevent multiple fetch calls

# --- User Profile for Liked Foods ---
likedFoodsProfile = []

# Helper function to check if a food is already liked
isFoodAlreadyLiked = (fdcIdToCheck) ->
	for foodItem in likedFoodsProfile
		return true if foodItem.fdcId is fdcIdToCheck
	return false

# Load liked foods from localStorage on app initialization
try
	storedProfile = localStorage.getItem("likedFoodsProfile")
	if storedProfile
		likedFoodsProfile = JSON.parse(storedProfile)
		print "Loaded liked foods from localStorage:", likedFoodsProfile
	else
		print "No liked foods profile found in localStorage."
catch error
	print "Error loading liked foods from localStorage:", error
	likedFoodsProfile = [] # Ensure it's an array in case of error

# --- FoodCard Class ---
class FoodCard extends Layer
	constructor: (options = {}) ->
		@foodName = options.foodName or "Unnamed Food"
		@fdcId = options.fdcId or null # Store fdcId
		
		cardWidth = Screen.width * 0.8
		cardHeight = Screen.height * 0.6
		
		# Incrementing name for uniqueness is still good
		# foodCardCounter is defined later, ensure it's accessible or pass unique name
		uniqueName = "foodCard_#{Utils.randomNumber(1, 10000)}" 

		super _.defaults options,
			name: uniqueName # Use unique name
			width: cardWidth
			height: cardHeight
			backgroundColor: "#FFFFFF"
			borderRadius: 20
			shadowY: 5, shadowBlur: 15, shadowColor: "rgba(0,0,0,0.2)"
			clip: true # Ensures content (like image placeholder) doesn't spill
			
			# Positioned by loadNextFoodCard
			x: Align.center()
			y: Align.center()

		# Image Placeholder
		@imagePlaceholder = new Layer
			superLayer: this
			width: this.width - 40 # Padding
			height: this.height * 0.6
			x: Align.center()
			y: 20
			backgroundColor: "#E0E0E0" # Light grey
			borderRadius: 10
			
		# Description TextLayer
		@descriptionText = new TextLayer
			superLayer: this
			text: @foodName
			x: 20
			y: @imagePlaceholder.maxY + 20
			width: this.width - 40
			height: this.height - (@imagePlaceholder.maxY + 20) - 20 # Remaining height
			fontSize: 28
			fontWeight: "500"
			color: "#333333"
			textAlign: "center"
			style:
				"word-wrap": "break-word" # Ensure long text wraps

		# Draggable properties
		this.draggable.enabled = true
		this.draggable.horizontal = true
		this.draggable.vertical = true # Allow some vertical movement for feel, but constrain if needed
		this.draggable.constraints =
			x: -Screen.width * 1.5, y: -Screen.height * 0.5, width: Screen.width * 4, height: Screen.height * 2
		this.draggable.overdrag = true
		
		# Like/Pass overlay indicators (optional bonus)
		@likeIndicator = new TextLayer
			superLayer: this
			text: "LIKE"
			fontSize: 40, fontWeight: "bold", color: "rgba(0,255,0,0.7)"
			rotation: -30
			x: 40, y: 40
			opacity: 0
			
		@passIndicator = new TextLayer
			superLayer: this
			text: "PASS"
			fontSize: 40, fontWeight: "bold", color: "rgba(255,0,0,0.7)"
			rotation: 30
			x: this.width - 160, y: 40 # Adjust x based on text width
			opacity: 0


# --- Fetch Swipeable Foods Function ---
fetchSwipeableFoods = ->
	return new Promise (resolve, reject) ->
		if isFetchingFoods
			print "Already fetching foods, request ignored."
			return reject("Fetching in progress")
			
		isFetchingFoods = true
		print "Fetching swipeable foods, page: #{currentSwipePageNumber}..."
		usdaAPI.getFoodList({ pageNumber: currentSwipePageNumber, pageSize: 20 }) # pageSize can be adjusted
			.then (newFoods) ->
				isFetchingFoods = false
				if newFoods and newFoods.length > 0
					swipeableFoods = swipeableFoods.concat(newFoods) # Append new foods
					currentSwipePageNumber++
					print "Fetched #{newFoods.length} new foods. Total swipeable: #{swipeableFoods.length}"
					resolve(newFoods) # Resolve with the newly fetched foods
				else
					print "No new foods fetched from API."
					resolve([]) # Resolve with empty array if no new foods
			.catch (error) ->
				isFetchingFoods = false
				print "Error fetching swipeable foods: #{error}"
				reject(error)

# --- Load Next Food Card Function ---
loadNextFoodCard = ->
	if currentFoodCard
		# This case should ideally not be hit if previous card was swiped and destroyed
		print "Warning: loadNextFoodCard called while currentFoodCard exists."
		return

	displayNoMoreFoodsMessage = ->
		# Display a message on the swipe screen
		# This could be a TextLayer that replaces or overlays the card area
		noMoreLayer = new TextLayer
			superLayer: s.swipeScreen
			text: "No more foods to show for now. Try again later!"
			fontSize: 28
			color: "#333"
			textAlign: "center"
			width: s.swipeScreen.width * 0.8
			height: 100
			x: Align.center()
			y: Align.center()
			backgroundColor: "rgba(255,255,255,0.8)"
			borderRadius: 10
			padding: 20
		print "Displayed 'No more foods' message."
		# Optionally, disable further attempts to load or schedule a retry
		# For now, it just shows the message. User might need to reload/re-trigger.

	if swipeableFoods.length is 0
		unless isFetchingFoods # Avoid multiple calls if one is already in progress
			fetchSwipeableFoods()
				.then (fetchedFoods) ->
					if swipeableFoods.length > 0 # Check again after fetch
						loadNextFoodCard() # Recursive call to actually load the card
					else
						print "Still no swipeable foods after fetch. Displaying no more foods."
						displayNoMoreFoodsMessage()
				.catch (error) ->
					print "Error during fetch in loadNextFoodCard: #{error}"
					# Display an error message on the card area
					errorLayer = new TextLayer
						superLayer: s.swipeScreen
						text: "Error loading foods. Please try again."
						fontSize: 28, color: "red", textAlign: "center"
						width: s.swipeScreen.width * 0.8, height: 100, x: Align.center(), y: Align.center()
						backgroundColor: "rgba(255,255,255,0.8)", borderRadius: 10, padding: 20
		return # Exit, wait for fetch to complete and recall

	foodData = swipeableFoods.shift() # Get the next food from the beginning of the array
	
	# If foodData is undefined (e.g. array became empty unexpectedly), handle it.
	unless foodData
		print "FoodData is undefined after shift. This shouldn't happen if length check is proper."
		displayNoMoreFoodsMessage()
		return

	print "Loading next card with FDC ID: #{foodData.fdcId}, Description: #{foodData.description}"

	currentFoodCard = new FoodCard
		superLayer: s.swipeScreen
		foodName: foodData.description or "N/A" # Use real description
		fdcId: foodData.fdcId # Store fdcId
	
	currentFoodCard.x = Align.center()
	currentFoodCard.y = Align.center(-100) # Slightly higher for a better look

	currentFoodCard.originalX = currentFoodCard.x
	currentFoodCard.originalY = currentFoodCard.y
	
	currentFoodCard.on Events.DragMove, (event, layer) ->
		deltaX = layer.x - layer.originalX
		layer.rotation = Utils.modulate(deltaX, [-Screen.width/2, Screen.width/2], [-25, 25], true)
		layer.likeIndicator.opacity = Utils.modulate(deltaX, [50, Screen.width/3], [0, 1], true)
		layer.passIndicator.opacity = Utils.modulate(deltaX, [-Screen.width/3, -50], [1, 0], true)

	currentFoodCard.on Events.DragEnd, (event, layer) ->
		deltaX = layer.x - layer.originalX
		swipeThreshold = Screen.width * 0.3
		
		finalX = null
		finalRotation = null
		action = null
		
		if deltaX > swipeThreshold
			finalX = Screen.width + layer.width/2 + 100
			finalRotation = 30
			action = "Liked"
		else if deltaX < -swipeThreshold
			finalX = -(Screen.width + layer.width/2 + 100)
			finalRotation = -30
			action = "Passed"
		
		if action
			layer.likeIndicator.destroy()
			layer.passIndicator.destroy()
			
			layer.animate
				properties: { x: finalX, rotation: finalRotation }
				curve: "spring(300, 20, 0)"
			.onAnimationEnd ->
				print "#{action}: '#{layer.foodName}' (FDC ID: #{layer.fdcId})"
				
				if action is "Liked"
					foodToLike = { fdcId: layer.fdcId, description: layer.foodName }
					unless isFoodAlreadyLiked(foodToLike.fdcId)
						likedFoodsProfile.push(foodToLike)
						print "Added to liked profile:", foodToLike
						try
							localStorage.setItem("likedFoodsProfile", JSON.stringify(likedFoodsProfile))
							print "Liked foods profile saved to localStorage. Total: #{likedFoodsProfile.length}"
						catch storageError
							print "Error saving liked foods to localStorage:", storageError
					else
						print "Food already liked, not adding to profile:", foodToLike
						
				layer.destroy()
				currentFoodCard = null
				loadNextFoodCard()
		else
			layer.animate
				properties: { x: layer.originalX, y: layer.originalY, rotation: 0 }
				curve: "spring(500, 30, 0)"
			layer.likeIndicator.opacity = 0
			layer.passIndicator.opacity = 0
			
	# Check if we need more foods in advance
	if swipeableFoods.length < 5 and not isFetchingFoods # Fetch more if buffer is low
		fetchSwipeableFoods().catch (err) -> print "Pre-emptive fetch failed: #{err}"
		
	print "Displayed card: '#{currentFoodCard.foodName}' (FDC ID: #{currentFoodCard.fdcId})"

# Button on s.swipeScreen to view liked foods
viewLikedButton = new Layer
	superLayer: s.swipeScreen # Add this button to the swipe screen
	x: Align.right(-30)
	y: 40 # Below status bar
	width: 80, height: 80
	backgroundColor: "#3498DB"
	borderRadius: 40
	html: "<div style='font-size:40px; color:white; text-align:center; line-height:80px;'>♥</div>"

viewLikedButton.on Events.Tap, ->
	print "View liked button tapped. Hiding swipeScreen, showing likedFoodsScreen."
	s.swipeScreen.visible = false
	s.likedFoodsScreen.visible = true
	s.likedFoodsScreen.bringToFront() # Ensure liked screen is on top
	displayLikedFoods() # Refresh the list


# --- Recipe Input Screen Implementation ---

s.recipeInputScreen = new Layer
	name: "recipeInputScreen"
	width: Screen.width
	height: Screen.height
	backgroundColor: "#E9E9E9" # A new background color
	visible: false

# Title for Recipe Input Screen
recipeInputTitle = new TextLayer
	superLayer: s.recipeInputScreen
	text: "Create New Recipe"
	fontSize: 36, fontWeight: "600", color: "#2C3E50"
	textAlign: "center"
	width: s.recipeInputScreen.width, height: 50, y: 40

# Back Button for Recipe Input Screen
backButtonFromRecipe = new TextLayer
	superLayer: s.recipeInputScreen
	text: "< Back"
	fontSize: 28, color: "#3498DB"
	x: 30, y: recipeInputTitle.y + (recipeInputTitle.height - 28) / 2
	width: 150, height: 50

# Recipe Name Input
recipeNameInput = new InputField
	superLayer: s.recipeInputScreen
	name: "recipeNameInput"
	x: Align.center()
	y: recipeInputTitle.maxY + 20
	width: s.recipeInputScreen.width * 0.9
	height: 50
	placeholderText: "Enter Recipe Name"
	backgroundColor: "#FFFFFF", textColor: "#000000", fontSize: 24
	style: { "border-radius": "8px", "padding": "10px" }

# Ingredient Search Input
ingredientSearchInput = new InputField
	superLayer: s.recipeInputScreen
	name: "ingredientSearchInput"
	x: Align.center()
	y: recipeNameInput.maxY + 20
	width: s.recipeInputScreen.width * 0.9
	height: 50
	placeholderText: "Search for an ingredient..."
	backgroundColor: "#FFFFFF", textColor: "#000000", fontSize: 24
	style: { "border-radius": "8px", "padding": "10px" }

# Ingredient Search Results Scroll Area
ingredientSearchResultsScroll = new ScrollComponent
	superLayer: s.recipeInputScreen
	name: "ingredientSearchResultsScroll"
	x: Align.center()
	y: ingredientSearchInput.maxY + 10
	width: s.recipeInputScreen.width * 0.9
	height: 200 # Placeholder height, can be adjusted
	backgroundColor: "#FFFFFF"
	borderRadius: 8
	scrollHorizontal: false

# Current Recipe Ingredients Scroll Area
currentRecipeTitle = new TextLayer
	superLayer: s.recipeInputScreen
	text: "Your Ingredients:"
	x: ingredientSearchInput.x
	y: ingredientSearchResultsScroll.maxY + 20
	width: s.recipeInputScreen.width * 0.9
	height: 30
	fontSize: 22, fontWeight: "500", color: "#333"

currentRecipeIngredientsScroll = new ScrollComponent
	superLayer: s.recipeInputScreen
	name: "currentRecipeIngredientsScroll"
	x: Align.center()
	y: currentRecipeTitle.maxY + 10
	width: s.recipeInputScreen.width * 0.9
	height: 250 # Placeholder height
	backgroundColor: "#FFFFFF"
	borderRadius: 8
	scrollHorizontal: false

# Temporary data store for current recipe's ingredients
currentRecipeIngredients = []
savedRecipes = [] # Array to store saved recipes

# Load saved recipes from localStorage on app initialization
try
	storedRecipes = localStorage.getItem("savedRecipes")
	if storedRecipes
		savedRecipes = JSON.parse(storedRecipes)
		print "Loaded saved recipes from localStorage:", savedRecipes.length, "recipes"
	else
		print "No saved recipes found in localStorage."
catch error
	print "Error loading saved recipes from localStorage:", error
	savedRecipes = [] # Ensure it's an array in case of error


# Function to update the display of current recipe ingredients
updateCurrentRecipeDisplay = ->
	print "Updating current recipe display. Ingredients: #{currentRecipeIngredients.length}"
	currentRecipeIngredientsScroll.content.destroyChildren()
	
	currentY = 10
	itemPadding = 8
	itemHeight = 60

	if currentRecipeIngredients.length is 0
		noIngredientsMsg = new TextLayer
			superLayer: currentRecipeIngredientsScroll.content
			text: "No ingredients added yet."
			fontSize: 22, color: "#7f8c8d", textAlign: "center"
			width: currentRecipeIngredientsScroll.width - 40, x: 20, y: 30
			autoHeight: true
		currentRecipeIngredientsScroll.content.height = noIngredientsMsg.y + noIngredientsMsg.height + 30
		return

	for ingredient, index in currentRecipeIngredients
		ingredientLayer = new Layer
			superLayer: currentRecipeIngredientsScroll.content
			x: 10, y: currentY
			width: currentRecipeIngredientsScroll.width - 20
			height: itemHeight
			backgroundColor: "#ECF0F1"
			borderRadius: 5

		ingredientText = new TextLayer
			superLayer: ingredientLayer
			text: "#{ingredient.quantity} #{ingredient.unit} - #{ingredient.description}"
			x: 10, y: 0, width: ingredientLayer.width - 70, height: itemHeight
			fontSize: 20, color: "#2c3e50", verticalAlign: "middle"
			style: { "text-overflow": "ellipsis", "overflow": "hidden" }
			
		removeButton = new Layer
			superLayer: ingredientLayer
			name: "removeIngredient_#{index}"
			x: Align.right(-10)
			y: Align.center()
			width: 40, height: 40
			backgroundColor: "#E74C3C" # Red color for delete
			borderRadius: 20
		
		removeButtonText = new TextLayer
			superLayer: removeButton
			text: "✕"
			fontSize: 24, color: "white", textAlign: "center", verticalAlign: "middle"
			width: removeButton.width, height: removeButton.height

		removeButton.ingredientIndex = index # Store index for removal
		removeButton.on Events.Tap, ->
			tappedIndex = @ingredientIndex
			print "Remove button tapped for ingredient at index: #{tappedIndex}"
			currentRecipeIngredients.splice(tappedIndex, 1) # Remove from array
			updateCurrentRecipeDisplay() # Refresh display
			
		currentY += itemHeight + itemPadding
	
	currentRecipeIngredientsScroll.content.height = currentY
	currentRecipeIngredientsScroll.scrollToMostRecent()


# Save Recipe Button (Placeholder)
saveRecipeButton = new Layer
	superLayer: s.recipeInputScreen
	name: "saveRecipeButton"
	x: Align.center()
	y: currentRecipeIngredientsScroll.maxY + 30
	width: s.recipeInputScreen.width * 0.7
	height: 60
	backgroundColor: "#2ECC71" # Green color
	borderRadius: 10

saveRecipeButtonText = new TextLayer
	superLayer: saveRecipeButton
	text: "Save Recipe"
	fontSize: 28, fontWeight: "bold", color: "white"
	width: saveRecipeButton.width, height: saveRecipeButton.height
	textAlign: "center", verticalAlign: "middle"

# --- Navigation ---
# Button on s.swipeScreen to navigate to recipe input
# (Assuming s.swipeScreen is a relevant place to put this button)
createRecipeButton = new Layer
	superLayer: s.swipeScreen # Or s.Main, or other appropriate screen
	x: Align.left(30) # Different position from viewLikedButton
	y: 40 # Below status bar
	width: 80, height: 80
	backgroundColor: "#1ABC9C" # Teal color
	borderRadius: 40
	html: "<div style='font-size:40px; color:white; text-align:center; line-height:80px;'>✎</div>" # Pencil icon

# --- Ingredient Search and Add Logic ---
ingredientSearchInput.on Events.Submit, ->
	searchText = ingredientSearchInput.value.trim()
	print "Ingredient search submitted: #{searchText}"
	
	unless searchText
		ingredientSearchResultsScroll.content.destroyChildren()
		# Optionally show a message like "Enter a search term"
		return

	# Show loading state in search results
	ingredientSearchResultsScroll.content.destroyChildren()
	loadingMsg = new TextLayer
		superLayer: ingredientSearchResultsScroll.content
		text: "Searching...", fontSize: 22, color: "#7f8c8d"
		width: ingredientSearchResultsScroll.width - 20, x: 10, y: 10
	ingredientSearchResultsScroll.content.height = loadingMsg.height + 20

	usdaAPI.searchFoods(searchText)
		.then (results) ->
			ingredientSearchResultsScroll.content.destroyChildren() # Clear loading message
			print "Found #{results.length} ingredients for '#{searchText}'"
			
			if results.length is 0
				noResultsMsg = new TextLayer
					superLayer: ingredientSearchResultsScroll.content
					text: "No results found for '#{searchText}'.", fontSize: 22, color: "#7f8c8d"
					width: ingredientSearchResultsScroll.width - 20, x: 10, y: 10
				ingredientSearchResultsScroll.content.height = noResultsMsg.height + 20
				return

			currentSearchY = 10
			searchItemPadding = 8
			searchItemHeight = 50

			for foodItem in results
				searchResultLayer = new Layer
					superLayer: ingredientSearchResultsScroll.content
					x: 10, y: currentSearchY
					width: ingredientSearchResultsScroll.width - 20
					height: searchItemHeight
					backgroundColor: "#FDFEFE"
					borderRadius: 5
					shadowY: 1, shadowBlur: 2, shadowColor: "rgba(0,0,0,0.1)"
				
				searchResultLayer.foodData = foodItem # Store full food data
				
				resultText = new TextLayer
					superLayer: searchResultLayer
					text: foodItem.description
					x: 10, y: 0, width: searchResultLayer.width - 20, height: searchItemHeight
					fontSize: 20, color: "#34495E", verticalAlign: "middle"
					style: { "text-overflow": "ellipsis", "overflow": "hidden" }

				searchResultLayer.on Events.Tap, ->
					tappedFood = @foodData
					print "Tapped search result: #{tappedFood.description}, FDC ID: #{tappedFood.fdcId}"
					
					# Use prompt for quantity and unit
					quantity = prompt("Enter quantity for #{tappedFood.description}:", "1")
					if quantity is null # User cancelled prompt
						print "Quantity input cancelled."
						return 
						
					unit = prompt("Enter unit (e.g., g, oz, cup):", "unit")
					if unit is null # User cancelled prompt
						print "Unit input cancelled."
						return

					parsedQuantity = parseFloat(quantity)
					if isNaN(parsedQuantity) or parsedQuantity <= 0
						print "Invalid quantity entered. Defaulting to 1."
						parsedQuantity = 1
					
					ingredient = {
						description: tappedFood.description
						fdcId: tappedFood.fdcId
						quantity: parsedQuantity
						unit: unit or "unit" # Default if empty
					}
					
					currentRecipeIngredients.push(ingredient)
					print "Added ingredient:", ingredient
					updateCurrentRecipeDisplay()
					
					# Clear search results and input after adding
					ingredientSearchInput.value = ""
					ingredientSearchResultsScroll.content.destroyChildren()
					ingredientSearchResultsScroll.content.height = 10 # Reset height
					
				currentSearchY += searchItemHeight + searchItemPadding
			
			ingredientSearchResultsScroll.content.height = currentSearchY
			ingredientSearchResultsScroll.scrollToTop()

		.catch (error) ->
			ingredientSearchResultsScroll.content.destroyChildren()
			print "Error searching ingredients: #{error}"
			errorMsg = new TextLayer
				superLayer: ingredientSearchResultsScroll.content
				text: "Search error. Try again.", fontSize: 22, color: "red"
				width: ingredientSearchResultsScroll.width - 20, x: 10, y: 10
			ingredientSearchResultsScroll.content.height = errorMsg.height + 20

createRecipeButton.on Events.Tap, ->
	print "Create Recipe button tapped."
	s.swipeScreen.visible = false
	s.likedFoodsScreen.visible = false # Ensure other custom screens are hidden
	s.recipeInputScreen.visible = true
	s.recipeInputScreen.bringToFront()
	updateCurrentRecipeDisplay() # Ensure current ingredients list is rendered correctly when screen shown

backButtonFromRecipe.on Events.Tap, ->
	print "Back from Recipe Input tapped."
	s.recipeInputScreen.visible = false
	s.swipeScreen.visible = true # Assuming swipeScreen was the previous one
	s.swipeScreen.bringToFront()
	# Clear search results when leaving screen
	ingredientSearchInput.value = ""
	ingredientSearchResultsScroll.content.destroyChildren()
	ingredientSearchResultsScroll.content.height = 10


# --- Placeholder Save Recipe Logic ---
saveRecipeButton.on Events.Tap, ->
	recipeName = recipeNameInput.value.trim()
	if not recipeName
		print "Recipe name is required."
		# Optionally show an alert or UI feedback
		recipeNameInput.animate
			properties: { scale: 1.05 }, curve: "spring(800,20,0)"
		Utils.delay 0.1, -> recipeNameInput.animate
			properties: { scale: 1.0 }, curve: "spring(800,20,0)"
		return

	if currentRecipeIngredients.length is 0
		print "Cannot save recipe with no ingredients."
		# Optionally show an alert or UI feedback
		return

	print "Saving Recipe (Placeholder):"
	print "  Name: #{recipeName}"
	print "  Ingredients (#{currentRecipeIngredients.length}):"
	for ingredient in currentRecipeIngredients
		print "    - #{ingredient.quantity} #{ingredient.unit} of #{ingredient.description} (FDC ID: #{ingredient.fdcId})"
	
	# Clear UI for next recipe (optional)
	recipeNameInput.value = ""
	currentRecipeIngredients = []
	updateCurrentRecipeDisplay()
	ingredientSearchInput.value = ""
	ingredientSearchResultsScroll.content.destroyChildren()
	ingredientSearchResultsScroll.content.height = 10
	
	# print "Recipe fields cleared for next entry." # Already happens after successful save.

	# Save to localStorage
	newRecipe = { recipeName: recipeName, ingredients: Utils.clone(currentRecipeIngredients) } # Use Utils.clone for deep copy
	
	# Check if Utils.clone worked, otherwise manual clone
	if not newRecipe.ingredients or newRecipe.ingredients.length isnt currentRecipeIngredients.length
		print "Utils.clone might not be available or working as expected for deep copy. Manual clone attempt."
		newRecipe.ingredients = (Utils.clone(item) for item in currentRecipeIngredients) # More robust cloning if needed

	savedRecipes.push(newRecipe)
	
	try
		localStorage.setItem("savedRecipes", JSON.stringify(savedRecipes))
		print "Recipes saved to localStorage. Total recipes: #{savedRecipes.length}"
		
		# Temporary success message
		successMsg = new TextLayer
			superLayer: s.recipeInputScreen # Show on the recipe input screen
			text: "Recipe Saved!"
			fontSize: 24, fontWeight: "bold", color: "white"
			backgroundColor: "rgba(46, 204, 113, 0.85)" # Greenish success color
			padding: 15
			borderRadius: 10
			x: Align.center(), y: Align.center()
			opacity: 0
		
		successMsg.animate
			properties: {opacity: 1}, curve: "spring(300,30,0)"
		
		Utils.delay 1.5, -> # Display for 1.5 seconds
			successMsg.animate
				properties: {opacity: 0}, curve: "ease-out", time: 0.3
			.onAnimationEnd ->
				successMsg.destroy()
				
		# Clear form after successful save and message display
		recipeNameInput.value = ""
		currentRecipeIngredients = [] # Reset the array
		updateCurrentRecipeDisplay() # Update the UI
		ingredientSearchInput.value = ""
		ingredientSearchResultsScroll.content.destroyChildren()
		ingredientSearchResultsScroll.content.height = 10
		print "Recipe form cleared after saving."

	catch storageError
		print "Error saving recipes to localStorage:", storageError
		# Optional: Show a temporary error message layer to the user
		errorMsgLayer = new TextLayer
			superLayer: s.recipeInputScreen
			text: "Error: Could not save recipe!"
			fontSize: 24, fontWeight: "bold", color: "white"
			backgroundColor: "rgba(231, 76, 60, 0.85)" # Reddish error color
			padding: 15
			borderRadius: 10
			x: Align.center(), y: Align.center()
			opacity: 0
		
		errorMsgLayer.animate
			properties: {opacity: 1}, curve: "spring(300,30,0)"
		
		Utils.delay 2.0, -> # Display for 2 seconds
			errorMsgLayer.animate
				properties: {opacity: 0}, curve: "ease-out", time: 0.3
			.onAnimationEnd ->
				errorMsgLayer.destroy()

# --- Recipe Nutritional Calculation (Proof of Concept) ---
calculateRecipeNutrition = (recipeObject) ->
	return new Promise (resolveMain, rejectMain) ->
		print "Starting nutrition calculation for recipe: #{recipeObject.recipeName}"
		
		totalNutrients = 
			carbs: 0
			fiber: 0
			sugars: 0
			calories: 0 # Nutrient ID "208"
			skippedIngredients: [] # To track ingredients not in grams

		ingredientDetailPromises = []

		for ingredient in recipeObject.ingredients
			# Unit Check (PoC Simplification)
			unitLower = ingredient.unit.toLowerCase()
			if not (unitLower is "g" or unitLower is "gram" or unitLower is "grams")
				print "Warning: Ingredient '#{ingredient.description}' unit ('#{ingredient.unit}') is not grams. Skipping for PoC calculation."
				totalNutrients.skippedIngredients.push({description: ingredient.description, unit: ingredient.unit, reason: "Unit not grams"})
				continue # Skip to the next ingredient
			
			# Nutrient IDs: 205 (Carbs), 291 (Fiber), 269 (Sugars), 208 (Calories)
			promise = usdaAPI.getFoodDetails(ingredient.fdcId, ["205", "291", "269", "208"])
			promise.ingredientQuantity = ingredient.quantity 
			promise.ingredientDescription = ingredient.description # For error logging
			ingredientDetailPromises.push(promise)

		if ingredientDetailPromises.length is 0
			if totalNutrients.skippedIngredients.length > 0
				print "No ingredients with 'grams' unit to process for nutrition calculation. All were skipped."
				resolveMain(totalNutrients) # Resolve with initial (mostly zero) nutrients and skipped items
			else
				print "No ingredients to process for nutrition calculation (empty recipe or all non-gram units)."
				rejectMain("No processable ingredients in recipe.") # Or resolve with empty nutrients
			return

		resultsCount = 0
		detailedIngredientData = [] # To store successfully fetched details and their quantities

		processResults = ->
			print "All ingredient detail promises settled. Processing #{detailedIngredientData.length} successfully fetched items."
			for dataItem in detailedIngredientData
				foodDetails = dataItem.details
				quantity = dataItem.quantity
				
				carbsPer100g = getNutrientValue(foodDetails, 205) or 0
				fiberPer100g = getNutrientValue(foodDetails, 291) or 0
				sugarsPer100g = getNutrientValue(foodDetails, 269) or 0
				caloriesPer100g = getNutrientValue(foodDetails, 208) or 0 # Kcal

				totalNutrients.carbs += (carbsPer100g / 100) * quantity
				totalNutrients.fiber += (fiberPer100g / 100) * quantity
				totalNutrients.sugars += (sugarsPer100g / 100) * quantity
				totalNutrients.calories += (caloriesPer100g / 100) * quantity
				
			print "Final calculated totals:", totalNutrients
			resolveMain(totalNutrients)

		for promiseItem in ingredientDetailPromises
			promiseItem.then (foodDetails) ->
				resultsCount++
				print "Successfully fetched details for: #{promiseItem.ingredientDescription}, Quantity: #{promiseItem.ingredientQuantity}g"
				detailedIngredientData.push({ details: foodDetails, quantity: promiseItem.ingredientQuantity })
				if resultsCount is ingredientDetailPromises.length
					processResults()
			.catch (error) ->
				resultsCount++
				errMsg = error.message or error
				print "Error fetching details for ingredient '#{promiseItem.ingredientDescription}': #{errMsg}"
				totalNutrients.skippedIngredients.push({description: promiseItem.ingredientDescription, unit: "g", reason: "API error: #{errMsg}"})
				if resultsCount is ingredientDetailPromises.length
					processResults()

# --- Basic Modification Suggestions (Conceptual) ---
generateBasicSuggestions = (issues, recipe) ->
	suggestions = []
	# Basic keyword list for very simple ingredient identification (PoC)
	highSugarKeywords = ["sugar", "syrup", "honey", "sweetener", "juice", "jam", "candy"]
	highCarbKeywords = ["flour", "bread", "pasta", "rice", "potato", "cereal", "cracker", "bagel", "bun", "roll"] # Very generic
	# Note: 'calorie' suggestions are very general as we don't have fat content specifically.

	if "High in Carbohydrates (More than #{healthTargets.maxCarbs}g)" in issues
		exampleCarbIngredient = ""
		for ingredient in recipe.ingredients
			for keyword in highCarbKeywords
				if ingredient.description.toLowerCase().includes(keyword)
					exampleCarbIngredient = ingredient.description
					break
			break if exampleCarbIngredient # Found one example
		
		if exampleCarbIngredient
			suggestions.push "High in Carbs. Consider reducing portions of ingredients like '#{exampleCarbIngredient}' or other grains/starches."
		else
			suggestions.push "High in Carbs. Consider reducing portions of high-carbohydrate ingredients (e.g., grains, starchy vegetables, sugary items)."

	if "Low in Fiber (Less than #{healthTargets.minFiber}g)" in issues
		suggestions.push "Low in Fiber. Try adding more vegetables, whole grains (like oats, quinoa), beans, or lentils."

	if "High in Sugars (More than #{healthTargets.maxSugars}g)" in issues
		exampleSugarIngredient = ""
		for ingredient in recipe.ingredients
			for keyword in highSugarKeywords
				if ingredient.description.toLowerCase().includes(keyword)
					exampleSugarIngredient = ingredient.description
					break
			break if exampleSugarIngredient
		
		if exampleSugarIngredient
			suggestions.push "High in Sugars. Consider reducing or replacing ingredients like '#{exampleSugarIngredient}' or other sweeteners."
		else
			suggestions.push "High in Sugars. Consider reducing sugary ingredients (like added sugars, syrups, sweetened beverages) or using sugar substitutes moderately."
	
	if "High in Calories (More than #{healthTargets.maxCalories}kcal)" in issues
		suggestions.push "High in Calories. Consider reducing overall portion sizes, or specifically reducing ingredients high in fats and/or sugars if identifiable."
	
	if suggestions.length is 0 and issues.length > 0
		suggestions.push "This recipe has some health concerns based on the targets. Review individual nutrient levels to identify specific areas for improvement."
	else if suggestions.length is 0 and issues.length is 0 # Should not happen if called correctly, but as a fallback
		suggestions.push "No specific issues found based on current targets."


	return suggestions
					

# --- Initial Load ---
Utils.delay 0.1, ->
	print "Starting initial food fetch for swipe interface..."
	fetchSwipeableFoods()
		.then ->
			print "Initial fetch successful. Loading first card."
			loadNextFoodCard()
		.catch (error) ->
			print "Initial fetch for swipe cards failed: #{error}"
			initialErrorLayer = new TextLayer
				superLayer: s.swipeScreen
				text: "Could not load foods. Please check connection and try again."
				fontSize: 28, color: "red", textAlign: "center"
				width: s.swipeScreen.width * 0.8, height: 150, x: Align.center(), y: Align.center()
				backgroundColor: "rgba(255,255,255,0.8)", borderRadius: 10, padding: 20


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

# --- Test Function for Swipe Logic ---
testSwipeLogic = ->
	print "\n--- Starting Swipe Logic Test ---"
	
	# Ensure swipeScreen is visible for the test
	s.swipeScreen.visible = true
	s.swipeScreen.bringToFront()
	s.likedFoodsScreen.visible = false
	s.recipeInputScreen.visible = false

	originalLikedProfileLength = likedFoodsProfile.length
	
	# Helper to get the DragEnd handler function
	# This assumes the DragEnd handler is the last one added or identifiable
	getDragEndHandler = (card) ->
		return card._eventListeners[Events.DragEnd]?[0] # Framer stores listeners in _eventListeners

	performSwipeTest = ->
		return new Promise (resolve, reject) ->
			unless currentFoodCard
				print "No currentFoodCard loaded. Attempting to load one..."
				initialLoadPromise = fetchSwipeableFoods().then -> loadNextFoodCard()
				initialLoadPromise.then ->
					Utils.delay 0.2, resolve # Give a moment for card to be fully set up
				.catch reject
				return
			resolve()

		.then -> # Simulate LIKE
			return new Promise (resolve, reject) ->
				print "Current card for LIKE: #{currentFoodCard?.foodName}"
				unless currentFoodCard and currentFoodCard.draggable # Ensure card is draggable
					print "Cannot simulate LIKE: Card not ready or not draggable."
					return reject("Card not ready for LIKE")

				cardToLike = currentFoodCard
				dragEndHandler = getDragEndHandler(cardToLike)
				unless dragEndHandler
					print "Could not get DragEnd handler for LIKE."
					return reject("No DragEnd handler for LIKE")

				print "Simulating LIKE for: #{cardToLike.foodName}, FDC ID: #{cardToLike.fdcId}"
				cardToLike.x = cardToLike.originalX + Screen.width * 0.4 # Simulate swipe right
				dragEndHandler.call(cardToLike, null, cardToLike) # Call with card as context
				
				Utils.delay 0.5, -> # Allow time for animation and logic to complete
					likedFood = _.find likedFoodsProfile, (item) -> item.fdcId is cardToLike.fdcId
					if likedFood
						print "VERDICT: PASSED - Liked food found in profile."
					else
						print "VERDICT: FAILED - Liked food NOT found in profile."
					print "Liked profile count:", likedFoodsProfile.length
					resolve()

		.then -> # Simulate PASS
			return new Promise (resolve, reject) ->
				# Ensure a new card is loaded (previous one should be destroyed by "Like")
				Utils.delay 0.5, -> # Wait for previous card actions to complete
					unless currentFoodCard and currentFoodCard.draggable
						print "Cannot simulate PASS: New card not ready or not draggable."
						# Attempt to load another card if previous was destroyed as expected
						if not currentFoodCard
							print "Loading another card for PASS test..."
							loadNextFoodCard() # This itself might be async if swipeableFoods is empty
							Utils.delay 0.5, -> # Wait for potential load
								if currentFoodCard and currentFoodCard.draggable
									resolve(currentFoodCard)
								else
									reject("Failed to load new card for PASS")
							return
						else
							return reject("Card not ready for PASS")
					
					resolve(currentFoodCard)
			.then (cardToPass) ->
				print "Current card for PASS: #{cardToPass.foodName}"
				dragEndHandler = getDragEndHandler(cardToPass)
				unless dragEndHandler
					print "Could not get DragEnd handler for PASS."
					return Promise.reject("No DragEnd handler for PASS")

				print "Simulating PASS for: #{cardToPass.foodName}"
				cardToPass.x = cardToPass.originalX - Screen.width * 0.4 # Simulate swipe left
				dragEndHandler.call(cardToPass, null, cardToPass)

				Utils.delay 0.5, -> # Allow time for animation and logic
					print "Liked profile count after PASS:", likedFoodsProfile.length
					if likedFoodsProfile.length is originalLikedProfileLength + 1 # Should still have the one liked item
						print "VERDICT: PASSED - Profile length correct after PASS."
					else
						print "VERDICT: FAILED - Profile length incorrect after PASS. Expected #{originalLikedProfileLength + 1}"
					print "--- Swipe Logic Test Complete ---"
					return Promise.resolve()
			)
		.catch (error) ->
			print "Swipe Logic Test FAILED: #{error}"
			print "--- Swipe Logic Test Complete (with errors) ---"


# --- Test Function for Profile Storage ---
testProfileStorage = ->
	print "\n--- Starting Profile Storage Test ---"
	
	# Test Saving
	print "\nTesting SAVE to localStorage..."
	localStorage.removeItem("likedFoodsProfile") # Clean slate
	likedFoodsProfile = [] # Reset in-memory array
	
	# Simulate adding items and saving (mimicking the 'Like' action's storage part)
	foodA = {fdcId: "test_A", description: "Test Food A"}
	foodB = {fdcId: "test_B", description: "Test Food B"}
	
	likedFoodsProfile.push(foodA)
	likedFoodsProfile.push(foodB)
	try
		localStorage.setItem("likedFoodsProfile", JSON.stringify(likedFoodsProfile))
		print "Saved 2 items to localStorage."
	catch e
		print "Error saving to localStorage in test:", e
	
	jsonData = localStorage.getItem("likedFoodsProfile")
	print "Data from localStorage after save:", jsonData
	unless jsonData and JSON.parse(jsonData).length is 2
		print "VERDICT: FAILED - localStorage save incorrect."
	else
		print "VERDICT: PASSED - localStorage save seems correct."

	# Test Loading
	print "\nTesting LOAD from localStorage..."
	likedFoodsProfile = [] # Clear current memory
	# The app loads from localStorage automatically at startup.
	# To test this explicitly, we'd need to call that specific loading function.
	# For now, let's simulate it by directly calling the load logic.
	try
		storedProfile = localStorage.getItem("likedFoodsProfile") # This should have foodA & foodB
		if storedProfile
			likedFoodsProfile = JSON.parse(storedProfile)
			print "Loaded from localStorage:", likedFoodsProfile
			if likedFoodsProfile.length is 2 and likedFoodsProfile[0].fdcId is "test_A"
				print "VERDICT: PASSED - localStorage load correct."
			else
				print "VERDICT: FAILED - localStorage load incorrect data."
		else
			print "VERDICT: FAILED - Nothing in localStorage to load."
	catch e
		print "Error loading from localStorage in test:", e
		print "VERDICT: FAILED - Error during load."

	# Test Duplicate Prevention
	print "\nTesting DUPLICATE prevention..."
	# likedFoodsProfile should now contain foodA and foodB
	initialLength = likedFoodsProfile.length
	
	# Simulate liking foodB again (which is already in likedFoodsProfile)
	foodToLikeAgain = { fdcId: "test_B", description: "Test Food B" }
	unless isFoodAlreadyLiked(foodToLikeAgain.fdcId)
		likedFoodsProfile.push(foodToLikeAgain)
		try
			localStorage.setItem("likedFoodsProfile", JSON.stringify(likedFoodsProfile))
		catch e
			print "Error saving duplicate to localStorage in test:", e
	else
		print "Duplicate food '#{foodToLikeAgain.description}' was (correctly) not added again."
		
	if likedFoodsProfile.length is initialLength
		print "VERDICT: PASSED - Duplicate prevention seems to work. Profile length: #{likedFoodsProfile.length}"
	else
		print "VERDICT: FAILED - Duplicate prevention failed. Profile length: #{likedFoodsProfile.length}, Expected: #{initialLength}"

	print "--- Profile Storage Test Complete ---"


# --- Test Function for Recipe Building & Storage ---
testRecipeBuildingAndStorage = ->
	print "\n--- Starting Recipe Building & Storage Test ---"
	
	# Ensure recipeInputScreen is visible for inputs to be active (though we call handlers directly)
	s.recipeInputScreen.visible = true
	s.recipeInputScreen.bringToFront()

	localStorage.removeItem("savedRecipes")
	savedRecipes = []
	currentRecipeIngredients = []
	recipeNameInput.value = "Test Recipe Alpha"
	updateCurrentRecipeDisplay() # Clear display

	# Add 2 sample ingredients
	ingr1 = {fdcId: "001", description: "Sugar", quantity: 100, unit: "g"}
	ingr2 = {fdcId: "002", description: "Flour", quantity: 200, unit: "g"}
	currentRecipeIngredients.push(ingr1)
	currentRecipeIngredients.push(ingr2)
	updateCurrentRecipeDisplay()
	print "Added 2 ingredients to current recipe. Display updated."

	# Simulate tapping saveRecipeButton
	saveRecipeButton._eventListeners[Events.Tap]?[0]() # Directly call tap handler
	
	Utils.delay 2.0, -> # Allow time for save animations/messages to clear if any
		print "Saved Recipes array content:", JSON.stringify(savedRecipes)
		if savedRecipes.length is 1 and savedRecipes[0].recipeName is "Test Recipe Alpha" and savedRecipes[0].ingredients.length is 2
			print "VERDICT: PASSED - Recipe saved to array correctly."
		else
			print "VERDICT: FAILED - Recipe not saved to array as expected."

		jsonData = localStorage.getItem("savedRecipes")
		print "Saved recipes to localStorage raw data:", jsonData
		parsedData = JSON.parse(jsonData)
		if parsedData and parsedData.length is 1 and parsedData[0].recipeName is "Test Recipe Alpha"
			print "VERDICT: PASSED - Recipe saved to localStorage correctly."
		else
			print "VERDICT: FAILED - Recipe not saved to localStorage as expected."
		
		if recipeNameInput.value is "" and currentRecipeIngredients.length is 0
			print "VERDICT: PASSED - Recipe form cleared after save."
		else
			print "VERDICT: FAILED - Recipe form not cleared. Name: '#{recipeNameInput.value}', Ingredients: #{currentRecipeIngredients.length}"

		# Test Remove Ingredient
		print "\nTesting INGREDIENT REMOVAL..."
		# Add an ingredient to a new "dummy" recipe (form was cleared)
		recipeNameInput.value = "Recipe for Deletion Test"
		currentRecipeIngredients.push({fdcId: "999", description: "Deletable Item", quantity: 1, unit: "item"})
		updateCurrentRecipeDisplay()
		print "Added one ingredient for removal test. Current ingredients count: #{currentRecipeIngredients.length}"
		
		# Simulate tapping the remove button of the first (and only) ingredient
		# The remove button is dynamically created, so we need to find it.
		if currentRecipeIngredientsScroll.content.children.length > 0
			firstIngredientLayer = currentRecipeIngredientsScroll.content.children[0]
			removeButton = firstIngredientLayer.subLayersByName("removeIngredient_0")?[0]
			if removeButton
				removeButton._eventListeners[Events.Tap]?[0]() # Call tap handler
				Utils.delay 0.1, -> # Allow updateCurrentRecipeDisplay to run
					if currentRecipeIngredients.length is 0
						print "VERDICT: PASSED - Ingredient removal successful."
					else
						print "VERDICT: FAILED - Ingredient removal failed. Count: #{currentRecipeIngredients.length}"
					print "--- Recipe Building & Storage Test Complete ---"
			else
				print "VERDICT: FAILED - Could not find remove button for ingredient removal test."
				print "--- Recipe Building & Storage Test Complete (with errors) ---"
		else
			print "VERDICT: FAILED - No ingredient layer found for removal test."
			print "--- Recipe Building & Storage Test Complete (with errors) ---"


window.calculateFirstRecipeNutrition = ->
	print "\n--- Attempting to Calculate Nutrition for First Saved Recipe ---"
	unless savedRecipes and savedRecipes.length > 0
		print "No saved recipes to calculate. Please run testRecipeBuildingAndStorage or save a recipe manually first."
		return

	recipeToCalc = savedRecipes[0]
	print "Calculating for: #{recipeToCalc.recipeName}"
	print "Ingredients:", JSON.stringify(recipeToCalc.ingredients)
	
	calculateRecipeNutrition(recipeToCalc)
		.then (calculatedNutrients) ->
			print "----------------------------------------------------"
			print "Calculated Nutrition for Recipe: '#{recipeToCalc.recipeName}'"
			print "Total Calories: #{calculatedNutrients.calories.toFixed(2)} kcal"
			print "Total Carbs: #{calculatedNutrients.carbs.toFixed(2)}g"
			print "Total Fiber: #{calculatedNutrients.fiber.toFixed(2)}g"
			print "Total Sugars: #{calculatedNutrients.sugars.toFixed(2)}g"
			if calculatedNutrients.skippedIngredients.length > 0
				print "Skipped Ingredients (#{calculatedNutrients.skippedIngredients.length}):"
				for skipped in calculatedNutrients.skippedIngredients
					print "  - #{skipped.description} (Unit: #{skipped.unit}, Reason: #{skipped.reason or 'Unit not grams'})"
			
			healthCheckResult = performHealthCheck(calculatedNutrients)
			print "\nHealth Check for Recipe (Total Amount - PoC Simplification):"
			print "  Is Considered Healthy: #{healthCheckResult.isConsideredHealthy}"
			if healthCheckResult.issues.length > 0
				print "  Issues:"
				for issue in healthCheckResult.issues
					print "    - #{issue}"
			print "Note: This health check for recipes is based on the total nutritional content of the entire recipe. It does not yet account for serving sizes, which is a simplification for this Proof of Concept."
			print "----------------------------------------------------"
			
			if not healthCheckResult.isConsideredHealthy
				suggestions = generateBasicSuggestions(healthCheckResult.issues, recipeToCalc)
				print "\nSuggestions for '#{recipeToCalc.recipeName}':"
				if suggestions.length > 0
					for suggestion in suggestions
						print "  - #{suggestion}"
				else
					print "  - No specific suggestions generated, but review issues."
			else
				print "\nNo specific modification suggestions needed for '#{recipeToCalc.recipeName}'."
			print "----------------------------------------------------"

		.catch (error) ->
			print "Error during overall nutrition calculation for '#{recipeToCalc.recipeName}':", error

window.testSwipeLogic = testSwipeLogic
window.testProfileStorage = testProfileStorage
window.testRecipeBuildingAndStorage = testRecipeBuildingAndStorage

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
