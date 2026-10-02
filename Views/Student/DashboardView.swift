import SwiftUI

struct DashboardView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Welcome
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

                    // Quick Actions
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

                    // Upcoming Events
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


// MARK: - Statistics Card

struct StatCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Image(systemName: icon)
                .font(.title2)

            Text(value)
                .font(.title.bold())

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


// MARK: - Quick Action Card

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


// MARK: - Event Row

struct EventRow: View {

    let event: ClubEvent

    var body: some View {
        HStack(spacing: 14) {

            Image(systemName: "calendar.badge.clock")
                .font(.title2)
                .foregroundStyle(.blue)
                .frame(width: 45, height: 45)
                .background(.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 5) {

                Text(event.title)
                    .font(.headline)

                Text(event.clubName)
                    .font(.subheadline)
                    .foregroundStyle(.blue)

                Text(
                    event.date.formatted(
                        date: .abbreviated,
                        time: .shortened
                    )
                )
                .font(.caption)
                .foregroundStyle(.secondary)

                Text(event.location)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}