import SwiftUI

@main
struct CollegeClubManagementApp: App {

    @StateObject private var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            if appViewModel.isLoggedIn {
                if appViewModel.isAdmin {
                    AdminDashboardView()
                        .environmentObject(appViewModel)
                } else {
                    StudentTabView()
                        .environmentObject(appViewModel)
                }
            } else {
                LoginView()
                    .environmentObject(appViewModel)
            }
        }
    }
}