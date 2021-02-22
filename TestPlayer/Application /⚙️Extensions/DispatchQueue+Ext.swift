import Foundation

extension DispatchQueue {
    static func onMain(ext: @escaping () -> Void) {
        DispatchQueue.main.async {
            ext()
        }
    }
}
