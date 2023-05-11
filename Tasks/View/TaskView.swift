//
//  TaskView.swift
//  Tasks
//
//  Created by Enrique Poyato Ortiz on 11/5/23.
//

import SwiftUI

struct TaskView: View {
    @State var text: String = ""
    @StateObject var taskViewModel = TaskViewModel()
    var body: some View {
        VStack{
            Text("To-Do List")
                .font(.title)
                .bold()
                .padding(.bottom, 80)
            
            TextEditor(text: $text)
                .frame(height: 100)
                .border(.blue)
                .cornerRadius(5)
                .padding(.horizontal,12)
            Button {
                if text != ""{
                    taskViewModel.saveTask(description: text)

                }
                text = ""
            } label: {
                Text("Add Task")
                    .padding(5)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(5)

            }
            
            Spacer()
            
            List{
                ForEach($taskViewModel.tasks, id: \.id){ $task in
                    HStack {
                        if task.favorite{
                            Text("⭐️")
                        }
                        Text(task.description)
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            taskViewModel.favoriteTask(task: $task)
                        } label: {
                            Label("Favorite", systemImage: "star.fill")
                        }
                        .tint(.yellow)

                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            taskViewModel.removeTask(id: task.id)
                        } label: {
                            Label("Remove", systemImage: "trash.fill")
                        }
                        .tint(.red)

                    }
                }
                
            }
                
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
