//
//  BottomView.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 01/10/23.
//

import SwiftUI

struct BottomView: View {
    @State var showBottomValueSheet = false
    @EnvironmentObject private var mainViewModel: MainViewModel
    @Binding var topToBottom: Bool
    @Binding var rotationAngle: Double
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    Text("INR")
                        .font(.system(size: 24))
                        .padding(.bottom, 20)
                        .fontWeight(.regular)
                        .foregroundStyle(Color(hex: AppColors.primaryColor, alpha: 0.4))
                    
                    Spacer()
                        .frame(height: 40)
                    
                    HStack(alignment: .bottom, spacing: 10) {
                        Text("₹")
                            .font(.system(size: 24))
                            .padding(.bottom, 20)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: AppColors.primaryColor, alpha: 0.4))
                        Text(mainViewModel.bottomTextFieldValue)
                            .font(.system(size: 80))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .foregroundStyle(Color(hex: AppColors.primaryColor))
                            .onTapGesture {
                                showBottomValueSheet.toggle()
                                topToBottom = false
                                rotationAngle = 180
                            }
                            .sheet(isPresented: $showBottomValueSheet) {
                                print("Bottom Value sheet dismissed")
                            } content: {
                                BottomTyperView()
                            }
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Indian Rupees")
                        .font(.system(size: 32))
                        .foregroundColor(Color(hex: AppColors.primaryColor))
                    
                    Spacer()
                        .frame(height: 20)
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                .background(.white)
            }
        }
    }
}

struct BottomView_Preview: PreviewProvider {
    static var previews: some View {
        let a = Binding<Bool>(
            get: { true },
            set: { _ in }
        )
        let b = Binding<Double>(
            get: { 0 },
            set: { _ in }
        )
        return BottomView(topToBottom: a, rotationAngle: b)
    }
}

