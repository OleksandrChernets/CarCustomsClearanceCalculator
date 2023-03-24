//
//  ProductionYearsModels.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 24.03.2023.
//

import Foundation

enum ProductionYear: String {
    case year2015 = "2015"
    case year2016 = "2016"
    case year2017 = "2017"
    case year2018 = "2018"
    case year2019 = "2019"
    case year2020 = "2020"
    case year2021 = "2021"
    case year2022 = "2022"
    case year2023 = "2023"
    
    var price: Int {
        switch self {
        case .year2015:
            return 0
        case .year2016:
            return 0
        case .year2017:
            return 0
        case .year2018:
            return 500
        case .year2019:
            return 100
        case .year2020:
            return 100
        case .year2021:
            return 100
        case .year2022:
            return 100
        case .year2023:
            return 100
        }
    }
}
