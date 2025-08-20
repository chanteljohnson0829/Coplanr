//
//  PhotoSource.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/13/25.
//

import Foundation

enum PhotoSource: Identifiable {
    case photoLibrary
    case camera
    
    var id: Int {
        hashValue
    }
}
