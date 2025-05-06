import SwiftUI

struct StakeholderAnalysisView: View {
    let stakeholders: [Stakeholder] = [
        Stakeholder(name: "John Doe", power: 2, interest: 3, status: .supportive),
        Stakeholder(name: "Jane Smith", power: 4, interest: 4, status: .neutral),
        Stakeholder(name: "Bob Lee", power: 1, interest: 2, status: .resistant)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Stakeholder Analysis")
                .font(.title)
                .bold()

            ForEach(StakeholderStatus.allCases, id: \.self) { status in
                let filtered = stakeholders.filter { $0.status == status }
                Text("\(status.rawValue): \(filtered.count)")
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Analysis")
    }
}
