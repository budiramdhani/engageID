// engageIDApp/Views/StakeholderMapView.swift

import SwiftUI

struct StakeholderMapView: View {
    // Dummy data untuk visualisasi
    let stakeholders: [Stakeholder] = [
        Stakeholder(name: "Budi", organization: "A", issue: "Lingkungan", power: 5, interest: 5, status: "Engaged"),
        Stakeholder(name: "Aminah", organization: "B", issue: "Edukasi", power: 4, interest: 2, status: "Pending"),
        Stakeholder(name: "Rudi", organization: "C", issue: "Kesehatan", power: 2, interest: 4, status: "Engaged"),
        Stakeholder(name: "Sari", organization: "D", issue: "Infrastruktur", power: 1, interest: 1, status: "Monitor")
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Matriks Stakeholder")
                .font(.title2)
                .bold()
            
            Text("Power vs Interest Matrix (AA1000SES 2011)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            GeometryReader { geometry in
                let width = geometry.size.width / 2
                let height = geometry.size.height / 2
                
                ZStack {
                    // Kuadran dengan label
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            quadrantView(label: "Keep Informed", color: .blue.opacity(0.1))
                                .frame(width: width, height: height)
                            quadrantView(label: "Manage Closely", color: .red.opacity(0.1))
                                .frame(width: width, height: height)
                        }
                        HStack(spacing: 0) {
                            quadrantView(label: "Monitor", color: .gray.opacity(0.1))
                                .frame(width: width, height: height)
                            quadrantView(label: "Keep Satisfied", color: .green.opacity(0.1))
                                .frame(width: width, height: height)
                        }
                    }

                    // Stakeholder Points
                    ForEach(stakeholders) { stakeholder in
                        let x = CGFloat(stakeholder.power - 1) / 4 * geometry.size.width
                        let y = geometry.size.height - (CGFloat(stakeholder.interest - 1) / 4 * geometry.size.height)
                        
                        Text("🔹")
                            .position(x: x, y: y)
                            .overlay(
                                Text(stakeholder.name)
                                    .font(.caption2)
                                    .foregroundColor(.black)
                                    .offset(y: -10)
                            )
                    }
                }
                .border(Color.black.opacity(0.3), width: 1)
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()
        }
        .padding()
    }
    
    func quadrantView(label: String, color: Color) -> some View {
        ZStack {
            color
            Text(label)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(4)
        }
        .border(Color.gray.opacity(0.4), width: 0.5)
    }
}

#Preview {
    StakeholderMapView()
}
