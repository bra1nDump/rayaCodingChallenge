// copied from https://stackoverflow.com/a/58673530

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .map { $0 as? UIWindowScene }
        .compactMap { $0 }
        .first?.windows
        .filter { $0.isKeyWindow }.first?
        .rootViewController
    }
}
