// engageIDApp/Views/EngagementLogView.swift

import SwiftUI

struct EngagementEntry: Identifiable {
    let id = UUID()
    var date: Date
    var note: String
    var followUpAction: String
}

struct EngagementLogView: View {
    let stakeholder: Stakeholder
    @State private var logEntries: [EngagementEntry] = []
    @State private var note = ""
    @State private var followUp = ""
    @State private var date = Date()

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Tambah Log Engagement")) {
                    DatePicker("Tanggal", selection: $date, displayedComponents: .date)
                    TextField("Catatan", text: $note)
                    TextField("Tindak Lanjut", text: $followUp)
                    Button("Simpan Log") {
                        let newEntry = EngagementEntry(date: date, note: note, followUpAction: followUp)
                        logEntries.append(newEntry)
                        note = ""
                        followUp = ""
                    }
                }

                Section(header: Text("Riwayat Engagement")) {
                    if logEntries.isEmpty {
                        Text("Belum ada catatan.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(logEntries) { entry in
                            VStack(alignment: .leading) {
                                Text(entry.date, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(entry.note)
                                    .fontWeight(.semibold)
                                Text("Tindak Lanjut: \(entry.followUpAction)")
                                    .font(.subheadline)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
        }
        .navigationTitle("Engagement \(stakeholder.name)")
    }
}
