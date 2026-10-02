import Foundation

@MainActor
final class EventViewModel: ObservableObject {

    @Published var events = SampleData.events

    func isRegistered(
        _ event: ClubEvent,
        student: Student
    ) -> Bool {
        student.registeredEventIDs.contains(event.id)
    }

    func register(
        _ event: ClubEvent,
        student: inout Student
    ) {
        guard event.registeredCount < event.capacity else {
            return
        }

        if !student.registeredEventIDs.contains(event.id) {
            student.registeredEventIDs.insert(event.id)

            if let index = events.firstIndex(where: { $0.id == event.id }) {
                events[index].registeredCount += 1
            }
        }
    }
}