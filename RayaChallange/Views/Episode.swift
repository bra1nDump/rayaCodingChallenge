import SwiftUI
import Combine

struct EpisodeView: View {
    let episode: TvMaze.Episode

    var body: some View {
        VStack(spacing: 10) {
            Button("Close") {
                UIApplication.shared.rootViewController?.dismiss(animated: true, completion: nil)
            }
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

#if DEBUG
struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episode: TvMazeSamples.episodes.first!)
    }
}
#endif
