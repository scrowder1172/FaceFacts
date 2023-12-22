//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by SCOTT CROWDER on 12/22/23.
//

import SwiftData
import SwiftUI

@main
struct FaceFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
