import SwiftUI

struct ClubsView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {

                    ForEach(SampleData.clubs) { club in
                        NavigationLink {
                            ClubDetailView(club: club)
                        } label: {
                            ClubCard(club: club)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Clubs")
        }
    }
}

struct ClubCard: View {

    let club: Club

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Image(systemName: club.icon)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(club.name)
                .font(.headline)

            Text(club.category)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text("\(club.memberCount) members")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}