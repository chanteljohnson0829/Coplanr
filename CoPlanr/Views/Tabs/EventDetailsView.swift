//
//  EventDetails.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/9/25.
//

import SwiftUI

struct EventDetailsView: View {
    var event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(event.image)
                    .resizable()
                    .frame(height: 200)
                
                VStack(alignment: .leading) {
                    Text(event.title)
                        .font(.system(.title, design: .rounded))
                        
                    Text(event.venue)
                        .font(.system(.title3, design: .rounded))
                    
                    Text(Event.formatDateString(eventDate: event.date))
                        .font(.system(.subheadline, design:.rounded))
                    
                    Divider()
                    
                    Text("Overview")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .padding(.top)
                    Text(event.description)
                        .font(.system(size: 14))
                        .padding(.top, 2)
                    
                    Divider()
                    
                    Text("Location")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .padding(.top, 2)
                    
                    Text(event.venue)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        
                    Text(event.location)
                        .font(.system(size: 14, design: .rounded))
                    
                    MapView(location: event.location, venue: event.venue)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    

                    
                    
                }
                .padding(.horizontal)
                
            }
            
        }
        
        HStack {
            Button {
                
            }label: {
                Text("RSVP")
                    
            }
            .frame(width: 320, height: 40)
            .background(Welcome.orangeButtonColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    }
}

#Preview {
    EventDetailsView(event: Event(eventID: UUID(), title: "R&B Party", description: "Come out and enjoy listening to all of your favorite R&B songs - classic and new!", date: Date.distantFuture, location: "5085 Westheimer Rd, Houston, TX 77056", createdBy: UUID(), image: "city2", venue: "MacGregor Park"))
}
