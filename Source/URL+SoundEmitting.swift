import AVFoundation
import Foundation

extension URL: SoundEmitting {
    
    public func makeSound() {
        FeedbackEffect.player.removeAllItems()
        let item = AVPlayerItem(url: self)
        FeedbackEffect.player.insert(item, after: nil)
        FeedbackEffect.player.play()
    }
}
