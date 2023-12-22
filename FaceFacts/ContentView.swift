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
    @State private var path: NavigationPath = NavigationPath()
   
    @State private var sortOrder: [SortDescriptor<Person>] = [SortDescriptor(\Person.name)]
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            PeopleView(searchString: searchText, sortOrder: sortOrder)
                .navigationTitle("FaceFacts")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person, navigationPath: $path)
                }
                .toolbar {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name [A-Z]")
                                .tag([SortDescriptor(\Person.name)])
                            
                            Text("Name [Z-A]")
                                .tag([SortDescriptor(\Person.name, order: .reverse)])
                        }
                    }
                    
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
