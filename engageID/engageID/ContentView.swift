import SwiftUI

struct ContentView: View {
    init() {
        // Background tab bar yang clean
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }

            StakeholderAnalysisView()
                .tabItem {
                    VStack {
                        Image(systemName: "bolt.circle.fill")
                        Text("Analisa")
                    }
                }

            DashboardView()
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg")
                        Text("Dashboard")
                    }
                }
        }
        .accentColor(.purple) // Warna aksen seperti TikTok (bisa ganti ke .blue, .teal, atau .pink)
        .background(Color(.systemGroupedBackground))
    }
}
