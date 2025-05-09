import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("📊 Ringkasan Dashboard")
                    .font(.title)
                    .bold()

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Total Stakeholder")
                        Spacer()
                        Text("12") // dummy data
                    }
                    HStack {
                        Text("Jumlah Engagement")
                        Spacer()
                        Text("34") // dummy data
                    }
                    HStack {
                        Text("Top Isu")
                        Spacer()
                        Text("Konsesi Lahan") // dummy data
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

                Spacer()
            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
}
