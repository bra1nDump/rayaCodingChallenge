# Raya iOS Code Challenge

Using the provided sketch files and endpoints below, create a NavigationController based app with 3 view controllers.

## Requirements
* You can use any architecture (MVC, MVVM, ReSwift, Viper, MVP, etc.) 
* You can make your UI in code, using nib files or with Storyboards
* All image url's should be loaded asynchronously
* Create a repo on github, gitlab or bitbucket, upload your code and send us the link
* If you choose to use swift `Codable` to handle your json responses, you can codegen your model classes with quicktype.io, but beware that the generated code is only as good as the data you supply and it may get optional properties wrong
* You can include any cocoapods you feel are necessary to complete the project
* We are not concerned with the font sizes, colors or spacing of your views; we are concerned with how you structure your views and constraints.

### API
* No APIKey is needed to use this api
* You can find complete documentation here: https://www.tvmaze.com/api
* You will only be using two endpoints: "Show search" & "Show episode" as outlined below

### TVShow View Controller
* Use the "Show search" URL.  Example: http://api.tvmaze.com/search/shows?q=girls
* Search as you type.  Debounce the user input by not sending any search requests until after the user stops typing for 0.5 seconds
* Cancel any in flight network requests before making a new search request
* Treat errors the same as an empty array of shows (ie show no rows in the tableview)
* Use a regular UITableViewCell for the results; there is no need for a custom cell class

### Seasons View Controller
* Use the "Show episode" URL. Note that this api returns an array of episodes.  You need to group these by season number. Example: http://api.tvmaze.com/shows/1/episodes
* There should be a header for each season that shows the season title: "Season 1"
* Thumbnails for each image should load asynchronously using the `medium` property on the sample json
* Treat errors the same as an empty array of episodes (ie show no rows in the tableview)
* Use a custom cell class to match the layout in the included sketch file

### Episode View Controller
* No API call; pass in the episode data from the seasons above
* The Episode View Controller should be presented modally
*
* The image should load asynchronously using the `original` property on the episode.image json

