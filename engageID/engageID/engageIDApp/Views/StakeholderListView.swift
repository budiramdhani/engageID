// engageIDApp/Views/StakeholderListView.swift

import SwiftUI

struct StakeholderListView: View {
    let stakeholders: [Stakeholder] = [
        Stakeholder(name: "Budi Santoso", organization: "Lembaga A", issue: "Lingkungan", power: 4, interest: 5, status: "Engaged"),
        Stakeholder(name: "Siti Aminah", organization: "Komunitas B", issue: "Pendidikan", power: 3, interest: 3, status: "Pending"),
        Stakeholder(name: "Agus Wijaya", organization: "Pemda C", issue: "Infrastruktur", power: 5, interest: 2, status: "Engaged")
    ]
    
    var body: some View {
        NavigationView {
            List(stakeholders) { stakeholder in
                NavigationLink(destination: StakeholderDetailView(stakeholder: stakeholder)) {
                    VStack(alignment: .leading) {
                        Text(stakeholder.name)
                            .font(.headline)
                        Text("\(stakeholder.organization) • \(stakeholder.issue)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Status: \(stakeholder.status)")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Daftar Stakeholder")
        }
    }
}

#Preview {
    StakeholderListView()
}
