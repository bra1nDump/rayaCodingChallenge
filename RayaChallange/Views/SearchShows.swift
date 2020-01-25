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
            searchBar
            List.init(searchShows.searchShows, id: \.show.id, rowContent: show)
        }
    }
    
    var searchBar: some View {
        HStack {
            Image("Search")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(10)
            
            TextField("Search", text: $searchShows.query)
                .accessibility(identifier: "Search")
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(5)
            
            if searchShows.query != "" {
                Button.init("Clear") {
                    self.searchShows.query = ""
                }
                .padding(10)
            }
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
