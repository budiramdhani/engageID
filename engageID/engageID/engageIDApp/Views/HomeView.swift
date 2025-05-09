import SwiftUI

let sampleStakeholder = Stakeholder(
    name: "Dummy Stakeholder",
    organization: "Contoh Org",
    issue: "Isu Umum",
    power: 3,
    interest: 4,
    status: "Engaged"
)

let sampleStakeholders: [Stakeholder] = [
    Stakeholder(name: "A", organization: "Org 1", issue: "Isu 1", power: 4, interest: 2, status: "Engaged"), // Keep Satisfied
    Stakeholder(name: "B", organization: "Org 2", issue: "Isu 2", power: 5, interest: 4, status: "Engaged"), // Manage Closely
    Stakeholder(name: "C", organization: "Org 3", issue: "Isu 3", power: 1, interest: 1, status: "Passive"), // Monitor
    Stakeholder(name: "D", organization: "Org 4", issue: "Isu 4", power: 2, interest: 5, status: "Informed") // Keep Informed
]

struct HomeView: View {
    var totalStakeholders: Int = 12
    var totalEngagements: Int = 27

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 16) {

                    // 👋 Greeting (10%)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("👋 Selamat datang kembali, Budi")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Siap pantau engagement hari ini?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .frame(height: geometry.size.height * 0.1)

                    // 📊 Statistik (15%)
                    HStack(spacing: 16) {
                        StatCard(title: "Stakeholder", value: "\(totalStakeholders)", color: .blue, icon: "person.3.fill")
                        StatCard(title: "Engagement", value: "\(totalEngagements)", color: .green, icon: "bubble.left.and.bubble.right.fill")
                    }
                    .padding(.horizontal)
                    .frame(height: geometry.size.height * 0.15)

                    // 🚀 Akses Cepat (18%)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Akses Cepat")
                            .font(.headline)
                        HStack(spacing: 20) {
                            NavigationLink(destination: StakeholderListView()) {
                                ShortcutItem(icon: "list.bullet", title: "List")
                            }
                            NavigationLink(destination: StakeholderMapView()) {
                                ShortcutItem(icon: "map.fill", title: "Map")
                            }
                            NavigationLink(destination: EngagementLogView(stakeholder: sampleStakeholder)) {
                                ShortcutItem(icon: "square.and.pencil", title: "Log")
                            }
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: geometry.size.height * 0.18)

                    // 🔍 Matriks (42%)
                    StakeholderMatrixView(stakeholders: sampleStakeholders)
                        .padding(.horizontal)
                        .frame(height: geometry.size.height * 0.42)

                    Spacer(minLength: 0)
                }
                .padding(.top)
            }
            .navigationTitle("Home")
        }
    }
}


struct StatCard: View {
    var title: String
    var value: String
    var color: Color
    var icon: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding(12)
                .background(color)
                .clipShape(Circle())

            Text(value)
                .font(.title)
                .fontWeight(.bold)

            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 4)
    }
}

struct ShortcutItem: View {
    var icon: String
    var title: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .padding()
                .background(Color.purple)
                .clipShape(Circle())

            Text(title)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct StakeholderMatrixView: View {
    var stakeholders: [Stakeholder]

    var body: some View {
        let keepSatisfied = stakeholders.filter { $0.power >= 3 && $0.interest <= 2 }.count
        let manageClosely = stakeholders.filter { $0.power >= 3 && $0.interest >= 3 }.count
        let monitor = stakeholders.filter { $0.power <= 2 && $0.interest <= 2 }.count
        let keepInformed = stakeholders.filter { $0.power <= 2 && $0.interest >= 3 }.count

        VStack(alignment: .leading) {
            Text("🔍 Matriks Stakeholder")
                .font(.headline)
                .padding(.bottom, 4)

            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    MatrixBox(title: "Keep Satisfied", count: keepSatisfied, color: .blue, emoji: "😊")
                    MatrixBox(title: "Manage Closely", count: manageClosely, color: .red, emoji: "🔥")
                }
                HStack(spacing: 12) {
                    MatrixBox(title: "Monitor", count: monitor, color: .gray, emoji: "👀")
                    MatrixBox(title: "Keep Informed", count: keepInformed, color: .green, emoji: "📢")
                }
            }
            .frame(height: 220)
        }
    }
}
struct MatrixBox: View {
    var title: String
    var count: Int
    var color: Color
    var emoji: String

    var body: some View {
        VStack(spacing: 8) {
            Text(emoji)
                .font(.system(size: 32))

            Text("\(count)")
                .font(.title2)
                .fontWeight(.bold)

            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color.opacity(0.15))
        .cornerRadius(20)
    }
}
