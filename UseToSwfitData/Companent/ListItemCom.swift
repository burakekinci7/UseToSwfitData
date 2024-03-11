//
//  ListItemCom.swift
//  UseToSwfitData
//
//  Created by Ramazan Burak Ekinci on 11.03.2024.
//

import SwiftUI

struct ListItemCom: View {
    let todos : [ToDo]
    @Environment (\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(todos) {todo in
                NavigationLink(value: todo) {
                    HStack {
                        Text(todo.name)
                        Spacer()
                        Text(todo.priority.description)
                    }
                }
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let deletedTodo = todos[index]
                    context.delete(deletedTodo)
                    do {
                        try context.save()
                    }catch {
                        print("asdf")
                    }
                }
            })
        }.navigationDestination(for: ToDo.self) { todo in
            DetailView(toDo: todo)
        }
    }
}

#Preview {
    ListItemCom(todos: [ToDo(name: "12", priority: 10)]).modelContainer(for: [ToDo.self])
}

