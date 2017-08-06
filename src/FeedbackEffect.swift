import AudioToolbox
import AVFoundation
import UIKit

public enum HapticFeedback {

    case impact
    case selection
    case notification(UINotificationFeedbackType)
}

private extension HapticFeedback {

    func generateFeedback() {
        switch self {

        case .impact:
            UIImpactFeedbackGenerator().impactOccurred()

        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()

        case .notification(let notificationType):
            UINotificationFeedbackGenerator().notificationOccurred(notificationType)
        }
    }
}

public protocol SoundEmitting {

    func makeSound()
}

public enum TextTone: Int {

    case note = 1375
    case aurora = 1366
    case bamboo = 1361
    case chord = 1312
    case circles = 1368
    case complete = 1362
    case hello = 1363
    case input = 1369
    case keys = 1367
    case popcorn = 1364
    case pulse = 1120
    case synth = 1365
    case alert = 1005
    case anticipate = 1020
    case bell = 1013
    case bloom = 1021
    case calypso = 1022
    case chime = 1008
    case choochoo = 1023
    case descent = 1024
    case ding = 1000
    case electronic = 1014
    case fanfare = 1025
    case glass = 1009
    case horn = 1010
    case ladder = 1026
    case minuet = 1027
    case newsflash = 1028
    case noir = 1029
    case sherwoodforest = 1030
    case spell = 1031
    case suspence = 1032
    case swish = 1018
    case swoosh = 1001
    case telegraph = 1033
    case tiptoes = 1034
    case tritone = 1002
    case tweet = 1016
    case typewriters = 1035
    case update = 1036
}

extension TextTone: SoundEmitting {

    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

public enum SoundEffect: Int {

    case tap = 1104
}

extension SoundEffect: SoundEmitting {

    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

public enum VibrationEffect: Int {

    case selectionVibration = 1519
    case impactVibration = 1520
    case notificationVibration = 1521
}

extension VibrationEffect: SoundEmitting {

    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

extension URL: SoundEmitting {

    public func makeSound() {
        FeedbackEffect.player.removeAllItems()
        let item = AVPlayerItem(url: self)
        FeedbackEffect.player.insert(item, after: nil)
        FeedbackEffect.player.play()
    }
}

public struct FeedbackEffect {

    static let player = AVQueuePlayer()

    public static func play(sound: SoundEmitting?, feedback: HapticFeedback? = nil) {
        if let sound = sound {
            do {
                let currentCategory = AVAudioSession.sharedInstance().category
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient, with: .mixWithOthers)

                sound.makeSound()

                try AVAudioSession.sharedInstance().setCategory(currentCategory)
            } catch {
                print("Couldn't play a sound")
            }
        }

        if let feedback = feedback {
            feedback.generateFeedback()
        }
    }
}
