import SwiftUI

struct StakeholderListView: View {
    @State private var stakeholders: [Stakeholder] = [
        Stakeholder(name: "John Doe", power: 2, interest: 3, status: .supportive),
        Stakeholder(name: "Jane Smith", power: 4, interest: 4, status: .neutral)
    ]

    var body: some View {
        List(stakeholders) { stakeholder in
            NavigationLink(destination: StakeholderDetailView(stakeholder: stakeholder)) {
                VStack(alignment: .leading) {
                    Text(stakeholder.name).bold()
                    Text("Status: \(stakeholder.status.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Stakeholders")
    }
}
