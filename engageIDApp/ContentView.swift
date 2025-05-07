// engageIDApp/ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            StakeholderListView()
                .tabItem {
                    Label("Stakeholder", systemImage: "person.3")
                }

            StakeholderMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    ContentView()
}
