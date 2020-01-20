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

## Unit tests

- [x] TV maze api response parsing
- [ ] Array `group(by:)`
- [ ] TvMaze
  - [ ] search
  - [ ] show

## UI

- [x] Shows search
- [x] Seasons
- [x] Episode
- [x] + ~4 hours 
- [x] Navigation
- [x] + ~2 hours

## Http client 

- [x] Extend `URLSession` with get helper
- [x] Create `TvMaze` namespace with 

## State management 

- [ ] V1 app state
- [ ] Shows
- [ ] ShowDetails?
- [ ] Pagination

## Polish

- [ ] Data <-> view dependencies setup efficiently
- [ ] `List`, `ForEach` and friends reuse views efficiently
- [ ] Remove mock data with #if 
- [ ] Make sure application lifecycle wors well (new to scenes)
- [ ] Localization
- [ ] Remove arbitrary loads (allow only one domain)
- [ ] Watch out for force unwraping (in http client `URL` creation it would be ok, but in `URLSession` extension this is bad, since this no guarantees on string url passed)
- [ ] Make sure queries with special symbols get handled correctly (good place for unit test?)

## Extra credit

- [ ] Add escaping example to show that might affect where variable is allocated?
- [ ] Add `UIKit` component
- [ ] Integration tests
- [ ] UI tests (this doest make much sense for such a small project, but just to familarize with the process)

- [ ] Extend `XCTest` framework with something to test streams in Combine framework

## Look into

- [ ] `open func | var`  in a an `open class` - example `XCTestCase` ?
- [ ] Application did finish launching - still needed even if we are using scenes?

## Challenges/findings

- Attempting to use binding to respond to list selection
- No documentation whatsoever on the SelectedValue type
- Collisions of derived type from json & `SwiftUI` (Image)
- When conditionally return different types from var body: some View cannot return different types. Type erasure fails here. Need to wrap in AnyView
- When having more than one statement in a closure the compiler is having a really hard time. For example i had `ForEach(range: ... ) { (index: Int) in let season = seasons[index]; return .. }`. This it wasnt able to infer with an error - complex closure cannot infer type. Best troubleshooting in this case I found so far is to start annotating types of parameters (which is what the compiler wanted me to do in the first place)
- Navigation took a little more time then expected. This happened because I have tryied a couple of different ways to handle the state of the application. Right now I went with not a very scalable (not very teststable) solution.
- Combine seems to suffer from making too many complicated types. Dont really undertand why we need to wrap every operation's result in some more concreete type (is it because publishers are implemented with `struct`?). In any case at least we got type errasure working pretty well. Interresting what is the mechanism of the method `erraseToAnyPublisher()`, I dont think i was able to successfully create a function returning opaque type
- Interresting why do methods with no parameter even exist? Is it just so they can be passed around? If yes, then why dont getters support being passed around as a function

