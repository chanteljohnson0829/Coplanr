//
//  TabHolderView.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/9/25.
//

import SwiftUI

struct TabHolderView: View {
    
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: .home) {
                    HomeView()
                }
                
                Tab("RSVP'd", systemImage: "checkmark.message", value: .rsvp) {
                    RSVPEvents()
                }
                
                Tab("My Events", systemImage: "calendar", value: .myEvents) {
                    MyEventsView()
                }
                
                Tab("Account", systemImage: "person", value: .account) {
                    AccountView()
                }
            }
            .tint(Welcome.purpleButtonColor)
        }
    }
}

enum Tabs: Equatable, Hashable {
    case tabHolder
    case home
    case rsvp
    case myEvents
    case account
}

#Preview {
    TabHolderView()
}
