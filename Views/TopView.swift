//
//  TopView.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 01/10/23.
//

import SwiftUI

struct TopView: View {
    @State var showTopValueSheet = false
    @EnvironmentObject private var mainViewModel: MainViewModel
    @Binding var topToBottom: Bool
    @Binding var rotationAngle: Double
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(height: 20)
                    
                    Text("United States Dollar")
                        .font(.system(size: 32))
                        .foregroundColor(Color(hex: 0xffffffff, alpha: 0.7))
                    
                    Spacer()
                        .frame(height: 50)
                    
                    HStack(alignment: .bottom, spacing: 10) {
                        Text("$")
                            .font(.system(size: 24))
                            .padding(.bottom, 20)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: 0xffffffff, alpha: 0.4))
                        Text(mainViewModel.topTextFieldValue)
                            .font(.system(size: 80))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                showTopValueSheet.toggle()
                            }
                            .sheet(isPresented: $showTopValueSheet) {
                                print("Top Value sheet dismissed")
                            } content: {
                                TopTyperView()
                            }
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Text("USD")
                        .font(.system(size: 24))
                        .padding(.bottom, 20)
                        .fontWeight(.regular)
                        .foregroundStyle(Color(hex: 0xffffffff, alpha: 0.4))
                    
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                .background(Color(hex: AppColors.primaryColor))
            }
        }
    }
}

struct TopView_Preview: PreviewProvider {
    static var previews: some View {
        let a = Binding<Bool>(
            get: { true },
            set: { _ in }
        )
        let b = Binding<Double>(
            get: { 0 },
            set: { _ in }
        )
        return TopView(topToBottom: a, rotationAngle: b)
    }
}
