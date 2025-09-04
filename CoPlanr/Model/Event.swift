//
//  Event.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/9/25.
//
import Foundation

struct Event: Decodable, Identifiable {
    var id: String
    var title: String
    var description: String
    var venue: String
    var location: String
    var eventDate: Date
    var attendees: [String] //ObjectIds of Users
    var createdBy: Creator
    var createdByName: String?
    var image: String?
    
    init(id: String, title: String, description: String, venue: String, location: String, eventDate: Date, attendees: [String], createdBy: Creator, createdByName: String? = nil, image: String? = "add_image") {
        self.id = id
        self.title = title
        self.description = description
        self.venue = venue
        self.location = location
        self.eventDate = eventDate
        self.attendees = attendees
        self.createdBy = createdBy
        self.createdByName = createdByName
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
        case venue
        case location
        case eventDate
        case attendees
        case createdBy
        case createdByName
        case image
        
    }
    
    static func formatDateString(eventDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: eventDate)
    }
}

struct Creator: Decodable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}
