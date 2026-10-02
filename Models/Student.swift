import Foundation

struct Student {
    let name: String
    let email: String
    let department: String
    let year: String
    var joinedClubIDs: Set<UUID>
    var registeredEventIDs: Set<UUID>
}