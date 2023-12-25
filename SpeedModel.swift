//
//  SpeedModel.swift
//  Convertor
//
//  Created by Alex on 07.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum SpeedName: String, CaseIterable {
    case kph
    case ms
    case mph
    case mph_s
    case knot
    case lei

    var val: Double {
        switch self {
        case .kph:      return 1.0
        case .ms:       return 0.27777777777778
        case .mph:      return 0.621371192
        case .mph_s:    return 0.53995680346
        case .knot:     return 0.53995680346
        case .lei:      return 0.17998560115191
        }
    }
}




enum Speed {
    case kph(val: Double, type: SpeedName)
    case ms(val: Double, type: SpeedName)
    case mph(val: Double, type: SpeedName)
    case mph_s(val: Double, type: SpeedName)
    case knot(val: Double, type: SpeedName)
    case lei(val: Double, type: SpeedName)
}


extension Speed {

    var description: String {
        switch self {
        case .kph: return SpeedName.kph.rawValue
        case .ms: return SpeedName.ms.rawValue
        case .mph: return SpeedName.mph.rawValue
        case .mph_s: return SpeedName.mph_s.rawValue
        case .knot: return SpeedName.knot.rawValue
        case .lei: return SpeedName.lei.rawValue
        }
    }

    var val: Double {
        switch self {
        case .kph(let val, _),
                .ms(let val, _),
                .mph(let val, _),
                .mph_s(let val, _),
                .knot(let val, _),
                .lei(let val, _):
            return val
        }
    }
}


extension Speed {

    var toKph: Speed {
        get {
            switch self {
            case .kph:
                return self
            case  .ms(let x, let type),
                    .mph(let x, let type),

                    .mph_s(let x, let type),
                    .knot(let x, let type),
                    .lei(let x, let type):
                return .kph(val: x / type.val * SpeedName.kph.val, type: .kph)
            }
        }
    }

    var toMph: Speed {
        get {
            switch self {
            case .kph(let x, let type),
                    .ms(let x, let type),

                    .mph_s(let x, let type),
                    .knot(let x, let type),
                    .lei(let x, let type):
                return .mph(val: x / type.val * SpeedName.mph.val, type: .mph)
            case .mph:
                return self
            }
        }
    }

    var toMs: Speed {
        get {
            switch self {
            case .kph(let x, let type),
                    .mph(let x, let type),

                    .mph_s(let x, let type),
                    .knot(let x, let type),
                    .lei(let x, let type):
                return .ms(val: x / type.val * SpeedName.ms.val, type: .ms)
            case .ms:
                return self
            }
        }
    }

    var toMph_s: Speed {
        get {
            switch self {
            case .kph(let x, let type),
                    .ms(let x, let type),
                    .mph(let x, let type),

                    .knot(let x, let type),
                    .lei(let x, let type):
                return .mph_s(val: x / type.val * SpeedName.mph_s.val, type: .mph_s)
            case .mph_s:
                return self
            }
        }
    }

    var toKnot: Speed {
        get {
            switch self {
            case .kph(let x, let type),
                    .ms(let x, let type),
                    .mph(let x, let type),

                    .mph_s(let x, let type),
                    .lei(let x, let type):
                return .knot(val: x / type.val * SpeedName.knot.val, type: .knot)
            case .knot:
                return self
            }
        }
    }

    var toLei: Speed {
        get {
            switch self {
            case .kph(let x, let type),
                    .ms(let x, let type),
                    .mph(let x, let type),

                    .mph_s(let x, let type),
                    .knot(let x, let type):
                return .lei(val: x / type.val * SpeedName.lei.val, type: .lei)
            case .lei:
                return self
            }
        }
    }
}
