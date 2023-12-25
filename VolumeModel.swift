//
//  VolumeModel.swift
//  Convertor
//
//  Created by Alex on 07.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum VolumeName: String, CaseIterable {
    case ml
    case l
    case gal
    case sm3
    case m3

    var val: Double {
        switch self {
        case .ml: return 1000
        case .l: return 1.0
        case .gal: return 0.2641720524
        case .sm3: return 1000
        case .m3: return 0.001
        }
    }
}




enum Volume {
    case ml(val: Double, type: VolumeName)
    case l(val: Double, type: VolumeName)
    case gal(val: Double, type: VolumeName)
    case sm3(val: Double, type: VolumeName)
    case m3(val: Double, type: VolumeName)
}


extension Volume {

    var description: String {
        switch self {
        case .ml: return VolumeName.l.rawValue
        case .l: return VolumeName.l.rawValue
        case .gal: return VolumeName.gal.rawValue
        case .sm3: return VolumeName.sm3.rawValue
        case .m3: return VolumeName.m3.rawValue
        }
    }

    var val: Double {
        switch self {
        case .ml(let val, _),
                .l(let val, _),
                .gal(let val, _),
                .sm3(let val, _),
                .m3(let val, _):
            return val
        }
    }
}


extension Volume {

    var toMl: Volume {
        get {
            switch self {
            case .ml:
                return self
            case .l(let x, let type),
                    .gal(let x, let type),
                    .sm3(let x, let type),
                    .m3(let x, let type):
                return .ml(val: x / type.val * VolumeName.ml.val, type: .ml)
            }
        }
    }

    var toL: Volume {
        get {
            switch self {
            case .l:
                return self
            case .ml(let x, let type),
                    .gal(let x, let type),
                    .sm3(let x, let type),
                    .m3(let x, let type):
                return .l(val: x / type.val * VolumeName.l.val, type: .l)
            }
        }
    }

    var toGal: Volume {
        get {
            switch self {
            case .ml(let x, let type),
                    .l(let x, let type),
                    .sm3(let x, let type),
                    .m3(let x, let type):
                return .gal(val: x / type.val * VolumeName.gal.val, type: .gal)
            case .gal:
                return self
            }
        }
    }

    var toSm3: Volume {
        get {
            switch self {
            case .ml(let x, let type),
                    .l(let x, let type),
                    .gal(let x, let type),
                    .m3(let x, let type):
                return .sm3(val: x / type.val * VolumeName.sm3.val, type: .sm3)
            case .sm3:
                return self
            }
        }
    }

    var toM3: Volume {
        get {
            switch self {
            case .ml(let x, let type),
                    .l(let x, let type),
                    .gal(let x, let type),
                    .sm3(let x, let type):
                return .m3(val: x / type.val * VolumeName.m3.val, type: .m3)
            case .m3:
                return self
            }
        }
    }
}
