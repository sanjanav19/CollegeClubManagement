import SwiftUI

struct HomeView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Welcome back,")
                            .foregroundStyle(.secondary)

                        Text(appViewModel.student.name)
                            .font(.largeTitle.bold())
                    }

                    HStack(spacing: 12) {
                        StatCard(
                            title: "Clubs",
                            value: "\(appViewModel.student.joinedClubIDs.count)",
                            icon: "person.3.fill"
                        )

                        StatCard(
                            title: "Events",
                            value: "\(appViewModel.student.registeredEventIDs.count)",
                            icon: "calendar"
                        )
                    }

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
            .navigationTitle("CampusConnect")
        }
    }
}

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
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct EventRow: View {

    let event: ClubEvent

    var body: some View {
        HStack(spacing: 16) {

            Image(systemName: "calendar")
                .font(.title2)
                .frame(width: 45, height: 45)
                .background(.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.headline)

                Text(event.clubName)
                    .foregroundStyle(.secondary)

                Text(event.location)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(radius: 2)
    }
}