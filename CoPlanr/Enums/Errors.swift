//
//  Errors.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/8/25.
//

import Foundation

enum CreateAccontError: CaseIterable {
    case UserAlreadyExists
    
    var description: String {
        switch self {
        
        case .UserAlreadyExists:
            return "A user eith this email already exists."
        }
    }
}
