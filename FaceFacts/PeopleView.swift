//
//  PeopleView.swift
//  FaceFacts
//
//  Created by SCOTT CROWDER on 12/22/23.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var people: [Person]
    
    var body: some View {
        List {
            ForEach(people) {person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        }
    }
    
    func deletePeople(at offsets: IndexSet) {
        for offset in offsets {
            let person = people[offset]
            modelContext.delete(person)
        }
    }
}

#Preview {
    PeopleView()
}
