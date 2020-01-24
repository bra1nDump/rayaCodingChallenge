# TLDR

Thanks to Raya for giving me this assignment. It was an amazing experience learing more about new developments in `Swift`. The app is written using `SwiftUI + Combine` without any additional libraries. I believe the spec were met well. As with any codebase there is room for improvment, and to indicate the lines along which I was thinking I included more tasks that I have completed. Hopefully this format will go well with you and whoever is reading my code (probably Josh :)) will have a ~~great~~ ok time.

The major flaw of my implementation is that the state is highly coupled with the UI. I think it doesnt make much sense to use a Redux like approach to state managment since data flow is unidirectional. An example of bidirectional flow would be if we could add/remove episodes to "watch later" from the episode detail view and later see all those episodes in another part of the application, this is where a separate approach to storing data would really pay off. In our case separation only helps testing. Which ... well lets try to cover that with UI tests! I am really excited to try recording one.

# Roadmap

## Planning - start timer

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
- [x] + ~4 hours 
- [x] Navigation
- [x] + ~2 hours

## Http client 

- [x] Extend `URLSession` with get helper
- [x] Create `TvMaze` api client
- [x] + ~3 hours

## Search (gluing api + view together)

- [x] Create `SearchShows` that would manage search screen state
- [x] + ~5 hours
- [x] Create `Seasons` that would manage show detail screen
- [x] + ~0 hours

## Stop timer - 16 hours

## Polish (the fun part)

- [x] Reread the initial assignment, look for anything more urgent then the following tasks // IMPORTANT
  - [x] "Use a regular UITableViewCell for the results; there is no need for a custom cell class" - unable to meet using SwiftUI
  - [x] "Use a custom cell class to match the layout in the included sketch file". 
    - [x] Align the top of the image with that
    - [x] Remove <p> from the episode description
        - [x] option 1 - filter <p> </p> tags out - not scalable, what if the api returns other html attributes? What if we want to display multiple paragraphs?
        - [ ] option 2 - create `UIViewRepresentable` that will put `UIKit.UITextView` into the hirarhy (also cool excersize to interop with UIKit)
    - [x] Change default sizes of the title
    - [x] Add rounded edges to the image (can be done on the `UrlImage` level)
    - [x] Align left episode cell content
    - [x] Add arrow to episode cell
    - [x] Align arrow center verticaly & image top vertically useful article: https://swiftui-lab.com/alignment-guides/. Right now using a workaround - 2 `HStack`s
- [x] Make sure parsing doesnt fail remove fields that are not needed from the data model, read tvmaze api
- [x] Looks like rn api requests are created for each show  episodes 
- [x] Restructure project
- [x] Remove mock data with #if 
- [x] Reduce the number of view subclasses
- [x] Move model to TvMaze, since rn its is hightly coupled with that API with no intention to support multple sources
- [x] TvMaze doesn't seem to support paging https://www.tvmaze.com/threads/8/paging-api
- [x] Make sure things are swifty
- [x] Make sure application lifecycle works well (new to scenes)
- [x] Remove arbitrary loads (allow only one domain)
- [x] Watch out for force unwraping (in http client `URL` creation it would be ok, but in `URLSession` extension this is bad, since this no guarantees on string url passed)
- [x] Make sure queries with special symbols get handled correctly (good place for unit test?)

## Extra

- [ ] Add `UIKit` component (didnt work out, tried displaing html in a `UITextView`)
- [ ] Create custom subscriber for better understanding of `Combine`
- [ ] Add documentation strings to the generally useful elements
- [ ] Layout is not flexible rn (only tested on one device)
- [ ] Would be good to inject data into the views for faster iterations on the laout
- [ ] Extend `XCTest` framework with something to test streams in `Combine` to avoid creating mu

# Tests

## Unit

- [x] TV maze api response parsing
- [x] Array `group(by:)` (caught bug with single element in group `XCTAssertEqual failed: ("[[1, 1], [3, 3]]") is not equal to ("[[1, 1], [4], [3, 3]]")`)
- [x] TvMaze
  - [x] search
  - [x] show
  
  ## UI
  
  - [ ] Seasons

# Challenges/findings

- Attempting to use binding to respond to list selection
- No documentation whatsoever on the SelectedValue type
- Collisions of derived type from json & `SwiftUI` (Image)
- When conditionally return different types from var body: some View cannot return different types. Type erasure fails here. Need to wrap in AnyView
- When having more than one statement in a closure the compiler is having a really hard time. For example i had `ForEach(range: ... ) { (index: Int) in let season = seasons[index]; return .. }`. This it wasnt able to infer with an error - complex closure cannot infer type. Best troubleshooting in this case I found so far is to start annotating types of parameters (which is what the compiler wanted me to do in the first place)
- Navigation took a little more time then expected. This happened because I have tryied a couple of different ways to handle the state of the application. Right now I went with not a very scalable (not very teststable) solution.
- Combine seems to suffer from making too many complicated types. Dont really undertand why we need to wrap every operation's result in some more concreete type (is it because publishers are implemented with `struct`?). In any case at least we got type errasure working pretty well. Interresting what is the mechanism of the method `erraseToAnyPublisher()`, I dont think i was able to successfully create a function returning opaque type
- Interresting why do methods with no parameter even exist? Is it just so they can be passed around? If yes, then why dont getters support being passed around as a function
- Attempts taken to connect publisher (created by `TvMaze`):
  - Attempting minimum code writing - ideally just able to run `.body` every time a publisher publishes a value
  - `extension AnyPublisher: ObservableObject where Failure: Never` (struct conformance to class protocol error)
- When trying to use debounce function and using this code: 
```
      let halfSecond = ImmediateScheduler.SchedulerTimeType.Stride.seconds(4)
      .debounce(for: halfSecond, scheduler: ImmediateScheduler.shared)
```

  getting this exception: `Thread 1: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)`. TODO: get to the bottom of this, why is this happening? Debugger shows halfSecond.magnitude = 0 ? strange. This ok the docs keep mentioning that in case of `ImmediateScheduler` shit is meaningless.. but `Scheduler` proptocol and implementations seem under documented. 
  Veery interesting. I was expecting `DispatchQueue` to conform to `Scheduler` protocol, I was just confused by seing it in the `Combine` framework. I though its a different one. So initially I found a function to create time using the `ImmediateScheduler`, which obviously wouldnt work with `DispatchQueue` as the scheduler. Of course just having a closer look at the `debounce` signature `debounce<S>(for dueTime: S.SchedulerTimeType.Stride, scheduler: S, ...` we can see the generic parameter `S`, which in my first attempt was trying to be both `DispatchQueue and ImmediateScheduler`. What I learned - again, instead of just trying a bunch of things we need to look at what the compiler tells us! By the way, what does it tell us? Lets find out! This is the compilation error: `Cannot invoke 'debounce' with an argument list of type '(for: ImmediateScheduler.SchedulerTimeType.Stride, scheduler: DispatchQueue)'` . I personally think it sucks. It basically juse says that something is wrong with the type of the parameters. What is interresting on what stage of the type inference does it break and if xcode just dummed down the error description provided to the end user.
- Tryied starting out simle again

```
@State var seasons: [Data.Episodes] = []
private var cancelEpisodesTask: AnyCancellable

init(showId: Int) {
    cancelEpisodesTask =
        TvMaze.episodes(showId: showId)
            .sink(receiveValue: { (episodes) in
                self.seasons = episodes.group(by: { $0.season == $1.season })
            })
}

----
error: Escaping closure captures mutating 'self' parameter
```

Need to figure out the exact limitations on structs so I avoid the approach of just "pocking" around. For now will go with what I already know which is create a sublcass of `ObservableObject` like for show search screen.


- SwiftUI preview has failed me! :)) The project compiles just fine for running on the device, but when I try to do a preview I get this errors: 

```
'Data' is ambiguous for type lookup in this context

----------------------------------------

BuildError: Failed to build UI.swift

Compiling failed: 'Data' is ambiguous for type lookup in this context

failedToBuildDylib: /Users/Kostas/Desktop/kirill/RayaChallange/RayaChallange/UI.swift:80:35: error: 'Data' is ambiguous for type lookup in this context
                        (episode: Data.Episode) in
                                  ^~~~
<unknown>:0: note: found this candidate
Foundation.Data:1:15: note: found this candidate
public struct Data : ReferenceConvertible, Equatable, Hashable, RandomAccessCollection, MutableCollection, RangeReplaceableCollection, MutableDataProtocol, ContiguousBytes {
              ^
/Users/Kostas/Desktop/kirill/RayaChallange/RayaChallange/UI.swift:79:30: error: 'Data' is ambiguous for type lookup in this context
                    ForEach<[Data.Episode], Int, EpisodeRowView>(self.seasons.seasons[index], id: \.id) {
                             ^~~~
<unknown>:0: note: found this candidate
Foundation.Data:1:15: note: found this candidate
public struct Data : ReferenceConvertible, Equatable, Hashable, RandomAccessCollection, MutableCollection, RangeReplaceableCollection, MutableDataProtocol, ContiguousBytes {
              ^
```

- Well this test saved me some time. I have assumed string encoding out of the `value` getter :). Nope
```
func testURLQueryItemValueWorksAsExpected() {
    XCTAssertEqual(
        URLQueryItem.init(name: "q", value: "Model Squad")
        , "q=Model+Squad"
    )
}

-- error
XCTAssertEqual failed: ("Optional("Model Squad")") is not equal to ("Optional("q=Model+Squad")")
```

- While fixing the bug with all episodes being loaded for each show that appears on the search this happened:

```
ForEach<Range<Int>, Int, Section<Text, ForEach<Array<Episode>, Int, EpisodeRowView>, EmptyView>> count (6) != its initial count (0). `ForEach(_:content:)` should only be used for *constant* data. Instead conform data to `Identifiable` or use `ForEach(_:id:content:)` and provide an explicit `id`!
```

This error didn't show itself before because the episodes would be loaded before the user even went to the show detail screen. So the view wasnt getting rendered (even tho the data was still loading asynchronously). Will fix as suggested by using a keypath to season number to identify elements

- When creating `HtmlText: UIViewRepresentable` struct to render html strings within `SwiftUI` I didnt implement the update function for the text. I believe this might potentially cause trouble when reusing the view in the `List`. My assumption is that it will not work, but it really depends on how the library handles those updates. And if it does work, I will be alarmed, because that would mean that even if the 'cells' do ge reused the `UITextView`s that back `HtmlText` in every episode cell dont get reused. Lets find out!

- Attempt to use attributed string in `UITextView` has failed. I have attempted to construct the attributes using some copy paste code for swift 4 from stackoverflow which errors out with this: 

```
=== AttributeGraph: cycle detected through attribute 42 ===
=== AttributeGraph: cycle detected through attribute 45 ===
=== AttributeGraph: cycle detected through attribute 45 ===
=== AttributeGraph: cycle detected through attribute 56 ===
=== AttributeGraph: cycle detected through attribute 113 ===
=== AttributeGraph: cycle detected through attribute 204 ===
....
```

- IMPORTANT TODO: need to figure out how to not nest mutlple stacks of the same type to achive differnt allignments relative to the superview. Example is `Show.episode` Image needs to be top aligned, navigation arrow needs to be center aligned. But only one alignment guide can be selected for the container. Coundt figure out a clean solution so far, but the workaround is not critical
- `open func | var`  in a an `open class` - example `XCTestCase` ? https://github.com/apple/swift-evolution/blob/master/proposals/0117-non-public-subclassable-by-default.md
- Application did finish launching - still needed even if we are using scenes? Looks like not required to be overriden
