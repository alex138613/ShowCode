//
//  MomentModel.swift
//  Convertor
//
//  Created by Alex on 10.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum MomentName: String, CaseIterable {
    case kg_mm
    case kg_sm
    case kg_m

    case t_mm
    case t_sm
    case t_m

    case n_mm
    case n_sm
    case n_m

    case kN_mm
    case kN_sm
    case kN_m

    case MN_mm
    case MN_sm
    case MN_m


    var val: Double {
        switch self {
        case .kg_mm : return 1000000
        case .kg_sm : return 100000
        case .kg_m  : return 1000

        case .t_mm  : return 1000
        case .t_sm  : return 100
        case .t_m   : return 1.0

        case .n_mm  : return 9806650
        case .n_sm  : return 980665
        case .n_m   : return 9806.65

        case .kN_mm : return 9806.65
        case .kN_sm : return 980.665
        case .kN_m  : return 9.80665

        case .MN_mm : return 9.80665
        case .MN_sm : return 0.980665
        case .MN_m  : return 0.00980665
        }
    }
}




enum Moment {
    case kg_mm(val: Double, type: MomentName)
    case kg_sm(val: Double, type: MomentName)
    case kg_m(val: Double, type: MomentName)

    case t_mm(val: Double, type: MomentName)
    case t_sm(val: Double, type: MomentName)
    case t_m(val: Double, type: MomentName)

    case n_mm(val: Double, type: MomentName)
    case n_sm(val: Double, type: MomentName)
    case n_m(val: Double, type: MomentName)

    case kN_mm(val: Double, type: MomentName)
    case kN_sm(val: Double, type: MomentName)
    case kN_m(val: Double, type: MomentName)

    case MN_mm(val: Double, type: MomentName)
    case MN_sm(val: Double, type: MomentName)
    case MN_m(val: Double, type: MomentName)
}


extension Moment {

    var description: String {
        switch self {
        case .kg_mm: return MomentName.kg_mm.rawValue
        case .kg_sm: return MomentName.kg_sm.rawValue
        case .kg_m: return MomentName.kg_m.rawValue

        case .t_mm: return MomentName.t_mm.rawValue
        case .t_sm: return MomentName.t_sm.rawValue
        case .t_m: return MomentName.t_m.rawValue

        case .n_mm: return MomentName.n_mm.rawValue
        case .n_sm: return MomentName.n_sm.rawValue
        case .n_m: return MomentName.n_m.rawValue

        case .kN_mm: return MomentName.kN_mm.rawValue
        case .kN_sm: return MomentName.kN_sm.rawValue
        case .kN_m: return MomentName.kN_m.rawValue

        case .MN_mm: return MomentName.MN_mm.rawValue
        case .MN_sm: return MomentName.MN_sm.rawValue
        case .MN_m: return MomentName.MN_m.rawValue
        }
    }

    var val: Double {
        switch self {
        case .kg_mm(let val, _),
                .kg_sm(let val, _),
                .kg_m(let val, _),

                .t_mm(let val, _),
                .t_sm(let val, _),
                .t_m(let val, _),

                .n_mm(let val, _),
                .n_sm(let val, _),
                .n_m(let val, _),

                .kN_mm(let val, _),
                .kN_sm(let val, _),
                .kN_m(let val, _),

                .MN_mm(let val, _),
                .MN_sm(let val, _),
                .MN_m(let val, _):
            return val
        }
    }
}


extension Moment {

    var toKg_mm: Moment {
        get {
            switch self {
            case .kg_mm:
                return self
            case .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .kg_mm(val: x / type.val * MomentName.kg_mm.val, type: .kg_mm)
            }
        }
    }

    var toKg_sm: Moment {
        get {
            switch self {
            case .kg_sm:
                return self
            case .kg_mm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .kg_sm(val: x / type.val * MomentName.kg_sm.val, type: .kg_sm)
            }
        }
    }

    var toKg_m: Moment {
        get {
            switch self {
            case .kg_m:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .kg_m(val: x / type.val * MomentName.kg_m.val, type: .kg_m)
            }
        }
    }


    var toT_mm: Moment {
        get {
            switch self {
            case .t_mm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .t_mm(val: x / type.val * MomentName.t_mm.val, type: .t_mm)
            }
        }
    }

    var toT_sm: Moment {
        get {
            switch self {
            case .t_sm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .t_sm(val: x / type.val * MomentName.t_sm.val, type: .t_sm)
            }
        }
    }

    var toT_m: Moment {
        get {
            switch self {
            case .t_m:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .t_m(val: x / type.val * MomentName.t_m.val, type: .t_m)
            }
        }
    }


    var toN_mm: Moment {
        get {
            switch self {
            case .n_mm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .n_mm(val: x / type.val * MomentName.n_mm.val, type: .n_mm)
            }
        }
    }

    var toN_sm: Moment {
        get {
            switch self {
            case .n_sm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .n_sm(val: x / type.val * MomentName.n_sm.val, type: .n_sm)
            }
        }
    }

    var toN_m: Moment {
        get {
            switch self {
            case .n_m:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .n_m(val: x / type.val * MomentName.n_m.val, type: .n_m)
            }
        }
    }


    var toKN_mm: Moment {
        get {
            switch self {
            case .kN_mm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .kN_mm(val: x / type.val * MomentName.kN_mm.val, type: .kN_mm)
            }
        }
    }

    var toKN_sm: Moment {
        get {
            switch self {
            case .kN_sm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .kN_sm(val: x / type.val * MomentName.kN_sm.val, type: .kN_sm)
            }
        }
    }

    var toKN_m: Moment {
        get {
            switch self {
            case .kN_m:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):
                return .kN_m(val: x / type.val * MomentName.kN_m.val, type: .kN_m)
            }
        }
    }


    var toMN_mm: Moment {
        get {
            switch self {
            case .MN_mm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_sm(let x, let type),
                    .MN_m(let x, let type):

                return .MN_mm(val: x / type.val * MomentName.MN_mm.val, type: .MN_mm)
            }
        }
    }

    var toMN_sm: Moment {
        get {
            switch self {
            case .MN_sm:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_m(let x, let type):

                return .MN_sm(val: x / type.val * MomentName.MN_sm.val, type: .MN_sm)
            }
        }
    }

    var toMN_m: Moment {
        get {
            switch self {
            case .MN_m:
                return self
            case .kg_mm(let x, let type),
                    .kg_sm(let x, let type),
                    .kg_m(let x, let type),

                    .t_mm(let x, let type),
                    .t_sm(let x, let type),
                    .t_m(let x, let type),

                    .n_mm(let x, let type),
                    .n_sm(let x, let type),
                    .n_m(let x, let type),

                    .kN_mm(let x, let type),
                    .kN_sm(let x, let type),
                    .kN_m(let x, let type),

                    .MN_mm(let x, let type),
                    .MN_sm(let x, let type):
                return .MN_m(val: x / type.val * MomentName.MN_m.val, type: .MN_m)
            }
        }
    }
}
