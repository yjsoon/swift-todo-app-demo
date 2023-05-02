//
//  ContentView.swift
//  Todo App
//
//  Created by YJ Soon on 28/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    @State private var showSheet = false
    @State private var showConfirmAlert = false
    
    var body: some View {
        NavigationStack {
            
            List($todoManager.todos, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
                
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    #if DEBUG
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "clipboard")
                    }
                    #endif
                    
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTodoView(sourceArray: $todoManager.todos)
                    .presentationDetents([.medium])
            }
            .alert("Load sample data? Warning: All existing data will be deleted.", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
