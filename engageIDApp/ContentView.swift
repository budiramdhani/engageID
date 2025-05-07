import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            StakeholderMap()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            StakeholderAnalysisView()
                .tabItem {
                    Label("Analisa", systemImage: "chart.pie")
                }

            EngagementLogView()
                .tabItem {
                    Label("Log", systemImage: "note.text")
                }

            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar")
                }
        }
    }
}
