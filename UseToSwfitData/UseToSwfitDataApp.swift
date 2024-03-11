//
//  UseToSwfitDataApp.swift
//  UseToSwfitData
//
//  Created by Ramazan Burak Ekinci on 11.03.2024.
//

import SwiftUI
import SwiftData

@main
struct UseToSwfitDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TodoListView()
            }
        }.modelContainer(for: [ToDo.self])
    }
}
