//
//  RSVPEvents.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/13/25.
//

import SwiftUI

struct RSVPEvents: View {
    @State private var events = [Event(id: "12345", title: "City Marathon", description: "Join us for a marathon to support your local businesses.", venue: "Trembly Park", location: "1525 Fanin St, Houston, TX 77002", eventDate: Date.distantFuture, attendees: [], createdBy: Creator(id: "1234567890", name: "The RUn Club")), Event(id: "12345", title: "City Marathon", description: "Join us for a marathon to support your local businesses.", venue: "Trembly Park", location: "1525 Fanin St, Houston, TX 77002", eventDate: Date.distantFuture, attendees: [], createdBy: Creator(id: "1234567890", name: "Bugs Bunny")) ]
    
    @State private var searchText = ""
    @State private var searchResult: [Event] = []
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(events.indices, id: \.self) { index in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: EventDetailsView(event: events[index])) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        EventRow(event: $events[index])
                    }
                    
                    
                }
                .listRowSeparator(.hidden)
            }
            
            .listStyle(.plain)
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.automatic)
            
    
        }
        .searchable(text: $searchText, prompt: "Search Events")
        .onChange(of: searchText, {oldValue, newValue in
            if !newValue.isEmpty {
                searchResult = events.filter {
                    $0.title.contains(newValue)
                }
            }
        })
    }
}

#Preview {
    RSVPEvents()
}
