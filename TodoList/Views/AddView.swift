//
//  AddView.swift
//  TodoList
//
//  Created by 1 1 on 2024/6/7.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = "";
    @State var showAlert: Bool = false;
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Button(action: {
                    if textFieldText.count < 3 {
                        showAlert.toggle()
                    } else {
                        listViewModel.addItem(title: textFieldText)
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("your todo item should be at least 3 characters 😜😇🤣"))
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖊️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .preferredColorScheme(.light)
    .environmentObject(ListViewModel())
}
