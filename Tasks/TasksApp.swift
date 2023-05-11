//
//  TasksApp.swift
//  Tasks
//
//  Created by Enrique Poyato Ortiz on 11/5/23.
//

import SwiftUI

@main
struct TasksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
