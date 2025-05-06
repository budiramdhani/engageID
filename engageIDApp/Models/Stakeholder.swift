import Foundation

struct Stakeholder: Identifiable {
    let id = UUID()
    var name: String
    var power: Int
    var interest: Int
    var status: StakeholderStatus
}

enum StakeholderStatus: String, CaseIterable {
    case supportive = "Supportive"
    case neutral = "Neutral"
    case resistant = "Resistant"
}
