//
//  TodoListView.swift
//  UseToSwfitData
//
//  Created by Ramazan Burak Ekinci on 11.03.2024.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Query(sort: \ToDo.name, order: .forward) private var toDos : [ToDo]
    @State private var isAddTodoPresent : Bool = false
    
    var body: some View {
            ListItemCom(todos: toDos)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add TODO") {
                        isAddTodoPresent = true
                    }
                }
            }).sheet(isPresented: $isAddTodoPresent, content: {
                ContentView()
            })
       
    }
}

#Preview {
    NavigationStack {
        TodoListView().modelContainer(for: [ToDo.self])
    }
}
