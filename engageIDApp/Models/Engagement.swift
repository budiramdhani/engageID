import Foundation

struct Engagement: Identifiable, Codable {
    let id: UUID
    var stakeholderID: UUID
    var date: Date
    var type: String
    var notes: String

    init(id: UUID = UUID(), stakeholderID: UUID, date: Date = Date(), type: String, notes: String) {
        self.id = id
        self.stakeholderID = stakeholderID
        self.date = date
        self.type = type
        self.notes = notes
    }
}
