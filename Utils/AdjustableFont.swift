//
//  AdjustableFont.swift
//  currency-converter
//
//  Created by Samrat Mukherjee on 02/10/23.
//

import Foundation
import SwiftUI

func adjustableFont(for text: String) -> Font {
    if text.count > 10 {
        return Font.system(size: 60)
    } else if text.count > 20 {
        return Font.system(size: 80)
    } else {
        return Font.system(size: 100)
    }
}
