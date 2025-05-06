import SwiftUI

struct StakeholderMapView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Stakeholder Mapping")
                .font(.title2)
                .bold()

            Text("Matrix: Power vs Interest")
                .foregroundColor(.gray)

            Spacer()

            VStack(spacing: 40) {
                HStack(spacing: 40) {
                    quadrantBox(title: "Keep Satisfied", color: .yellow)
                    quadrantBox(title: "Manage Closely", color: .red)
                }
                HStack(spacing: 40) {
                    quadrantBox(title: "Monitor", color: .gray)
                    quadrantBox(title: "Keep Informed", color: .blue)
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Stakeholder Map")
    }

    func quadrantBox(title: String, color: Color) -> some View {
        VStack {
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 120, height: 80)
                .background(color.opacity(0.2))
                .cornerRadius(10)
        }
    }
}
