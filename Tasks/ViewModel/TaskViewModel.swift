//
//  TaskViewModel.swift
//  Tasks
//
//  Created by Enrique Poyato Ortiz on 11/5/23.
//

import Foundation
import SwiftUI

final class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init(){
        tasks = getAllTasks()
    }
    
    
    func saveTask(description: String){
        let newtask  = Task(description: description)
        tasks.insert(newtask, at: 0)
        encodeAndSaveAllTasks()
    }
    
    func encodeAndSaveAllTasks(){
        if let encoded = try? JSONEncoder().encode(tasks){
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
    
    func getAllTasks() ->[Task] {
        if let tasksData = UserDefaults.standard.object(forKey: "tasks") as? Data {
            if let tasks = try? JSONDecoder().decode([Task].self, from: tasksData){
                return tasks
            }
        }
        return []
    }
    
    func removeTask(id: String){
        tasks.removeAll(where: {$0.id == id})
        encodeAndSaveAllTasks()
    }
    
    func favoriteTask(task: Binding<Task>){
        task.wrappedValue.favorite.toggle()
        encodeAndSaveAllTasks()
    }
}
