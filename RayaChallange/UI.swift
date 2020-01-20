import SwiftUI
import Combine

// MARK: Shows
struct SearchShowsView: View {
    let shows = MockData.searchShowsSample
    
    @State var query = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField.init("Search", text: $query)
                Button.init("Clear") {
                    self.query = ""
                }
            }
            
            List.init(shows, id: \.show.id, rowContent: ShowRowView.init)
        }
    }
}

struct ShowRowView: View {
    let show: Data.SearchShow
    
    var body: some View {
        Text(show.show.name)
    }
}

// MARK: Seasons
struct SeasonsView: View {
    let seasons = MockData.episodesSample.group { $0.season == $1.season }
    
    var body: some View {
        List {
            ForEach.init((0..<seasons.count)) { (index: Int) in
                Section(header: Text("\(self.seasons[index].first!.season)")) {
                    ForEach<[Data.Episode], Int, EpisodeRowView>(self.seasons[index], id: \.id, content: EpisodeRowView.init)
                }
            }
        }
    }
}

struct EpisodeRowView: View {
    let episode: Data.Episode
    
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
        }.onTapGesture {
            print("mutate state above to go to detail")
        }
    }
}

// MARK: Episode
struct EpisodeView: View {
    let episode: Data.Episode
    
    var body: some View {
        ScrollView {
            UrlImage(url: episode.image.original)
            Text("Season \(episode.season) Episode \(episode.number)")
            Text(episode.name)
            Text(episode.summary)
        }
    }
}

struct AppView: View {
    
    var body: some View {
        NavigationView {
            //SearchShowsView()
            SeasonsView()
            .navigationBarTitle("Show Search")
        }
    }
}

struct SearchShowsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchShowsView()
            SeasonsView()
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
