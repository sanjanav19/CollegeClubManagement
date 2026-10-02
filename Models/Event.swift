import Foundation

struct ClubEvent: Identifiable, Hashable {
    let id: UUID
    let title: String
    let clubName: String
    let date: Date
    let location: String
    let description: String
    let capacity: Int
    var registeredCount: Int

    init(
        id: UUID = UUID(),
        title: String,
        clubName: String,
        date: Date,
        location: String,
        description: String,
        capacity: Int,
        registeredCount: Int
    ) {
        self.id = id
        self.title = title
        self.clubName = clubName
        self.date = date
        self.location = location
        self.description = description
        self.capacity = capacity
        self.registeredCount = registeredCount
    }
}