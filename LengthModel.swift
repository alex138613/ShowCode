//
//  LengthModel.swift
//  Convertor
//
//  Created by Alex on 07.08.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum LengthName: String, CaseIterable {
    case ft
    case miles
    case miles_s
    case km
    case yd
    case m
    case inch
    case sm
    case mm


    var val: Double {
        switch self {
        case .ft: return 1.0
        case .miles: return 0.000189394
        case .miles_s: return 0.000164579
        case .km : return 0.0003048
        case .yd : return 0.333333
        case .m: return 0.3048
        case .inch: return 12
        case .sm: return 30.48
        case .mm: return 304.8
        }
    }
}




enum Length {
    case ft(val: Double, type: LengthName)
    case miles(val: Double, type: LengthName)
    case miles_s(val: Double, type: LengthName)
    case km(val: Double, type: LengthName)
    case yd(val: Double, type: LengthName)
    case m(val: Double, type: LengthName)
    case inch(val: Double, type: LengthName)
    case sm(val: Double, type: LengthName)
    case mm(val: Double, type: LengthName)
}


extension Length {

    var description: String {
        switch self {
        case .ft: return LengthName.ft.rawValue
        case .miles: return LengthName.miles.rawValue
        case .miles_s: return LengthName.miles_s.rawValue
        case .km: return LengthName.km.rawValue
        case .yd: return LengthName.yd.rawValue
        case .m: return LengthName.m.rawValue
        case .inch: return LengthName.inch.rawValue
        case .sm: return LengthName.sm.rawValue
        case .mm: return LengthName.mm.rawValue
        }
    }

    var val: Double {
        switch self {
        case .ft(let val, _),
                .miles(let val, _),
                .miles_s(let val, _),
                .km(let val, _),
                .yd(let val, _),
                .m(let val, _),
                .inch(let val, _),
                .sm(let val, _),
                .mm(let val, _):
            return val
        }
    }
}


extension Length {

    var toFt: Length {
        get {
            switch self {
            case .ft:
                return self
            case .miles(let x, let type),
                    .miles_s(let x, let type),
                    .km(let x, let type),
                    .yd(let x, let type),
                    .m(let x, let type),
                    .inch(let x, let type),
                    .sm(let x, let type),
                    .mm(let x, let type):
                return .ft(val: x / type.val * LengthName.ft.val, type: .ft)
            }
        }
    }

    var toMiles: Length {
        get {
            switch self {
            case .miles:
                return self
            case .ft(let x, let type),
                    .miles_s(let x, let type),
                    .km(let x, let type),
                    .yd(let x, let type),
                    .m(let x, let type),
                    .inch(let x, let type),
                    .sm(let x, let type),
                    .mm(let x, let type):
                return .miles(val: x / type.val * LengthName.miles.val, type: .miles)
            }
        }
    }

    var toMiles_s: Length {
        get {
            switch self {
            case .miles_s:
                return self
            case .ft(let x, let type),
                    .miles(let x, let type),
                    .km(let x, let type),
                    .yd(let x, let type),
                    .m(let x, let type),
                    .inch(let x, let type),
                    .sm(let x, let type),
                    .mm(let x, let type):
                return .miles_s(val: x / type.val * LengthName.miles_s.val, type: .miles_s)
            }
        }
    }

    var toKm: Length {
        get {
            switch self {
            case .km:
                return self
            case .ft(let x, let type),
                    .miles(let x, let type),
                    .miles_s(let x, let type),
                    .yd(let x, let type),
                    .m(let x, let type),
                    .inch(let x, let type),
                    .sm(let x, let type),
                    .mm(let x, let type):
                return .km(val: x / type.val * LengthName.km.val, type: .km)
            }
        }
    }

    var toYd: Length {
        get {
            switch self {
            case .yd:
                return self
            case .ft(let x, let type),
                    .miles(let x, let type),
                    .miles_s(let x, let type),
                    .km(let x, let type),
                    .m(let x, let type),
                    .inch(let x, let type),
                    .sm(let x, let type),
                    .mm(let x, let type):
                return .yd(val: x / type.val * LengthName.yd.val, type: .yd)
            }
        }
    }

    var toM: Length {
        get {
            switch self {
            case .m:
                return self
            case .ft(let x, let type),
                    .miles(let x, let type),
                    .miles_s(let x, let type),
                    .km(let x, let type),
                    .yd(let x, let type),
                    .inch(let x, let type),
                    .sm(let x, let type),
                    .mm(let x, let type):
                return .m(val: x / type.val * LengthName.m.val, type: .m)
            }
        }
    }

    var toInch: Length {
        get {
            switch self {
            case .inch:
                return self
            case .ft(let x, let type),
                    .miles(let x, let type),
                    .miles_s(let x, let type),
                    .km(let x, let type),
                    .m(let x, let type),
                    .yd(let x, let type),
                    .sm(let x, let type),
                    .mm(let x, let type):
                return .inch(val: x / type.val * LengthName.inch.val, type: .inch)
            }
        }
    }

    var toSm: Length {
        get {
            switch self {
            case .sm:
                return self
            case .ft(let x, let type),
                    .miles(let x, let type),
                    .miles_s(let x, let type),
                    .km(let x, let type),
                    .m(let x, let type),
                    .yd(let x, let type),
                    .inch(let x, let type),
                    .mm(let x, let type):
                return .sm(val: x / type.val * LengthName.sm.val, type: .sm)
            }
        }
    }

    var toMm: Length {
        get {
            switch self {
            case .mm:
                return self
            case .ft(let x, let type),
                    .miles(let x, let type),
                    .miles_s(let x, let type),
                    .km(let x, let type),
                    .m(let x, let type),
                    .yd(let x, let type),
                    .inch(let x, let type),
                    .sm(let x, let type):
                return .mm(val: x / type.val * LengthName.mm.val, type: .mm)
            }
        }
    }
}
