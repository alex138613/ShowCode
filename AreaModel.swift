//
//  AreaModel.swift
//  Convertor
//
//  Created by Alex on 10.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum AreaName: String, CaseIterable {
    case mm2
    case sm2
    case m2
    case weaving
    case hectare
    case km2

    var val: Double {
        switch self {
        case .mm2: return 100000000
        case .sm2: return 1000000
        case .m2: return 100
        case .weaving: return 1
        case .hectare: return 0.01
        case .km2: return 0.0001
        }
    }
}




enum Area {
    case mm2(val: Double, type: AreaName)
    case sm2(val: Double, type: AreaName)
    case m2(val: Double, type: AreaName)
    case weaving(val: Double, type: AreaName)
    case hectare(val: Double, type: AreaName)
    case km2(val: Double, type: AreaName)
}


extension Area {

    var description: String {
        switch self {
        case .mm2: return AreaName.mm2.rawValue
        case .sm2: return AreaName.sm2.rawValue
        case .m2: return AreaName.m2.rawValue
        case .weaving: return AreaName.weaving.rawValue
        case .hectare: return AreaName.hectare.rawValue
        case .km2: return AreaName.km2.rawValue
        }
    }

    var val: Double {
        switch self {
        case .mm2(let val, _),
                .sm2(let val, _),
                .m2(let val, _),
                .weaving(let val, _),
                .hectare(let val, _),
                .km2(let val, _):
            return val
        }
    }
}


extension Area {

    var toMm2: Area {
        get {
            switch self {
            case .mm2:
                return self
            case .sm2(let x, let type),
                    .m2(let x, let type),
                    .weaving(let x, let type),
                    .hectare(let x, let type),
                    .km2(let x, let type):
                return .mm2(val: x / type.val * AreaName.mm2.val, type: .mm2)
            }
        }
    }

    var toSm2: Area {
        get {
            switch self {
            case .sm2:
                return self
            case .mm2(let x, let type),
                    .m2(let x, let type),
                    .weaving(let x, let type),
                    .hectare(let x, let type),
                    .km2(let x, let type):
                return .sm2(val: x / type.val * AreaName.sm2.val, type: .sm2)
            }
        }
    }

    var toM2: Area {
        get {
            switch self {
            case .m2:
                return self
            case .mm2(let x, let type),
                    .sm2(let x, let type),
                    .weaving(let x, let type),
                    .hectare(let x, let type),
                    .km2(let x, let type):
                return .m2(val: x / type.val * AreaName.m2.val, type: .m2)
            }
        }
    }


    var toWeaving: Area {
        get {
            switch self {
            case .weaving:
                return self
            case .mm2(let x, let type),
                    .sm2(let x, let type),
                    .m2(let x, let type),
                    .hectare(let x, let type),
                    .km2(let x, let type):
                return .weaving(val: x / type.val * AreaName.weaving.val, type: .weaving)
            }
        }
    }

    var toHectare: Area {
        get {
            switch self {
            case .hectare:
                return self
            case .mm2(let x, let type),
                    .sm2(let x, let type),
                    .m2(let x, let type),
                    .weaving(let x, let type),
                    .km2(let x, let type):
                return .hectare(val: x / type.val * AreaName.hectare.val, type: .hectare)
            }
        }
    }

    var toKm2: Area {
        get {
            switch self {
            case .km2:
                return self
            case .mm2(let x, let type),
                    .sm2(let x, let type),
                    .m2(let x, let type),
                    .weaving(let x, let type),
                    .hectare(let x, let type):
                return .km2(val: x / type.val * AreaName.km2.val, type: .km2)
            }
        }
    }
}
