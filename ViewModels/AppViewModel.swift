import Foundation
import SwiftUI

@MainActor
final class AppViewModel: ObservableObject {

    @Published var isLoggedIn = false
    @Published var isAdmin = false

    @Published var student = Student(
        name: "Sanjana",
        email: "student@college.edu",
        department: "Computer Science",
        year: "3rd Year",
        joinedClubIDs: [],
        registeredEventIDs: []
    )

    func login(email: String, password: String) {
        if email.lowercased().contains("admin") {
            isAdmin = true
        } else {
            isAdmin = false
        }

        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
        isAdmin = false
    }
}