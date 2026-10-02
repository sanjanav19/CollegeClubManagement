import SwiftUI

struct EventsView: View {

    var body: some View {
        NavigationStack {
            List {
                ForEach(SampleData.events) { event in
                    NavigationLink {
                        EventDetailView(event: event)
                    } label: {
                        EventRow(event: event)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Events")
        }
    }
}