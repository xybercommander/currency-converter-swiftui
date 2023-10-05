//
//  TopViewModel.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 02/10/23.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var topTextFieldValue: String
    @Published var bottomTextFieldValue: String
    
    init(topTextFieldValue: String, bottomTextFieldValue: String) {
        self.topTextFieldValue = topTextFieldValue
        self.bottomTextFieldValue = bottomTextFieldValue
    }
}
