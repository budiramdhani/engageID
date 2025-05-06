import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            StakeholderMapView()
                .tabItem {
                    Label("Mapping", systemImage: "map")
                }
            StakeholderAnalysisView()
                .tabItem {
                    Label("Analysis", systemImage: "chart.pie")
                }
        }
    }
}
