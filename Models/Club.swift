import Foundation

struct Club: Identifiable, Hashable {
    let id: UUID
    let name: String
    let category: String
    let description: String
    let president: String
    let memberCount: Int
    let icon: String

    init(
        id: UUID = UUID(),
        name: String,
        category: String,
        description: String,
        president: String,
        memberCount: Int,
        icon: String
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.description = description
        self.president = president
        self.memberCount = memberCount
        self.icon = icon
    }
}