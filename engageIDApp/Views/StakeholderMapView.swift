import SwiftUI

struct StakeholderMapView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Stakeholder Mapping")
                .font(.title2)
                .bold()

            Text("Matriks Power vs Interest")
                .foregroundColor(.gray)

            Spacer()

            VStack(spacing: 40) {
                HStack(spacing: 40) {
                    VStack {
                        Text("😐")
                        Text("Low Power\nLow Interest")
                            .multilineTextAlignment(.center)
                    }
                    VStack {
                        Text("🙂")
                        Text("High Power\nLow Interest")
                            .multilineTextAlignment(.center)
                    }
                }
                HStack(spacing: 40) {
                    VStack {
                        Text("🤝")
                        Text("Low Power\nHigh Interest")
                            .multilineTextAlignment(.center)
                    }
                    VStack {
                        Text("💼")
                        Text("High Power\nHigh Interest")
                            .multilineTextAlignment(.center)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Map")
    }
}
