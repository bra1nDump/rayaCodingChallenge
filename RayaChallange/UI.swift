import SwiftUI
import Combine

// MARK: Shows
class ShowsSearch: ObservableObject {
    @Published var query = ""
    @Published var shows = MockData.searchShowsSample
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
            
            List.init(searchShows.shows, id: \.show.id, rowContent: ShowRowView.init)
        }
    }
}

struct ShowRowView: View {
    let show: Data.SearchShow
    
    var body: some View {
        NavigationLink(show.show.name, destination: SeasonsView(showId: show.show.id))
    }
}

// MARK: Seasons
struct SeasonsView: View {
    let showId: Int
    
    var seasons: [Data.Episodes] {
        MockData.episodesSample.group { $0.season == $1.season }
    }
    
    @State var presentedEpisode: Data.Episode?
    
    var body: some View {
        List {
            ForEach.init((0..<seasons.count)) { (index: Int) in
                Section(header: Text("\(self.seasons[index].first!.season)")) {
                    ForEach<[Data.Episode], Int, EpisodeRowView>(self.seasons[index], id: \.id) {
                        (episode: Data.Episode) in
                        EpisodeRowView(episode: episode) {
                            self.presentedEpisode = episode
                        }
                    }
                }
            }
        }
        .popover(item: $presentedEpisode, content: EpisodeView.init)
    }
}

struct EpisodeRowView: View {
    let episode: Data.Episode
    let onSelect: () -> Void
    
    var body: some View {
        HStack {
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
    let episode: Data.Episode
    
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

// MARK: helpers
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
            }
        }
        
        if currentGroup.isNotEmpty {
            groups.append(currentGroup)
        }
        
        return groups
    }
}
