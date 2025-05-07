import Foundation

struct Reminder: Identifiable, Codable {
    let id: UUID
    var stakeholderName: String
    var engagementNote: String
    var reminderDate: Date
}
