//
//  Task.swift
//  Todo
//
//  Created by Flávio  Nascimento on 21/12/21.
//

import Foundation

struct Task: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}
