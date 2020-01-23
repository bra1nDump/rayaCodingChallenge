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
        NavigationLink(show.show.name, destination: SeasonsView(showId: show.show.id))
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
    @ObservedObject var seasons: Seasons
    @State var presentedEpisode: Model.Episode?
    
    init(showId: Int) {
        seasons = Seasons(showId: showId)
    }
    
    var body: some View {
        List {
            ForEach.init(seasons.seasons, id: \.first?.season) { (episodes: Model.Episodes) in
                Section(header: Text("\(episodes.first!.season)")) {
                    ForEach<[Model.Episode], Int, EpisodeRowView>(episodes, id: \.id) {
                        (episode: Model.Episode) in
                        EpisodeRowView(episode: episode) {
                            self.presentedEpisode = episode
                        }
                    }
                }
            }
        }
        .onAppear(perform: seasons.load)
        .popover(item: $presentedEpisode, content: EpisodeView.init)
    }
}

struct EpisodeRowView: View {
    let episode: Model.Episode
    let onSelect: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            UrlImage(url: episode.image.medium)
                .frame(width: 50, height: 50)
                .clipped()
            
            VStack {
                Text(episode.name)
                Text("Episode \(episode.number)")
                Text(episode.summary)
            }
        }.onTapGesture(perform: onSelect)
    }
}

// MARK: Episode
struct EpisodeView: View {
    let episode: Model.Episode
    
    var body: some View {
        VStack {
            UrlImage(url: episode.image.original)
            Text("Season \(episode.season) Episode \(episode.number)")
            Text(episode.name)
            ScrollView {
                Text(episode.summary)
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
            SeasonsView(showId: 1)
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
            return AnyView(Image.init(uiImage: uiImage))
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
