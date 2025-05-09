import SwiftUI

struct StakeholderDetailView: View {
    let stakeholder: Stakeholder

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(stakeholder.name)
                .font(.largeTitle)
                .bold()

            Text("Organisasi: \(stakeholder.organization)")
            Text("Isu: \(stakeholder.issue)")
            Text("Status: \(stakeholder.status)")

            HStack {
                Text("Power: \(stakeholder.power)")
                Spacer()
                Text("Interest: \(stakeholder.interest)")
            }

            Divider()

            NavigationLink(destination: EngagementLogView(stakeholder: stakeholder)) {
                Text("📋 Lihat Riwayat Engagement")
                    .fontWeight(.medium)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Detail")
    }
}

#Preview {
    StakeholderDetailView(stakeholder: Stakeholder(
        name: "Budi Santoso",
        organization: "Lembaga A",
        issue: "Lingkungan",
        power: 4,
        interest: 5,
        status: "Engaged"
    ))
}
