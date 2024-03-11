//
//  ContentView.swift
//  UseToSwfitData
//
//  Created by Ramazan Burak Ekinci on 11.03.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State var name : String = ""
    @State var priority : Int?
    
    private var isFormValid : Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
    }
    
    private func save () {
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter your name", text: $name)
                TextField("Enter your priority", value: $priority, format: .number)
            }
            .navigationTitle("Add a new todo")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") {
                        //Dismis Action
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        //Dismis Action
                        guard let priority = priority else {return}
                        let newTodo = ToDo(name: name, priority: priority)
                        
                        context.insert(newTodo)
                        
                        do {
                            try context.save()
                        }catch {
                            print("Not save Eroor " + error.localizedDescription)
                        }
                        
                        dismiss()
                    }.disabled(!isFormValid)
                }
            }
        }
        
    }
}

#Preview {
    ContentView().modelContainer(for: [ToDo.self])
    
}
