//
//  TaskRow.swift
//  Todo
//
//  Created by Flávio  Nascimento on 20/12/21.
//

import SwiftUI

struct TaskRow: View {
    var title: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(title)
                .active(completed, { $0.strikethrough() })
                .active(completed, { $0.foregroundColor(Color(hue: 0.086, saturation: 0.141, brightness: 0.572)) })
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(title: "Laundry", completed: true)
    }
}
