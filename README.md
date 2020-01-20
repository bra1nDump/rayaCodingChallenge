## Planning

- [x] Create roadmap document (intially in google doc)
- [x] Read about ReSwift (decide to use Combine and not complicate things)
- [x] + ~2 hours

## Setup project

- [x] Warm up on typing.io
- [x] Clean default xcode project from comments
- [x] Create github repo
- [x] Initial commit

## Data

- [x] Familiarize with api
- [x] Get API sample responses 
- [x] Save sample data
- [x] Create tests for data parsing 
- [x] Generate codable classes

## UI

- [x] Shows search
- [x] Seasons
- [x] Episode
- [x] + ~4 hours mark 
- [ ] Navigation

## Http client 

- [ ] Write tests
- [ ] Copy some nsurl get helper

## State management 

- [ ] V1 app state
- [ ] Shows
- [ ] ShowDetails?
- [ ] Pagination

## UI Tests

## Polish

- [ ] Data <-> view dependencies setup efficiently
- [ ] List, ForEach and friends reuse views efficiently
- [ ] Remove mock data with #if 
- [ ] Make sure application lifecycle wors well (new to scenes)
- [ ] Localization
- [ ] Remove arbitrary loads (allow only one domain)

## Extra credit

- [ ] Add escaping example to show that might affect where variable is allocated?

## Look into

- [ ] Open func / var in a an open class - example XCTestCase ?
- [ ] Application did finish launching - still needed even if we are using scenes?

## Challenges

- Attempting to use binding to respond to list selection
- No documentation whatsoever on the SelectedValue type
- Collisions of derived type from json & SwiftUI (Image)
- When conditionally return different types from var body: some View cannot return different types. Type erasure fails here. Need to wrap in AnyView
- When having more than one statement in a closure the compiler is having a really hard time. For example i had ForEach(range: ... ) { (index: Int) in let season = seasons[index]; return .. }. This it wasnt able to infer with an error - complex closure cannot infer type. Best troubleshooting in this case I found so far is to start annotating types of parameters (which is what the compiler wanted me to do in the first place)
