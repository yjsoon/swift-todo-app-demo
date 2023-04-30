//
//  ContentView.swift
//  Todo App
//
//  Created by YJ Soon on 28/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "Feed the chat"),
        Todo(title: "Buy groceries", subtitle: "Bananas, eggs, milk, potatoes"),
        Todo(title: "Finish project"),
        Todo(title: "Call mom", isCompleted: true),
        Todo(title: "Go for a run", subtitle: "2km"),
        Todo(title: "Read a book")
    ]
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            
            List($todos, editActions: [.all]) { $todo in
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
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTodoView(sourceArray: $todos)
                    .presentationDetents([.medium])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
