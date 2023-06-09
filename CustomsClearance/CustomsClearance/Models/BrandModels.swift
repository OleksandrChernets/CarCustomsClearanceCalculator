//
//  BrandModels.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 24.03.2023.
//

import Foundation

enum Brand: CaseIterable {
    case brandType
    case audi
    case bmw
    case mazda
    case mercedesBenz
    case volkswagen
    
    var title: String {
        switch self {
        case .brandType:
            return Localizable.brand()
        case .audi:
            return "Audi"
        case .bmw:
            return "BMW"
        case .mazda:
            return "Mazda"
        case .mercedesBenz:
            return "MercedesBenz"
        case .volkswagen:
            return "Volkswagen"
        }
    }
    var price: Int {
        switch self {
        case .audi:
            return 1000
        case .bmw:
            return 1100
        case .mazda:
            return 400
        case .mercedesBenz:
            return 800
        case .volkswagen:
            return 600
        case .brandType:
            return 0
        }
    }
}
