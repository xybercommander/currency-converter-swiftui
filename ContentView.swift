//
//  ContentView.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 01/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var topToBottom: Bool = true
    @State var rotationAngle: Double = 0
    @State var topValue: Double = 0
    @State var bottomValue: Double = 0
    
    var body: some View {
        ZStack {
            VStack {
                TopView(topToBottom: $topToBottom, rotationAngle: $rotationAngle)
                BottomView(topToBottom: $topToBottom, rotationAngle: $rotationAngle)
            }
            
            ZStack {
                Circle()
                    .strokeBorder(Color(hex: 0xffFE4F4E), lineWidth: 10)
                    .frame(width: 150)
                    .background(Circle().foregroundColor(.white))
                
                Image(systemName: "arrow.down")
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color(hex: 0xffFE4F4E))
                    .rotationEffect(.degrees(rotationAngle))
            }
            .onTapGesture {
                topToBottom.toggle()
                withAnimation(.easeInOut(duration: 0.3)) {
                    rotationAngle += 180
                }
                rotationAngle = topToBottom ? 0 : 180
                
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            }
        }
        .environmentObject(MainViewModel(topTextFieldValue: "\(topValue)", bottomTextFieldValue: "\(bottomValue)"))
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
