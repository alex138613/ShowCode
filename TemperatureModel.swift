//
//  TemperatureModel.swift
//  Convertor
//
//  Created by Alex on 07.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum TemperatureName: String, CaseIterable {
    case t = "°C"
    case f = "°F"

    var val: Double {
        switch self {
        case .t: return 1.0
        case .f: return 1.8 //(or 9/5) + 32. // == 1t
        }
    }
}




enum Temperature {
    case t(val: Double, type: TemperatureName)
    case f(val: Double, type: TemperatureName)
}


extension Temperature {

    private var p32: Double {
        get {
            return 32.0
        }
    }

    var description: String {
        switch self {
        case .t: return TemperatureName.t.rawValue
        case .f: return TemperatureName.f.rawValue
        }
    }

    var val: Double {
        switch self {
        case .t(let val, _), .f(let val, _):
            return val
        }
    }
}


extension Temperature {

    var toT: Temperature {
        get {
            switch self {
            case .t:
                return self
            case .f(let x, let type):
                return .t(val: (x - p32) * (1 / type.val), type: .t)
            }
        }
    }

    var toF: Temperature {
        get {
            switch self {
            case .t(let x, let type):
                return .f(val: x / type.val * TemperatureName.f.val + p32, type: .f)
            case .f:
                return self
            }
        }
    }
}
