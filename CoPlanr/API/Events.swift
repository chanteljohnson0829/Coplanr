//
//  Events.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/19/25.
//
import Foundation

class Events {
    static let shared = Events()
    
    func getAllEvents() async throws -> [Event] {
        guard let url = URL(string: Constants.API.allEventsURL) else {
           throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
     
        let (data, response) = try await URLSession.shared.data(for: request)
        //print(response)
        print(String(data: data, encoding: .utf8))
            
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
            
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(formatter)
                
        let events = try decoder.decode([Event].self, from: data)
        return events
        
        
        
    }
    
    func getEventById(){
        
    
    }
    
    func updateEvent() {
        
    }
    
    func deleteEvrnt() {
        
    }
}
