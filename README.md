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
- [ ] Array `group(by:)` (caught bug with single element in group `XCTAssertEqual failed: ("[[1, 1], [3, 3]]") is not equal to ("[[1, 1], [4], [3, 3]]")`)
- [x] TvMaze
  - [x] search
  - [x] show

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
- [ ] Create `Seasons` that would manage show detail screen

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
- [ ] Create custom subscriber for better understanding of `Combine`

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
