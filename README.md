# Roadmap and notes

Usually when I write things down that I want to do I am much more efficient. Since this is an interview coding challange I am going a little beyond my normal levels of detail ~~and curiousity~~ so please if you do hire me, do not expect the same hahaha :). 

The plan can be created but will always be changing. Initially I have used a google doc to host this, but soon realised that it doesnt make sense to separate the plan from the repository. I actually believe looking at the way my plan evolved and got refactored can be even more useful then looking at the code itself (actually just hit cmd + R and dont look under the hood at all, I promise it's ~~amazing~~ ok.

## Planning

- [x] Create roadmap document (intially in google doc)
- [x] Read about ReSwift (decide to use Combine and not complicate things)
- [x] + ~2 hours

## Setup project

- [x] Warm up on typing.io
- [x] Clean default xcode project from comments
- [x] Create github repo
- [x] Initial commit

## Unit tests

- [x] TV maze api response parsing
- [x] Array `group(by:)` (caught bug with single element in group `XCTAssertEqual failed: ("[[1, 1], [3, 3]]") is not equal to ("[[1, 1], [4], [3, 3]]")`)
- [x] TvMaze
  - [x] search
  - [x] show
  
## Timer start

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
- [x] Create `TvMaze` namespace with 
- [x] + ~3 hours

## Search (gluing api + view together)

- [x] Create `SearchShows` that would manage search screen state
- [x] + ~5 hours
- [x] Create `Seasons` that would manage show detail screen
- [x] + ~0 hours

## Timer stop (base implemented): 16 hours

## Polish (the fun part)

- [x] Reread the initial assignment, look for anything more urgent then the following tasks // IMPORTANT
  - [x] "Use a regular UITableViewCell for the results; there is no need for a custom cell class" - unable to meet using SwiftUI
  - [ ] "Use a custom cell class to match the layout in the included sketch file". 
    - [x] Align the top of the image with that
    - [ ] Truncate the description size if too big (max lines property or something) (update: doesnt look like anything in the docs mention that)
    - [ ] Remove <p> from the episode description
        - [x] option 1 - filter <p> </p> tags out - not scalable, what if the api returns other html attributes? What if we want to display multiple paragraphs?
        - [ ] option 2 - create `UIViewRepresentable` that will put `UIKit.UITextView` into the hirarhy (also cool excersize to interop with UIKit)
    - [ ] Change default sizes of the title
    - [ ] Add rounded edges to the image (can be done on the `UrlImage` level)
    - [ ] Align left episode cell content
    - [ ] Add arrow to episode cell
  -  [ ] Episode detail 
    - [ ] "The views on this View Controller should be in a UIScrollView so that they scroll on devices with smaller screens." This was the original implementation. Later I made only the description scrollable, because I thought the scroll on the entire screen could intefeer with the dismissal of the screen.
    - [ ] Gradient on the background?
- [x] Make sure parsing doesnt fail remove fields that are not needed from the data model, read tvmaze api
- [x] Looks like rn api requests are created for each show  episodes 
- [ ] Data <-> view dependencies setup efficiently (I guess this is handled by the `SwiftUI`, but could be a good excersize to verify)
- [ ] `List`, `ForEach` and friends reuse views efficiently
- [ ] Separate code from the UI.swift to appropriate files
- [ ] Remove mock data with #if 
- [ ] Make sure application lifecycle works well (new to scenes)
- [ ] Localization
- [ ] Remove arbitrary loads (allow only one domain)
- [ ] Watch out for force unwraping (in http client `URL` creation it would be ok, but in `URLSession` extension this is bad, since this no guarantees on string url passed)
- [ ] Make sure queries with special symbols get handled correctly (good place for unit test?)
- [ ] Layout is not flexible rn (only tested on one device)

## Extra credit

- [ ] Add escaping example to show that might affect where variable is allocated?
- [ ] Add `UIKit` component
- [ ] Integration tests
- [ ] UI tests (this doest make much sense for such a small project, but just to familarize with the process)
- [ ] Create custom subscriber for better understanding of `Combine`
- [ ] Add psedo code timer that will track the time I spent on this assignment
- [ ] Add documentation strings to the generally useful elements

### Things for my `Prelude`

- [ ] Extend `XCTest` framework with something to test streams in `Combine`
- [ ] Create helper `FutureView` | `FutureBuilder` for building 

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
