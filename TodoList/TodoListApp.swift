//
//  TodoListApp.swift
//  TodoList
//
//  Created by 1 1 on 2024/6/7.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
