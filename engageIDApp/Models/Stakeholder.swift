// engageIDApp/Stakeholder.swift

import Foundation

struct Stakeholder: Identifiable {
    let id: UUID
    var name: String
    var organization: String
    var issue: String
    var power: Int      // Range: 1–5
    var interest: Int   // Range: 1–5
    var status: String  // Example: "Engaged", "Pending", "Inactive"
    
    init(id: UUID = UUID(), name: String, organization: String, issue: String, power: Int, interest: Int, status: String) {
        self.id = id
        self.name = name
        self.organization = organization
        self.issue = issue
        self.power = power
        self.interest = interest
        self.status = status
    }
}
