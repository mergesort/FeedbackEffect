import AudioToolbox

/// A set of sound effects that iOS provides through the `AudioServicesPlaySystemSound` subsystem.
public enum SoundEffect: Int {
    
    case tap = 1104
}

extension SoundEffect: SoundEmitting {
    
    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

