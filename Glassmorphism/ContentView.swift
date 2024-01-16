//
//  ContentView.swift
//  Glassmorphism
//
//  Created by 김병엽 on 2024/01/16.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.4), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                ZStack {
                    Circle()
                        .frame(width: 400, height: 400)
                        .offset(x: 150, y: -200)
                        .foregroundStyle(Color.blue.opacity(0.5))
                        .blur(radius: 8)
                    
                    Circle()
                        .frame(width: 400, height: 400)
                        .offset(x: -150, y: 200)
                        .foregroundStyle(Color.green.opacity(0.5))
                        .blur(radius: 8)
                    
                    PopupView(isPresented: $isPresented)
                }
            }
            .ignoresSafeArea()
            .navigationDestination(for: Color.self) {
                Color($0)
            }
        }
    }
}

struct PopupView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.35)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            .blur(radius: 1)
            
            VStack {
                
                    Text("Glassmorphism")
                        .font(.system(size: 24, weight: .bold))
                
                NavigationLink("Push", value: Color.white)

            }
        }
        .padding()
        .frame(width: 300, height: 400)
        .foregroundStyle(Color.black.opacity(0.8))
    }
}

#Preview {
    ContentView()
}
