//
//  DetailView.swift
//  UseToSwfitData
//
//  Created by Ramazan Burak Ekinci on 12.03.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State var name : String = ""
    @State var priority : Int?
    
    let toDo : ToDo
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            TextField("Enter your priority", value: $priority, format: .number)
            Button("Update") {
                guard let priority = priority else {return}
                toDo.name = name
                toDo.priority = priority
                
                do {
                    try context.save()
                }catch {
                    print("Update Eroor" + error.localizedDescription)
                }
                dismiss()
            }
        }
        .navigationTitle("Add a new todo")
        .onAppear(perform: {
            // First func. init
            name = toDo.name
            priority = toDo.priority
        })
    }
}

