import SwiftUI

struct HomeView: View {
    var totalStakeholders: Int = 12
    var totalEngagements: Int = 27

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // 👋 Greeting
                    VStack(alignment: .leading, spacing: 4) {
                        Text("👋 Selamat datang kembali, Budi")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Siap pantau engagement hari ini?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    // 📊 Ringkasan Statistik
                    HStack(spacing: 16) {
                        StatCard(title: "Stakeholder", value: totalStakeholders, icon: "person.3.fill", color: .blue)
                        StatCard(title: "Engagement", value: totalEngagements, icon: "hand.raised.fill", color: .green)
                    }

                    // 🔥 Fitur Unggulan
                    VStack(alignment: .leading, spacing: 12) {
                        Text("🔥 Andalahn Kamu")
                            .font(.headline)

                        FeatureHighlightView(
                            title: "Stakeholder Mapping",
                            description: "Visualisasi Power vs Interest Matrix",
                            icon: "map.fill",
                            color: .purple
                        )

                        FeatureHighlightView(
                            title: "Engagement Log",
                            description: "Catat dan pantau riwayat interaksi",
                            icon: "doc.text.fill",
                            color: .orange
                        )

                        FeatureHighlightView(
                            title: "Dashboard Analitik",
                            description: "Lihat tren & status engagement",
                            icon: "chart.bar.fill",
                            color: .pink
                        )
                    }

                    // 🚀 Akses Cepat
                    VStack(alignment: .leading, spacing: 8) {
                        Text("🚀 Akses Cepat")
                            .font(.headline)

                        HStack {
                            QuickActionButton(title: "Mapping", icon: "squares.below.rectangle", color: .purple)
                            QuickActionButton(title: "Analisa", icon: "eye.fill", color: .indigo)
                            QuickActionButton(title: "Log", icon: "pencil.and.outline", color: .green)
                            QuickActionButton(title: "Dashboard", icon: "chart.pie.fill", color: .orange)
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Beranda")
        }
    }
}

struct StatCard: View {
    var title: String
    var value: Int
    var icon: String
    var color: Color

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(color)
                    .clipShape(Circle())
                Spacer()
                Text("\(value)")
                    .font(.title)
                    .bold()
            }
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct FeatureHighlightView: View {
    let title: String
    let description: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct QuickActionButton: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
            Text(title)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity)
    }
}
