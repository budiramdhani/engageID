import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to engageID")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                NavigationLink(destination: StakeholderListView()) {
                    HomeButton(title: "Stakeholder List")
                }

                NavigationLink(destination: StakeholderMapView()) {
                    HomeButton(title: "Stakeholder Mapping")
                }

                NavigationLink(destination: StakeholderAnalysisView()) {
                    HomeButton(title: "Stakeholder Analysis")
                }

                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeButton: View {
    let title: String

    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}
