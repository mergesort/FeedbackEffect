import UIKit

/// An enum describing the different kinds of haptic feedback the taptic engine is capable of producing.
/// For use in `FeedbackEffect`, to give the user feedback when it's desired.
///
/// - impact: Used for calling `UIImpactFeedbackGenerator().impactOccurred()`.
/// - selection: Used for calling `UISelectionFeedbackGenerator().selectionChanged()`.
/// - notification: Used for calling `UINotificationFeedbackGenerator().notificationOccurred(notificationType)`.
public enum HapticFeedback: HapticEmitting {
    
    fileprivate static let impactGenerator = UIImpactFeedbackGenerator()
    fileprivate static let selectionGenerator = UISelectionFeedbackGenerator()
    fileprivate static let notificationGenerator = UINotificationFeedbackGenerator()
    
    case impact
    case selection
    case notification(UINotificationFeedbackType)
}

extension HapticFeedback {
    
    public func prepare() {
        switch self {
            
        case .impact:
            HapticFeedback.impactGenerator.prepare()
            
        case .selection:
            HapticFeedback.selectionGenerator.prepare()
            
        case .notification:
            HapticFeedback.notificationGenerator.prepare()
        }
    }
    
    public func generateFeedback() {
        switch self {
            
        case .impact:
            HapticFeedback.impactGenerator.impactOccurred()
            
        case .selection:
            HapticFeedback.selectionGenerator.selectionChanged()
            
        case .notification(let notificationType):
            HapticFeedback.notificationGenerator.notificationOccurred(notificationType)
        }
    }
}

