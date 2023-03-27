//
//  CountriesModels.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 24.03.2023.
//

import Foundation

enum Country: Int {
    case ukraine
    case usa
    
    var title: String {
        switch self {
        case .ukraine:
            return "🇺🇦"
        case .usa:
            return "🇺🇸"
        }
    }
    var coefficient: Double {
        switch self {
        case .ukraine:
            return 1.0
        case .usa:
            return 1.2
        }
    }
}
