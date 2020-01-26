import SwiftUI
import Combine

class Seasons: ObservableObject {
    @Published var seasons: [TvMaze.Episodes] = []
    private var showId: Int
    private var cancelEpisodesTask: AnyCancellable?
    
    init(showId: Int) {
        self.showId = showId
    }
    
    func load() {
        cancelEpisodesTask =
            TvMaze
            .episodes(showId: showId)
            .sink { (episodes) in
                self.seasons = episodes.group(by: { $0.season == $1.season })
            }
    }
}

struct SeasonsView: View {
    let showName: String
    @ObservedObject var seasons: Seasons
    @State var presentedEpisode: TvMaze.Episode?
    
    init(show: TvMaze.Show) {
        showName = show.name
        seasons = Seasons(showId: show.id)
    }
    
    var body: some View {
        List {
            ForEach.init(seasons.seasons, id: \.first?.season, content: season)
        }
        .navigationBarTitle(showName)
        .onAppear(perform: seasons.load)
        .popover(item: $presentedEpisode) { (episode) in
            EpisodeView(episode: episode)
        }
    }
    
    func season(episodes: TvMaze.Episodes) -> some View {
        Section(header: Text("Season \(episodes.first!.season)").font(.largeTitle)) {
            ForEach.init(episodes, id: \.id, content: episode)
        }
    }
    
    func episode(episode: TvMaze.Episode) -> some View {
        HStack(alignment: .top) {
            UrlImage(url: episode.image.medium)
                .frame(width: 100, height: 100)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(episode.name).font(.headline)
                    Text("Episode \(episode.number)").font(.subheadline)
                    Text(episode.summary.dropOuterHtmlTag("p"))
                }
                
                Image("NavigationLinkArrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
            }
        }
        .onTapGesture {
            let rootViewController = UIApplication.shared.rootViewController
            rootViewController?.present(UIHostingController(rootView: EpisodeView(episode: episode)), animated: true)
        }
    }
}

#if DEBUG
struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonsView(show: TvMazeSamples.searchShows.first!.show)
    }
}
#endif
