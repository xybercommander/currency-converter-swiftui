//
//  BottomTyperView.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 02/10/23.
//

import SwiftUI

struct BottomTyperView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("tap to delete")
                .foregroundColor(Color(hex: AppColors.primaryColor))
                .onTapGesture {
                    mainViewModel.bottomTextFieldValue = ""
                }
            
            Spacer()
                .frame(height: 30)
            
            TextField("0", text: $mainViewModel.bottomTextFieldValue)
                .font(adjustableFont(for: mainViewModel.bottomTextFieldValue))
                .foregroundColor(Color(hex: AppColors.primaryColor))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .overlay(
                    Text("0")
                        .foregroundColor(Color(hex: AppColors.primaryColor, alpha: 0.5)) // Set the hint text color here
                        .padding(.leading, 8)
                        .font(adjustableFont(for: mainViewModel.bottomTextFieldValue))
                        .opacity(mainViewModel.bottomTextFieldValue.isEmpty ? 1 : 0) // Hide hint text when text is entered
                        .allowsHitTesting(false) // Make sure the hint text is not tappable
                        .padding(.trailing, 8)
                )
                .keyboardType(.decimalPad)
                .disabled(true)
            
            HStack(spacing: 30) {
                BottomButton(value: "1", textFieldValue: $mainViewModel.bottomTextFieldValue)
                BottomButton(value: "2", textFieldValue: $mainViewModel.bottomTextFieldValue)
                BottomButton(value: "3", textFieldValue: $mainViewModel.bottomTextFieldValue)
            }
            HStack(spacing: 30) {
                BottomButton(value: "4", textFieldValue: $mainViewModel.bottomTextFieldValue)
                BottomButton(value: "5", textFieldValue: $mainViewModel.bottomTextFieldValue)
                BottomButton(value: "6", textFieldValue: $mainViewModel.bottomTextFieldValue)
            }
            HStack(spacing: 30) {
                BottomButton(value: "7", textFieldValue: $mainViewModel.bottomTextFieldValue)
                BottomButton(value: "8", textFieldValue: $mainViewModel.bottomTextFieldValue)
                BottomButton(value: "9", textFieldValue: $mainViewModel.bottomTextFieldValue)
            }
            HStack(spacing: 30) {
                BottomButton(value: ".", textFieldValue: $mainViewModel.bottomTextFieldValue)
                BottomButton(value: "0", textFieldValue: $mainViewModel.bottomTextFieldValue)
                Button {
                    print("Done")
                    
                    let textFieldValueDouble: Double = Double(mainViewModel.bottomTextFieldValue) ?? 0
                    let usdVal: Double = 0.012 * textFieldValueDouble
                    mainViewModel.topTextFieldValue = String(format: "%.2f", usdVal)
                    mainViewModel.bottomTextFieldValue = String(format: "%.2f", textFieldValueDouble)
                    print("formatted textfieldvalue = \(mainViewModel.bottomTextFieldValue)")
                    
                    // Haptic feedback
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    impactHeavy.impactOccurred()
                    
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                }
                .padding(25)
                .background(Color(hex: AppColors.primaryColor))
                .clipShape(Circle())
                .font(.system(size: 32))
                .fontWeight(.light)
                .foregroundColor(Color(hex: 0xffffffff))
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
                    .foregroundColor(Color(hex: AppColors.primaryColor))
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
        }
        .ignoresSafeArea(.keyboard)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0xfffffff))
    }
}

#Preview {
    BottomTyperView()
}
