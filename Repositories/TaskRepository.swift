//
//  TaskRepositorie.swift
//  Todo
//
//  Created by Flávio  Nascimento on 21/12/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var tasks: [Task] = []
    
    init() {
        getTasks()
    }
    
    func getTasks(){
        db.collection("tasks").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting tasks: \(err)")
            } else {
                if let documents = querySnapshot?.documents {
                    self.tasks = documents.map { document in
                        Task(id: document.get("id") as? String ?? "",
                             title: document.get("title") as? String ?? "",
                             completed:  document.get("completed") as? Bool ?? false)
                    }
                }
                
            }
        }
    }
    
    func addTask(title: String){
        do{
            let newTask = Task(title: title, completed: false)
            _ = try db.collection("tasks").addDocument(from: newTask)
            print("Task added: \(newTask)")
            getTasks()
        } catch {
            print("Error occured: \(error.localizedDescription)")
        }
    }
    
    func updateTask(id: String, completed: Bool){
        print("\(id)")
        db.collection("tasks").whereField("id", isEqualTo: id).getDocuments() {
            (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        document.reference.setData([ "completed": completed ], merge: true)
                        print("Task \(id) updated")
                        self.getTasks()
                    }
                }
        }
    }
    
    func deleteTask(id: String){
        db.collection("tasks").whereField("id", isEqualTo: id).getDocuments() {
            (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        document.reference.delete()
                        print("Task \(id) deleted")
                        self.getTasks()
                    }
                }   
        }
    }
}
