import SwiftUI

struct EngagementLogView: View {
    @State private var engagements: [Engagement] = []
    @State private var newType: String = ""
    @State private var newNotes: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Tambah Engagement")) {
                        TextField("Jenis Interaksi", text: $newType)
                        TextField("Catatan", text: $newNotes)
                        Button("Tambah") {
                            let newEngagement = Engagement(
                                stakeholderID: UUID(), // Nanti bisa diganti stakeholder sebenarnya
                                type: newType,
                                notes: newNotes
                            )
                            engagements.append(newEngagement)
                            newType = ""
                            newNotes = ""
                        }
                    }
                }

                List(engagements) { item in
                    VStack(alignment: .leading) {
                        Text(item.type).bold()
                        Text(item.notes)
                        Text(item.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Log Engagement")
        }
    }
}
