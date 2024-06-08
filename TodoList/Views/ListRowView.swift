//
//  ListRowView.swift
//  TodoList
//
//  Created by 1 1 on 2024/6/7.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    var item1 = ItemModel(title: "one", isCompleted: false)
    var item2 = ItemModel(title: "two", isCompleted: true)
    
    return Group {
        ListRowView(item: ItemModel(title: "one", isCompleted: false))
        ListRowView(item: ItemModel(title: "two", isCompleted: true))
    }
    .previewLayout(.sizeThatFits)
}
