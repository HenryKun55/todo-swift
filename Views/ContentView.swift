//
//  ContentView.swift
//  Todo
//
//  Created by Flávio  Nascimento on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    var taskRepository = TaskRepository()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(taskRepository)
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
            
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(taskRepository)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))

     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
