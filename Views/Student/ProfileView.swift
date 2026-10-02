import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            List {

                Section {
                    VStack(spacing: 12) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.blue)

                        Text(appViewModel.student.name)
                            .font(.title2.bold())

                        Text(appViewModel.student.email)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                }

                Section("Academic Information") {
                    LabeledContent(
                        "Department",
                        value: appViewModel.student.department
                    )

                    LabeledContent(
                        "Year",
                        value: appViewModel.student.year
                    )
                }

                Section("Activity") {
                    LabeledContent(
                        "Joined Clubs",
                        value: "\(appViewModel.student.joinedClubIDs.count)"
                    )

                    LabeledContent(
                        "Registered Events",
                        value: "\(appViewModel.student.registeredEventIDs.count)"
                    )
                }

                Section {
                    Button("Logout", role: .destructive) {
                        appViewModel.logout()
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}