//
//  TopTyperView.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 02/10/23.
//

import SwiftUI

struct TopTyperView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("tap to delete")
                .onTapGesture {
                    mainViewModel.topTextFieldValue = ""
                }
            
            Spacer()
                .frame(height: 30)
            
            TextField("0", text: $mainViewModel.topTextFieldValue)
                .font(adjustableFont(for: mainViewModel.topTextFieldValue))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .tint(Color(hex: 0xffffffff, alpha: 0.6))
                .keyboardType(.decimalPad)
                .disabled(true)
            
            HStack(spacing: 30) {
                TopButton(value: "1", textFieldValue: $mainViewModel.topTextFieldValue)
                TopButton(value: "2", textFieldValue: $mainViewModel.topTextFieldValue)
                TopButton(value: "3", textFieldValue: $mainViewModel.topTextFieldValue)
            }
            HStack(spacing: 30) {
                TopButton(value: "4", textFieldValue: $mainViewModel.topTextFieldValue)
                TopButton(value: "5", textFieldValue: $mainViewModel.topTextFieldValue)
                TopButton(value: "6", textFieldValue: $mainViewModel.topTextFieldValue)
            }
            HStack(spacing: 30) {
                TopButton(value: "7", textFieldValue: $mainViewModel.topTextFieldValue)
                TopButton(value: "8", textFieldValue: $mainViewModel.topTextFieldValue)
                TopButton(value: "9", textFieldValue: $mainViewModel.topTextFieldValue)
            }
            HStack(spacing: 30) {
                TopButton(value: ".", textFieldValue: $mainViewModel.topTextFieldValue)
                TopButton(value: "0", textFieldValue: $mainViewModel.topTextFieldValue)
                Button {
                    print("Done")
                    
                    let textFieldValueDouble: Double = Double(mainViewModel.topTextFieldValue) ?? 0
                    let inrVal: Double = 83.25 * textFieldValueDouble
                    mainViewModel.bottomTextFieldValue = String(format: "%.2f", inrVal)
                    mainViewModel.topTextFieldValue = String(format: "%.2f", textFieldValueDouble)
                    
                    print("formatted textfieldvalue = \(mainViewModel.topTextFieldValue)")
                    
                    // Haptic feedback
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    impactHeavy.impactOccurred()
                    
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                }
                .padding(25)
                .background(Color(hex: 0xffffffff))
                .clipShape(Circle())
                .font(.system(size: 32))
                .fontWeight(.light)
                .foregroundColor(Color(hex: AppColors.primaryColor))
            }
            
            Spacer()
                .frame(height: 30)
            
            Button {
                dismiss()
                
                // Haptic feedback
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            } label: {
                Image(systemName: "chevron.down")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
        }
        .ignoresSafeArea(.keyboard)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: AppColors.primaryColor))
    }
}

#Preview {
    TopTyperView()
}
