//
//  TopButton.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 02/10/23.
//

import SwiftUI

struct TopButton: View {
    var value: String
    @Binding var textFieldValue: String
    
    var body: some View {
        Button("\(value)") {
            textFieldValue += value
            
            print(value)
            
            // Haptic feedback
            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
            impactHeavy.impactOccurred()
        }
        .padding(value == "." ? 36 : 32)
        .background(Color(hex: 0xffffffff, alpha: 0.3))
        .clipShape(Circle())
        .font(.system(size: 32))
        .fontWeight(.light)
        .foregroundColor(.white)
    }
}

//#Preview {
//    TopButton(value: "0")
//        .previewLayout(.sizeThatFits)
//}

struct TopButton_Preview: PreviewProvider {
    static var previews: some View {
        // Create a binding to a string
        let textBinding = Binding<String>(
            get: { "Initial text" },
            set: { _ in }
        )
        
        // Pass the topViewModel to the TopButton
        return TopButton(value: "0", textFieldValue: textBinding)
            .previewLayout(.sizeThatFits)
    }
}
