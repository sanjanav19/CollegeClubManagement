import SwiftUI

struct EventDetailView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    let event: ClubEvent

    var isRegistered: Bool {
        appViewModel.student.registeredEventIDs.contains(event.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image(systemName: "calendar.badge.clock")
                    .font(.system(size: 55))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 35)
                    .background(.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Text(event.title)
                    .font(.largeTitle.bold())

                Text(event.clubName)
                    .font(.headline)
                    .foregroundStyle(.blue)

                VStack(alignment: .leading, spacing: 12) {
                    Label(
                        event.date.formatted(
                            date: .abbreviated,
                            time: .shortened
                        ),
                        systemImage: "calendar"
                    )

                    Label(event.location, systemImage: "mappin.and.ellipse")

                    Label(
                        "\(event.registeredCount)/\(event.capacity) registered",
                        systemImage: "person.2.fill"
                    )
                }

                Divider()

                Text(event.description)
                    .foregroundStyle(.secondary)

                Button {
                    if isRegistered {
                        appViewModel.student.registeredEventIDs.remove(event.id)
                    } else if event.registeredCount < event.capacity {
                        appViewModel.student.registeredEventIDs.insert(event.id)
                    }
                } label: {
                    Text(
                        isRegistered
                        ? "Cancel Registration"
                        : "Register for Event"
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        isRegistered ? .red : .blue
                    )
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .navigationTitle("Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}