//
//  FuelModels.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 24.03.2023.
//

import Foundation

enum FuelType {
    case petrol
    case diesel
    case gas
    case electro
    
    var title: String {
        switch self {
        case .petrol:
            return "Pertol"
        case .diesel:
            return "Diesel"
        case .gas:
            return "Gas"
        case .electro:
            return "Electro"
        }
    }
    var price: Int {
        switch self {
        case .petrol:
            return 200
        case .diesel:
            return 300
        case .gas:
            return 150
        case .electro:
            return 500
        }
    }
}
