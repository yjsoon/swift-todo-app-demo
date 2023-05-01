//
//  Todo.swift
//  Todo App
//
//  Created by YJ Soon on 28/4/23.
//

import Foundation

struct Todo: Identifiable {
    
    var id = UUID() // 500716d5-ea3f-4b9b-8954-e35204a67c39 - 2.71 x 10^18
    var title: String
    var subtitle = ""
    var isCompleted = false
    
}
