import SwiftUI

struct ClubDetailView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    let club: Club

    var isMember: Bool {
        appViewModel.student.joinedClubIDs.contains(club.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image(systemName: club.icon)
                    .font(.system(size: 55))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 35)
                    .background(.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Text(club.name)
                    .font(.largeTitle.bold())

                Text(club.category)
                    .font(.headline)
                    .foregroundStyle(.blue)

                Text(club.description)
                    .foregroundStyle(.secondary)

                Divider()

                Label(
                    "\(club.memberCount) members",
                    systemImage: "person.3.fill"
                )

                Label(
                    "President: \(club.president)",
                    systemImage: "person.fill"
                )

                Button {
                    if isMember {
                        appViewModel.student.joinedClubIDs.remove(club.id)
                    } else {
                        appViewModel.student.joinedClubIDs.insert(club.id)
                    }
                } label: {
                    Text(isMember ? "Leave Club" : "Join Club")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isMember ? .red : .blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .navigationTitle("Club Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}