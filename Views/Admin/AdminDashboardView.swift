import SwiftUI

struct AdminDashboardView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            List {

                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Admin Dashboard")
                            .font(.largeTitle.bold())

                        Text("Manage your college club ecosystem")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical)
                }

                Section("Overview") {

                    LabeledContent(
                        "Total Clubs",
                        value: "\(SampleData.clubs.count)"
                    )

                    LabeledContent(
                        "Upcoming Events",
                        value: "\(SampleData.events.count)"
                    )

                    LabeledContent(
                        "Total Members",
                        value: "\(SampleData.clubs.reduce(0) { $0 + $1.memberCount })"
                    )
                }

                Section("Management") {

                    Label(
                        "Manage Clubs",
                        systemImage: "person.3.fill"
                    )

                    Label(
                        "Manage Events",
                        systemImage: "calendar.badge.plus"
                    )

                    Label(
                        "View Members",
                        systemImage: "person.2.fill"
                    )
                }

                Section {
                    Button("Logout", role: .destructive) {
                        appViewModel.logout()
                    }
                }
            }
            .navigationTitle("Admin")
        }
    }
}