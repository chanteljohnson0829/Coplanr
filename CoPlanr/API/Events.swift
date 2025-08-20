//
//  Events.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/19/25.
//
import Foundation

class Events {
    static let shared = Events()
    
    func getAllEvents() async throws -> [String:String] {
        guard let url = URL(string: Constants.API.allEventsURL) else {
           throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, response) =
        }
        
    }
    
    func getEventById(){
        
    
    }
    
    func updateEvent() {
        
    }
    
    func deleteEvrnt() {
        
    }
}
