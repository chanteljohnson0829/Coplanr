//
//  EventViewModel.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/22/25.
//

import Foundation

@MainActor
class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchAllEvents() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let fetchedEvents = try await Events.shared.getAllEvents()
                DispatchQueue.main.async {
                    self.events = fetchedEvents
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    print(error)
                    self.errorMessage = "Failed to load events: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}
