//
//  Event.swift
//  FaceFacts
//
//  Created by SCOTT CROWDER on 12/22/23.
//

import Foundation
import SwiftData

@Model final class Event {
    var name: String
    var location: String
    var people: [Person] = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
