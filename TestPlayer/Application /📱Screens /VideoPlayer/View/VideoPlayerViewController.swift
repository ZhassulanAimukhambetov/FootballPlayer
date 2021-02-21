import UIKit
import AVKit

class VideoPlayerViewController: AVPlayerViewController {
    var presenter: VideoPlayerPresenterOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.play()
    }
}

extension VideoPlayerViewController: VideoPlayerPresenterInput {
    func configure(with url: URL) {
        let player = AVPlayer(url: url)
        self.player = player
        player.play()
    }
    
    func showError(with message: String) {
        showAlert(with: message)
    }
}
