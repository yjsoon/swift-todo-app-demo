//
//  TodoRowView.swift
//  Todo App
//
//  Created by YJ Soon on 1/5/23.
//

import SwiftUI

struct TodoRowView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        NavigationLink {
            TodoDetailView(todo: $todo)
        } label: {
            HStack {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .onTapGesture {
                        todo.isCompleted.toggle()
                    }
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                    if !todo.subtitle.isEmpty {
                        Text(todo.subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .strikethrough(todo.isCompleted)
                    }
                }
            }
        }
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: .constant(Todo(title: "Demo todo")))
    }
}
