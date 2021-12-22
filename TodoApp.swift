//
//  TodoApp.swift
//  Todo
//
//  Created by Flávio  Nascimento on 21/12/21.
//

import SwiftUI
import Firebase

@main
struct TodoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
