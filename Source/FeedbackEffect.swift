import AudioToolbox
import AVFoundation
import UIKit

/// A protocol for encapsulating the different ways that sound can be created, for use in `FeedbackEffect`.
public protocol SoundEmitting {
    
    func makeSound()
}

/// A protocol for encapsulating the different ways that haptic feedback can be created, for use in `FeedbackEffect`.
public protocol HapticEmitting {
    
    func generateFeedback()
}

/// An enum describing the different kinds of haptic feedback the taptic engine is capable of producing.
/// For use in `FeedbackEffect`, to give the user feedback when it's desired.
///
/// - impact: Used for calling `UIImpactFeedbackGenerator().impactOccurred()`.
/// - selection: Used for calling `UISelectionFeedbackGenerator().selectionChanged()`.
/// - notification: Used for calling `UINotificationFeedbackGenerator().notificationOccurred(notificationType)`.
public enum HapticFeedback: HapticEmitting {

    case impact(UIImpactFeedbackStyle)
    case selection
    case notification(UINotificationFeedbackType)
}

extension HapticFeedback {

    public func generateFeedback() {
        switch self {

        case .impact(let impactStyle):
            let impactGenerator = UIImpactFeedbackGenerator(style: impactStyle)
            impactGenerator.impactOccurred()

        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()

        case .notification(let notificationType):
            UINotificationFeedbackGenerator().notificationOccurred(notificationType)
        }
    }
}

/// A set of text message sound effects that iOS provides through the `AudioServicesPlaySystemSound` subsystem.
public enum MessageTone: Int {

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

extension MessageTone: SoundEmitting {

    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

/// A set of sound effects that iOS provides through the `AudioServicesPlaySystemSound` subsystem.
public enum SoundEffect: Int {

    case tap = 1104
}

extension SoundEffect: SoundEmitting {

    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

/// A set of vibration patterns that iOS uses through the `AudioServicesPlaySystemSound` subsystem
/// to generate vibrations on devices that do not have a taptic engine.
public enum VibrationFeedback {

    case selection
    case impact
    case notification

}

private extension VibrationFeedback {

    var audioServicesCode: UInt32 {
        switch self {
            
        case .selection:
            return 1519
            
        case .impact:
            return 1520
            
        case .notification:
            return 1521
            
        }
    }

}

extension VibrationFeedback: HapticEmitting {

    public func generateFeedback() {
        AudioServicesPlaySystemSound(self.audioServicesCode)
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

/// A type which encapsulates sound and haptic feedback. This is useful for providing feedback on user
/// interaction, or when an app would like to signal a noteworthy event.
public struct FeedbackEffect {

    // The player needs to be retained, so we make it a property.
    static let player = AVQueuePlayer()

    /// A function that allows a user to provide feedback to a user.
    ///
    /// - Parameters:
    ///   - sound: A `SoundEmitting` type to play when feedback occurs.
    ///   - feedback: A `HapticEmitting` type to play when feedback occurs.
    public static func play(sound: SoundEmitting?, feedback: HapticEmitting? = nil) {
        if let sound = sound {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient, with: .mixWithOthers)
                sound.makeSound()
            } catch {
                print("Couldn't play a sound")
            }
        }

        if let feedback = feedback {
            feedback.generateFeedback()
        }
    }
}
