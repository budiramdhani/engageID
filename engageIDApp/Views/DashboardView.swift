// engageIDApp/Views/DashboardView.swift

import SwiftUI

struct DashboardView: View {
    // Dummy data
    let stakeholders: [Stakeholder] = [
        Stakeholder(name: "Budi", organization: "A", issue: "Lingkungan", power: 5, interest: 5, status: "Engaged"),
        Stakeholder(name: "Aminah", organization: "B", issue: "Edukasi", power: 4, interest: 2, status: "Pending"),
        Stakeholder(name: "Rudi", organization: "C", issue: "Kesehatan", power: 2, interest: 4, status: "Engaged"),
        Stakeholder(name: "Sari", organization: "D", issue: "Infrastruktur", power: 1, interest: 1, status: "Monitor")
    ]

    let engagementCount = 12

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("📊 Dashboard")
                        .font(.title)
                        .bold()
                        .padding(.top)

                    summaryCard(title: "Total Stakeholder", value: "\(stakeholders.count)", color: .blue)
                    summaryCard(title: "Jumlah Engagement", value: "\(engagementCount)", color: .green)
                    summaryCard(title: "Isu Populer", value: mostCommonIssue(), color: .orange)
                    summaryCard(title: "Kuadran Dominan", value: dominantQuadrant(), color: .purple)
                }
                .padding()
            }
        }
    }

    func summaryCard(title: String, value: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.title2)
                .bold()
                .foregroundColor(color)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }

    func mostCommonIssue() -> String {
        let grouped = Dictionary(grouping: stakeholders, by: { $0.issue })
        let sorted = grouped.sorted { $0.value.count > $1.value.count }
        return sorted.first?.key ?? "-"
    }

    func dominantQuadrant() -> String {
        let mapped = stakeholders.map { stakeholder in
            quadrant(for: stakeholder.power, interest: stakeholder.interest)
        }

        let freq = Dictionary(grouping: mapped, by: { $0 })
        let sorted = freq.sorted { $0.value.count > $1.value.count }
        return sorted.first?.key ?? "-"
    }

    func quadrant(for power: Int, interest: Int) -> String {
        switch (power >= 3, interest >= 3) {
        case (true, true): return "Manage Closely"
        case (true, false): return "Keep Satisfied"
        case (false, true): return "Keep Informed"
        case (false, false): return "Monitor"
        }
    }
}

#Preview {
    DashboardView()
}
