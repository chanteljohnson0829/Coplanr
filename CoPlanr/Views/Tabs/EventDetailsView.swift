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
                    if let image = event.image {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                    } else {
                        Image("city2")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                    }
                    
                    
                    
                        VStack(alignment: .leading) {
                            Text(event.title)
                                .font(.system(.title, design: .rounded))
                            
                            Text(event.venue)
                                .font(.system(.title3, design: .rounded))
                            
                            Text(Event.formatDateString(eventDate: event.eventDate))
                                .font(.system(.subheadline, design:.rounded))
                            
                            Divider()
                            
                            Text("Overview")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .padding(.top)
                            Text(event.description)
                                .font(.system(size: 14))
                                .padding(.top, 2)
                                .multilineTextAlignment(.leading)
                            
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
        .padding()
    }
}

#Preview {
    EventDetailsView(event: Event(id: "12345", title: "City Marathon", description: "Join us for a marathon to support your local businesses.", venue: "Trembly Park", location: "1525 Fanin St, Houston, TX 77002", eventDate: Date.distantFuture, attendees: [], createdBy: Creator(id: "123456789", name: "Chantel Johnson")))
}
