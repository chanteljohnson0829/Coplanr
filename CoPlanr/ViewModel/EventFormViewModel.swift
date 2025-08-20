//
//  EventFormViewModel.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/13/25.
//
import SwiftUI

@Observable class EventFormViewModel {
    //Form Inputs
    var title: String = ""
    var description: String = ""
    var date: Date = Date()
    var location: String = ""
    var createdBy: UUID = UUID()
    var image: String = ""
    var venue: String = ""
    
    init(event: Event? = nil) {
        self.title = title
        self.description = description
        self.date = date
        self.location = location
        self.createdBy = createdBy
        self.image = image
        self.venue = venue
    }
}




