//
//  TypeModels.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 24.03.2023.
//

import Foundation

enum TypeCar {
    case type
    case sedan
    case coupe
    case stationWagon
    case minivan
    
    var title: String {
        switch self {
        case .type:
            return "Select type"
        case .sedan:
            return "Sedan"
        case .coupe:
            return "Coupe"
        case .stationWagon:
            return "Station wagon"
        case .minivan:
            return "Minivan"
        }
    }
    var price: Int {
        switch self {
        case .sedan:
            return 50
        case .coupe:
            return 200
        case .stationWagon:
            return 300
        case .minivan:
            return 80
        case .type:
            return 0 
        }
    }
}
