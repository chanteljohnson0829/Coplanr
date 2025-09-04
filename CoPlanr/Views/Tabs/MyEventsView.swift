//
//  MyEvents.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/9/25.
//

import SwiftUI

struct MyEventsView: View {
    @State private var events = [Event(id: "12345", title: "City Marathon", description: "Join us for a marathon to support your local businesses.", venue: "Trembly Park", location: "1525 Fanin St, Houston, TX 77002", eventDate: Date.distantFuture, attendees: [], createdBy: Creator(id: "1234567890", name: "The Run Club")) ,Event(id: "12345", title: "City Marathon", description: "Join us for a marathon to support your local businesses.", venue: "Trembly Park", location: "1525 Fanin St, Houston, TX 77002", eventDate: Date.distantFuture, attendees: [], createdBy: Creator(id: "1234567890", name: "Bugs Bunny")) ]
    
    @State private var searchText = ""
    @State private var searchResult: [Event] = []
    @State private var showAddEvent = false
    
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
            .navigationTitle("My Events")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button{
                    self.showAddEvent = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            
    
        }
        .tint(Welcome.orangeButtonColor)
        .sheet(isPresented: $showAddEvent){
            AddEventView()
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
    MyEventsView()
}
