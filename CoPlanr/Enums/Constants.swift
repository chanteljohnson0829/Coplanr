//
//  Constants.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/19/25.
//

enum Constants {
    enum API {
        static let authURL = "http://localhost:3001/api/users"
        static let allEventsURL = "http://localhost:3001/api/events"
    }
    
    enum Auth {
        static let accessTokenKey = "ACCESS_TOKEN"
        static let xAuthToken = "x-auth-token"
        static let isLoggedInKey = "isLoggedIn"
    }
}
