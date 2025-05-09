import SwiftUI

struct StakeholderAnalysisView: View {
    var organization: String = "Contoh Organisasi"
    var issue: String = "Contoh Isu"

    var body: some View {
        VStack {
            Text("Analisis untuk \(organization)")
                .font(.title)
                .padding()

            Text("Isu: \(issue)")
                .font(.subheadline)
        }
    }
}
