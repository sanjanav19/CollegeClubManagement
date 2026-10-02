import SwiftUI

struct DashboardView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Welcome section
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Welcome back 👋")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        Text(appViewModel.student.name)
                            .font(.largeTitle.bold())

                        Text("Manage your clubs and activities")
                            .foregroundStyle(.secondary)
                    }

                    // Statistics
                    HStack(spacing: 12) {

                        StatCard(
                            title: "My Clubs",
                            value: "\(appViewModel.student.joinedClubIDs.count)",
                            icon: "person.3.fill"
                        )

                        StatCard(
                            title: "My Events",
                            value: "\(appViewModel.student.registeredEventIDs.count)",
                            icon: "calendar"
                        )
                    }

                    // Quick actions
                    Text("Quick Actions")
                        .font(.title2.bold())

                    HStack(spacing: 12) {

                        NavigationLink {
                            ClubsView()
                        } label: {
                            QuickActionCard(
                                title: "Explore Clubs",
                                icon: "person.3.fill"
                            )
                        }

                        NavigationLink {
                            EventsView()
                        } label: {
                            QuickActionCard(
                                title: "View Events",
                                icon: "calendar"
                            )
                        }
                    }

                    // Upcoming events
                    Text("Upcoming Events")
                        .font(.title2.bold())

                    ForEach(SampleData.events.prefix(3)) { event in

                        NavigationLink {
                            EventDetailView(event: event)
                        } label: {
                            EventRow(event: event)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}
struct QuickActionCard: View {

    let title: String
    let icon: String

    var body: some View {
        VStack(spacing: 10) {

            Image(systemName: icon)
                .font(.title2)

            Text(title)
                .font(.subheadline.bold())
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}