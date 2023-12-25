//
//  ListModels.swift
//  Convertor
//
//  Created by Alex on 21.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum ListModels: String, CaseIterable  {
    case weight
    case length
    case volume
    case speed
    case temperature
    case area
    case density
    case moment
    case pressure
}


extension ListModels {

    private var comment: String {
        get {
            return "Picker value"
        }
    }


    var values: [String] {
        switch self {
        case .weight:       return WeightName.allCases.map { $0.rawValue }
        case .length:       return LengthName.allCases.map { $0.rawValue }
        case .volume:       return VolumeName.allCases.map { $0.rawValue }
        case .speed:        return SpeedName.allCases.map { $0.rawValue }
        case .temperature:  return TemperatureName.allCases.map { $0.rawValue }
        case .area:         return AreaName.allCases.map { $0.rawValue }
        case .density:      return DensityName.allCases.map { $0.rawValue }
        case .moment:       return MomentName.allCases.map { $0.rawValue }
        case .pressure:     return PressureName.allCases.map { $0.rawValue }
        }
    }

    var valuesLocalize: [String] {
        switch self {
        case .weight:
            return WeightName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .length:
            return LengthName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .volume:
            return VolumeName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .speed:
            return SpeedName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .temperature:
            return TemperatureName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .area:
            return AreaName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .density:
            return DensityName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .moment:
            return MomentName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        case .pressure:
            return PressureName.allCases.map {
                NSLocalizedString($0.rawValue, comment: comment)
            }
        }
    }
}
