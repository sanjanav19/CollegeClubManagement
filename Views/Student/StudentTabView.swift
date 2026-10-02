import SwiftUI

struct StudentTabView: View {

    var body: some View {
        TabView {

            DashboardView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            ClubsView()
                .tabItem {
                    Label("Clubs", systemImage: "person.3.fill")
                }

            EventsView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}