//
//  ContentView.swift
//  Todo
//
//  Created by Flávio  Nascimento on 20/12/21.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var taskRepository: TaskRepository
    
    var body: some View {
        VStack {
            Text("My Tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(taskRepository.tasks) {
                    task in
                    TaskRow(title: task.title, completed: task.completed)
                        .onTapGesture {
                            taskRepository.updateTask(id: task.id, completed: !task.completed)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                taskRepository.deleteTask(id: task.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(TaskRepository())
    }
}
