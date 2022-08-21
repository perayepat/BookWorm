//
//  ContentView.swift
//  Bookworm
//
//  Created by Pat on 2022/08/21.
//

import SwiftUI



struct ContentView: View {
    @State private var remmberMe = false
    
    var body: some View {
        VStack {
//            Toggle("Remeber Me", isOn: $remmberMe)
            PushButton(title: "Remember me ", isON: $remmberMe)
            Text(remmberMe ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PushButton: View{
    let title: String
    @Binding var isON: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View{
        Button(title){
            isON.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isON ? onColors : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isON ? 0 : 5)
    }
}
