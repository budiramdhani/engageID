import SwiftUI

struct StakeholderDetailView: View {
    var stakeholder: Stakeholder

    var body: some View {
        VStack(spacing: 20) {
            Text(stakeholder.name)
                .font(.largeTitle)
                .bold()

            Text("Power: \(stakeholder.power)")
            Text("Interest: \(stakeholder.interest)")
            Text("Status: \(stakeholder.status.rawValue)")

            Spacer()
        }
        .padding()
        .navigationTitle("Detail")
    }
}
