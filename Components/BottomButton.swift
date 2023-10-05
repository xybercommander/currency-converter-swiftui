//
//  BottomButton.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 02/10/23.
//

import SwiftUI

struct BottomButton: View {
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
        .background(Color(hex: AppColors.primaryColor, alpha: 0.3))
        .clipShape(Circle())
        .font(.system(size: 32))
        .fontWeight(.light)
        .foregroundColor(Color(hex: AppColors.primaryColor))
    }
}

struct BottomButton_Preview: PreviewProvider {
    static var previews: some View {
        // Create a binding to a string
        let textBinding = Binding<String>(
            get: { "Initial text" },
            set: { _ in }
        )
        
        // Pass the topViewModel to the TopButton
        return BottomButton(value: "0", textFieldValue: textBinding)
            .previewLayout(.sizeThatFits)
    }
}

