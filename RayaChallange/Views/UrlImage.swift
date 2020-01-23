import SwiftUI
import Combine

class UrlImageSource: ObservableObject {
    @Published var uiImage: UIImage?
    private var stream: AnyCancellable?
    
    init(url: String) {
        stream = URLSession.shared
            .dataTaskPublisher(for: URL(string: url)!)
            .sink(receiveCompletion: { _ in }) { [weak self] (arg: URLSession.DataTaskPublisher.Output) in
                // TODO: weak caputure? is it needed if cancelable will be called when object dealocated
                let (data, _) = arg
                DispatchQueue.main.async {
                    self?.uiImage = UIImage.init(data: data)!
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
