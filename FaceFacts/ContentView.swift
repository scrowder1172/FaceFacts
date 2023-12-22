//
//  ContentView.swift
//  FaceFacts
//
//  Created by SCOTT CROWDER on 12/22/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
   
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            PeopleView()
                .navigationTitle("FaceFacts")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person)
                }
                .toolbar {
                    Button("Add person", systemImage: "plus", action: addPerson)
                }
                .searchable(text: $searchText)
        }
    }
    
    func addPerson() {
        let person: Person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
    
    
}

#Preview {
    ContentView()
}
