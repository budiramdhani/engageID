import SwiftUI
import UserNotifications

@main
struct engageIDApp: App {
    
    // Tambahkan init untuk minta izin notifikasi
    init() {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge]
        ) { success, error in
            if success {
                print("✅ Notifikasi diizinkan")
            } else if let error = error {
                print("⚠️ Gagal meminta izin notifikasi: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
