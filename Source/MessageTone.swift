import AudioToolbox

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

