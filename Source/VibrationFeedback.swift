import AudioToolbox

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

