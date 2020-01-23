import SwiftUI
import Combine

class ShowsSearch: ObservableObject {
    @Published var query = ""
    @Published var searchShows = TvMaze.ShowSearchMatches()
    
    var cancelQuery: AnyCancellable?
    var cancelSeachShows: AnyCancellable?
    
    init() {
        let halfSecond = DispatchQueue.SchedulerTimeType.Stride.seconds(0.5)
        cancelQuery =
            $query
            .debounce(for: halfSecond, scheduler: DispatchQueue.main)
            .sink { [weak self] (query) in
                self?.cancelSeachShows =
                    TvMaze
                    .search(query: query)
                    .sink { (result) in
                        self?.searchShows = result
                    }
            }
    }
}

struct SearchShowsView: View {
    @ObservedObject var searchShows = ShowsSearch()
    
    var body: some View {
        NavigationView {
            search
            .navigationBarTitle("Show Search")
        }
    }
    
    var search: some View {
        VStack {
            HStack {
                TextField.init("Search", text: $searchShows.query)
                Button.init("Clear", action: {
                    self.searchShows.query = ""
                })
            }
            
            List.init(searchShows.searchShows, id: \.show.id, rowContent: show)
        }
    }
    
    func show(show: TvMaze.ShowSearchMatch) -> some View {
        NavigationLink(show.show.name, destination: SeasonsView(show: show.show))
    }
}

#if DEBUG
struct SearchShowsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchShowsView()
    }
}
#endif
