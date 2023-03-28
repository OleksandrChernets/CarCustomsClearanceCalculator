//
//  TypeModels.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 24.03.2023.
//

import Foundation

enum TypeCar: CaseIterable {
    case type
    case sedan
    case coupe
    case stationWagon
    case minivan
    
    var title: String {
        switch self {
        case .type:
            return Localizable.typeCarType()
        case .sedan:
            return Localizable.typeCarSedan()
        case .coupe:
            return Localizable.typeCarCoupe()
        case .stationWagon:
            return Localizable.typyCarStationWagon()
        case .minivan:
            return Localizable.typeCarMinivan()
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
