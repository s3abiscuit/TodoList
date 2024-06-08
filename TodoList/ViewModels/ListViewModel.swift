//
//  ListViewModel.swift
//  TodoList
//
//  Created by 1 1 on 2024/6/7.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems =
//        [
//            ItemModel(title: "this is first title", isCompleted: false),
//            ItemModel(title: "this is second title", isCompleted: false),
//            ItemModel(title: "this is third title", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let date = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: date)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let item = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        print("save items")
        if let encodeDate = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeDate, forKey: itemsKey)
        }
    }
}
