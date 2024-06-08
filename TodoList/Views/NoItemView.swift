//
//  NoItemView.swift
//  TodoList
//
//  Created by 1 1 on 2024/6/7.
//

import SwiftUI

struct NoItemView: View {
    @State var animation = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person, I think you should click the add button and add a bunch of items to your list!")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something 🥳")
                    
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(animation ? secondaryAccentColor :Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animation ? 30 : 50)
                .shadow(
                    color: animation ? secondaryAccentColor.opacity(0.7) : .accentColor.opacity(0.7),
                    radius: animation ? 30 : 10,
                    x: 0,
                    y: animation ? 50 : 30)
                .scaleEffect(animation ? 1.1 : 1.0)
                .offset(y: animation ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animation else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(Animation
                .easeInOut(duration: 2.0)
                .repeatForever()) {
                animation.toggle()
            }
        })
    }
}

#Preview {
    NavigationView {
        NoItemView()
    }
    .navigationTitle("Title")
    
}
