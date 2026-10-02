import Foundation

enum SampleData {

    static let clubs: [Club] = [
        Club(
            name: "CodeCraft",
            category: "Technology",
            description: "A technical club for students interested in programming, software development and emerging technologies.",
            president: "Arjun Kumar",
            memberCount: 86,
            icon: "chevron.left.forwardslash.chevron.right"
        ),

        Club(
            name: "Pixel Studio",
            category: "Design",
            description: "A creative community focused on UI/UX design, photography, video and digital creativity.",
            president: "Priya Sharma",
            memberCount: 54,
            icon: "paintpalette.fill"
        ),

        Club(
            name: "Eco Warriors",
            category: "Environment",
            description: "Students working together on sustainability, environmental awareness and campus initiatives.",
            president: "Rahul Menon",
            memberCount: 72,
            icon: "leaf.fill"
        ),

        Club(
            name: "Literary Circle",
            category: "Literature",
            description: "A community for writers, readers, poets and students who enjoy creative expression.",
            president: "Meera Nair",
            memberCount: 43,
            icon: "book.fill"
        )
    ]

    static var events: [ClubEvent] {
        let calendar = Calendar.current

        return [
            ClubEvent(
                title: "SwiftUI Workshop",
                clubName: "CodeCraft",
                date: calendar.date(byAdding: .day, value: 3, to: Date()) ?? Date(),
                location: "Innovation Lab",
                description: "Hands-on introduction to building modern iOS applications with SwiftUI.",
                capacity: 50,
                registeredCount: 32
            ),

            ClubEvent(
                title: "Design Sprint",
                clubName: "Pixel Studio",
                date: calendar.date(byAdding: .day, value: 7, to: Date()) ?? Date(),
                location: "Design Studio",
                description: "A collaborative design challenge where students create solutions for real campus problems.",
                capacity: 40,
                registeredCount: 21
            ),

            ClubEvent(
                title: "Green Campus Drive",
                clubName: "Eco Warriors",
                date: calendar.date(byAdding: .day, value: 10, to: Date()) ?? Date(),
                location: "Main Campus",
                description: "A campus-wide sustainability and tree-planting initiative.",
                capacity: 100,
                registeredCount: 67
            )
        ]
    ]
}