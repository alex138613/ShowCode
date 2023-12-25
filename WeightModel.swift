//
//  Model.swift
//  Convertor
//
//  Created by Alex on 05.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum WeightName: String, CaseIterable {
    case kg
    case lb
    case oz
    case t
    case N
    case kN
    case MN

    var val: Double {
        switch self {
        case .kg: return 1.0
        case .lb: return 2.20462
        case .oz: return 35.274
        case .t : return 0.001
        case .N : return 9.80665
        case .kN: return 0.00980665
        case .MN: return 0.00000980665
        }
    }
}




enum Weight {
    case kg(val: Double, type: WeightName)
    case lb(val: Double, type: WeightName)
    case oz(val: Double, type: WeightName)
    case t(val: Double, type: WeightName)
    case N(val: Double, type: WeightName)
    case kN(val: Double, type: WeightName)
    case MN(val: Double, type: WeightName)
}


extension Weight {

    var description: String {
        switch self {
        case .kg: return WeightName.kg.rawValue
        case .lb: return WeightName.lb.rawValue
        case .oz: return WeightName.oz.rawValue
        case .t: return WeightName.t.rawValue
        case .N: return WeightName.N.rawValue
        case .kN: return WeightName.kN.rawValue
        case .MN: return WeightName.MN.rawValue
        }
    }

    var val: Double {
        switch self {
        case .kg(let val, _),
                .lb(let val, _),
                .oz(let val, _),
                .t(let val, _),
                .N(let val, _),
                .kN(let val, _),
                .MN(let val, _):
            return val
        }
    }
}


extension Weight {

    var toKg: Weight {
        get {
            switch self {
            case .kg:
                return self
            case .lb(let x, let type),
                    .oz(let x, let type),
                    .t(let x, let type),
                    .N(let x, let type),
                    .kN(let x, let type),
                    .MN(let x, let type):
                return .kg(val: x / type.val * WeightName.kg.val, type: .kg)
            }
        }
    }

    var toLb: Weight {
        get {
            switch self {
            case .kg(let x, let type),
                    .oz(let x, let type),
                    .t(let x, let type),
                    .N(let x, let type),
                    .kN(let x, let type),
                    .MN(let x, let type):
                return .lb(val: x / type.val  * WeightName.lb.val, type: .lb)
            case .lb:
                return self
            }
        }
    }

    var toOz: Weight {
        get {
            switch self {
            case .kg(let x,let type),
                    .lb(let x, let type),
                    .t(let x, let type),
                    .N(let x, let type),
                    .kN(let x, let type),
                    .MN(let x, let type):
                return .oz(val: x / type.val * WeightName.oz.val, type: .oz)
            case .oz:
                return self
            }
        }
    }

    var toT: Weight {
        get {
            switch self {
            case .kg(let x, let type),
                    .lb(let x, let type),
                    .oz(let x, let type),
                    .N(let x, let type),
                    .kN(let x, let type),
                    .MN(let x, let type):
                return .t(val: x / type.val * WeightName.t.val, type: .t)
            case .t:
                return self
            }
        }
    }

    var toN: Weight {
        get {
            switch self {
            case .kg(let x, let type),
                    .lb(let x, let type),
                    .oz(let x, let type),
                    .t(let x, let type),
                    .kN(let x, let type),
                    .MN(let x, let type):
                return .N(val: x / type.val * WeightName.N.val, type: .N)
            case .N:
                return self
            }
        }
    }

    var toKN: Weight {
        get {
            switch self {
            case .kg(let x, let type),
                    .lb(let x, let type),
                    .oz(let x, let type),
                    .t(let x, let type),
                    .N(let x, let type),
                    .MN(let x, let type):
                return .kN(val: x / type.val * WeightName.kN.val, type: .kN)
            case .kN:
                return self
            }
        }
    }

    var toMN: Weight {
        get {
            switch self {
            case .kg(let x, let type),
                    .lb(let x, let type),
                    .oz(let x, let type),
                    .t(let x, let type),
                    .N(let x, let type),
                    .kN(let x, let type):
                return .MN(val: x / type.val * WeightName.MN.val, type: .MN)
            case .MN:
                return self
            }
        }
    }
}
