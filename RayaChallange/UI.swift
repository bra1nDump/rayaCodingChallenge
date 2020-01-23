import SwiftUI
import Combine

// MARK: Shows
class ShowsSearch: ObservableObject {
    @Published var query = ""
    @Published var searchShows = Model.ShowSearchMatches()
    
    var cancelQuery: AnyCancellable?
    var cancelSeachShows: AnyCancellable?
    
    init() {
        let halfSecond = DispatchQueue.SchedulerTimeType.Stride.seconds(0.5)
        cancelQuery = $query
            .debounce(for: halfSecond, scheduler: DispatchQueue.main)
            .sink { (query) in
                self.cancelSeachShows =
                    TvMaze
                    .search(query: query)
                    .sink { (result) in
                        self.searchShows = result
                    }
            }
    }
}

struct SearchShowsView: View {
    @ObservedObject var searchShows = ShowsSearch()
    
    var body: some View {
        VStack {
            HStack {
                TextField.init("Search", text: $searchShows.query)
                Button.init("Clear", action: {
                    self.searchShows.query = ""
                })
            }
            
            List.init(searchShows.searchShows, id: \.show.id, rowContent: ShowRowView.init)
        }
    }
}

struct ShowRowView: View {
    let show: Model.ShowSearchMatch
    
    var body: some View {
        NavigationLink(show.show.name, destination: SeasonsView(show: show.show))
    }
}

// MARK: Seasons
class Seasons: ObservableObject {
    @Published var seasons: [Model.Episodes] = []
    private var showId: Int
    private var cancelEpisodesTask: AnyCancellable?
    
    init(showId: Int) {
        self.showId = showId
    }
    
    func load() {
        cancelEpisodesTask =
            TvMaze
            .episodes(showId: showId)
            .sink(receiveValue: { (episodes) in
                self.seasons = episodes.group(by: { $0.season == $1.season })
            })
    }
}

struct SeasonsView: View {
    let showName: String
    @ObservedObject var seasons: Seasons
    @State var presentedEpisode: Model.Episode?
    
    init(show: Model.Show) {
        showName = show.name
        seasons = Seasons(showId: show.id)
    }
    
    var body: some View {
        List {
            ForEach.init(seasons.seasons, id: \.first?.season) { (episodes: Model.Episodes) in
                Section(header: Text("Season \(episodes.first!.season)").font(.largeTitle)) {
                    ForEach<[Model.Episode], Int, EpisodeRowView>(episodes, id: \.id) { (episode: Model.Episode) in
                        EpisodeRowView(episode: episode) {
                            self.presentedEpisode = episode
                        }
                    }
                }
            }
        }
        .navigationBarTitle(showName)
        .onAppear(perform: seasons.load)
        .popover(item: $presentedEpisode, content: EpisodeView.init)
    }
}

extension String {
    /// - Warning: This will not verify if the string has the outer tags. A better version of this should return `Substring?`
    ///     and fail if the string is not in the form of <tag>...</tag>. Also this will fail for any tags that are parametrized.
    func dropOuterHtmlTag(_ tag: String) -> Substring {
        dropFirst(tag.count + 2).dropLast(tag.count + 3)
    }
}

struct EpisodeRowView: View {
    let episode: Model.Episode
    let onSelect: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            UrlImage(url: episode.image.medium)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(episode.name).font(.headline)
                Text("Episode \(episode.number)").font(.subheadline)
                Text(episode.summary.dropOuterHtmlTag("p"))
            }
            
        }.onTapGesture(perform: onSelect)
    }
}

// MARK: Episode
struct EpisodeView: View {
    let episode: Model.Episode
    
    var body: some View {
        VStack(spacing: 10) {
            UrlImage(url: episode.image.original)
                .padding()
            Text("Season \(episode.season) Episode \(episode.number)")
                .font(.largeTitle)
            Text(episode.name)
                .font(.title)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()
            ScrollView {
                Text(episode.summary.dropOuterHtmlTag("p"))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

struct AppView: View {
    var body: some View {
        NavigationView {
            SearchShowsView()
            .navigationBarTitle("Show Search")
        }
    }
}

struct SearchShowsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchShowsView()
            SeasonsView(show: MockData.searchShowsSample.first!.show)
            EpisodeView(episode: MockData.episodesSample.first!)
        }
    }
}

// MARK: SwiftUI UrlImage
class UrlImageSource: ObservableObject {
    @Published var uiImage: UIImage?
    private var stream: AnyCancellable?
    
    init(url: String) {
        stream = URLSession.shared
            .dataTaskPublisher(for: URL(string: url)!)
            .sink(receiveCompletion: { _ in }) { (arg: URLSession.DataTaskPublisher.Output) in
                // TODO: weak caputure? is it needed if cancelable will be called when object dealocated
                let (data, _) = arg
                DispatchQueue.main.async {
                    self.uiImage = UIImage.init(data: data)!
                }
            }
    }
}

struct UrlImage: View {
    @ObservedObject var urlImageSource: UrlImageSource
    
    init(url: String) {
        urlImageSource = UrlImageSource(url: url)
    }
    
    var body: some View {
        if let uiImage = urlImageSource.uiImage {
            return AnyView(
                Image.init(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            )
        } else {
            return AnyView(Text(""))
        }
    }
}

extension Array {
    var isNotEmpty: Bool { !self.isEmpty }
    
    func group(by: (Element, Element) -> Bool) -> [[Element]] {
        var currentGroup: [Element] = []
        var groups: [[Element]] = []
        for current in self {
            guard let lastInGroup = currentGroup.last else {
                currentGroup.append(current)
                continue
            }
            
            if by(lastInGroup, current) {
                currentGroup.append(current)
            } else {
                groups.append(Array(currentGroup))
                currentGroup.removeAll()
                currentGroup.append(current)
            }
        }
        
        if currentGroup.isNotEmpty {
            groups.append(currentGroup)
        }
        
        return groups
    }
}
