import SwiftUI

struct EngagementLogView: View {
    let stakeholder: Stakeholder

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Engagement untuk \(stakeholder.name)")
                .font(.title)
                .padding()

            Text("Belum ada log engagement ditampilkan.") // Placeholder
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    EngagementLogView(stakeholder: Stakeholder(
        name: "Budi Santoso",
        organization: "Lembaga A",
        issue: "Lingkungan",
        power: 4,
        interest: 5,
        status: "Engaged"
    ))
}
