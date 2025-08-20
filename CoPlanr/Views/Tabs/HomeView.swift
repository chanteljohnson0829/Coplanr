//
//  Home.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/9/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var events = [Event(eventID: UUID(), title: "City Marathon", description: "Join us for a marathon to support your local businesses.", date: Date.distantFuture, location: "13350 Dallas Pkwy, Dallas, TX 75240", createdBy: UUID(), image: "city3", venue: "The Galleria Dallas"), Event(eventID: UUID(), title: "My First Event", description: "This is my first event! I want everyone to come and have a great time!", date: Date.distantFuture, location: "1415 N Loop West Houston, TX 77008", createdBy: UUID(), image: "city", venue: "Trebly Park"), Event(eventID: UUID(), title: "R&B Party", description: "Come out and enjoy listening to all of your favorite R&B songs - classic and new!", date: Date.distantFuture, location: "5085 Westheimer Rd, Houston, TX 77056", createdBy: UUID(), image: "city2", venue: "MacGregor Park") ]
    
    @State private var searchText = ""
    @State private var searchResult: [Event] = []
    @State private var isSearchActive = false
    
    var filteredEvents: [Event] {
        if searchText.isEmpty {
            return events
        } else {
            return events.filter{$0.title.localizedStandardContains(searchText)}
        }
    }
    
    
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
            .navigationBarBackButtonHidden(true)
            
    
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

func formatDateString(eventDate: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter.string(from: eventDate)
}

struct EventRow: View {
    
    @Binding var event: Event
    
    var body: some View {
    
        VStack(alignment: .leading) {
                Image(event.image)
                    .resizable()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 3)
                
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(event.title)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                    
                    Text(event.venue)
                        .font(.system(.body, design: .rounded))
                    
                    Text(Event.formatDateString(eventDate: event.date))
                        .font(.system(.subheadline, design: .rounded))
                }
                
                Spacer()
                
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName:"square.and.arrow.up")
                    Image(systemName: "heart")
                }
                
            }
                
                
        }
            
            
        
        
    }
}

#Preview {
    HomeView()
}
