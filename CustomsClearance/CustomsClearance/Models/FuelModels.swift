//
//  FuelModels.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 24.03.2023.
//

import Foundation

enum FuelType: CaseIterable {
    case fuelType
    case petrol
    case diesel
    case gas
    case electro
    
    var title: String {
        switch self {
        case .petrol:
            return Localizable.fuelTypePetrol()
        case .diesel:
            return Localizable.fuelTypeDiesel()
        case .gas:
            return Localizable.fuelTypeGas()
        case .electro:
            return Localizable.fuelTypeElectro()
        case .fuelType:
            return Localizable.fuelType()
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
        case .fuelType:
            return 0
        }
    }
}
