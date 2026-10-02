import Foundation

@MainActor
final class ClubViewModel: ObservableObject {

    @Published var clubs = SampleData.clubs

    func isMember(_ club: Club, student: Student) -> Bool {
        student.joinedClubIDs.contains(club.id)
    }

    func toggleMembership(
        _ club: Club,
        student: inout Student
    ) {
        if student.joinedClubIDs.contains(club.id) {
            student.joinedClubIDs.remove(club.id)
        } else {
            student.joinedClubIDs.insert(club.id)
        }
    }
}