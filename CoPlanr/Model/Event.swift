//
//  Event.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/9/25.
//
import Foundation

struct Event {
    var eventID: UUID
    var title: String
    var description: String
    var date: Date
    var location: String
    var createdBy: UUID
    var image: String
    var venue: String
    
    init(eventID: UUID, title: String, description: String, date: Date, location: String, createdBy: UUID, image: String, venue: String) {
        self.eventID = eventID
        self.title = title
        self.description = description
        self.date = date
        self.location = location
        self.createdBy = createdBy
        self.image = image
        self.venue = venue
    }
    
    static func formatDateString(eventDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: eventDate)
    }
}
