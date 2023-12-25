//
//  PressureModel.swift
//  Convertor
//
//  Created by Alex on 10.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum PressureName: String, CaseIterable {
    case kg_mm2
    case kg_sm2
    case kg_m2

    case t_mm2
    case t_sm2
    case t_m2

    case N_mm2
    case N_sm2
    case N_m2

    case kN_mm2
    case kN_sm2
    case kN_m2

    case MN_mm2
    case MN_sm2
    case MN_m2

    case Pa
    case kPa
    case MPa

    case atm
    case bar
    case psi
    case mmHg


    var val: Double {
        switch self {
        case .kg_mm2: return 0.01
        case .kg_sm2: return 1
        case .kg_m2 : return 10000

        case .t_mm2 : return 0.00001
        case .t_sm2 : return 0.001
        case .t_m2  : return 10

        case .N_mm2 : return 0.0980665
        case .N_sm2 : return 9.80665
        case .N_m2  : return 98066.5

        case .kN_mm2: return 0.0000980665
        case .kN_sm2: return 0.00980665
        case .kN_m2 : return 98.0665

        case .MN_mm2: return 0.0000000980665
        case .MN_sm2: return 0.00000980665
        case .MN_m2 : return 0.0980665

        case .Pa    : return 98066.5
        case .kPa   : return 98.0665
        case .MPa   : return 0.0980665

        case .atm   : return 0.96784110535406
        case .bar   : return 0.980665
        case .psi   : return 14.223343307098508
        case .mmHg  : return 735.561272708179
        }
    }
}




enum Pressure {
    case kg_mm2(val: Double, type: PressureName)
    case kg_sm2(val: Double, type: PressureName)
    case kg_m2(val: Double, type: PressureName)

    case t_mm2(val: Double, type: PressureName)
    case t_sm2(val: Double, type: PressureName)
    case t_m2(val: Double, type: PressureName)

    case kN_mm2(val: Double, type: PressureName)
    case kN_sm2(val: Double, type: PressureName)
    case kN_m2(val: Double, type: PressureName)

    case MN_mm2(val: Double, type: PressureName)
    case MN_sm2(val: Double, type: PressureName)
    case MN_m2(val: Double, type: PressureName)

    case N_mm2(val: Double, type: PressureName)
    case N_sm2(val: Double, type: PressureName)
    case N_m2(val: Double, type: PressureName)

    case Pa(val: Double, type: PressureName)
    case kPa(val: Double, type: PressureName)
    case MPa(val: Double, type: PressureName)

    case atm(val: Double, type: PressureName)
    case bar(val: Double, type: PressureName)
    case psi(val: Double, type: PressureName)
    case mmHg(val: Double, type: PressureName)
}


extension Pressure {

    var description: String {
        switch self {
        case .kg_mm2: return PressureName.kg_mm2.rawValue
        case .kg_sm2: return PressureName.kg_sm2.rawValue
        case .kg_m2: return PressureName.kg_m2.rawValue

        case .t_mm2: return PressureName.t_mm2.rawValue
        case .t_sm2: return PressureName.t_sm2.rawValue
        case .t_m2: return PressureName.t_m2.rawValue

        case .kN_mm2: return PressureName.kN_mm2.rawValue
        case .kN_sm2: return PressureName.kN_sm2.rawValue
        case .kN_m2: return PressureName.kN_m2.rawValue

        case .MN_mm2: return PressureName.MN_mm2.rawValue
        case .MN_sm2: return PressureName.MN_sm2.rawValue
        case .MN_m2: return PressureName.MN_m2.rawValue

        case .N_mm2: return PressureName.N_mm2.rawValue
        case .N_sm2: return PressureName.N_sm2.rawValue
        case .N_m2: return PressureName.N_m2.rawValue

        case .Pa: return PressureName.Pa.rawValue
        case .kPa: return PressureName.kPa.rawValue
        case .MPa: return PressureName.MPa.rawValue

        case .atm: return PressureName.psi.rawValue
        case .bar: return PressureName.bar.rawValue
        case .psi: return PressureName.psi.rawValue
        case .mmHg: return PressureName.mmHg.rawValue
        }
    }

    var val: Double {
        switch self {
        case .kg_mm2(let val, _),
                .kg_sm2(let val, _),
                .kg_m2(let val, _),

                .t_mm2(let val, _),
                .t_sm2(let val, _),
                .t_m2(let val, _),

                .kN_mm2(let val, _),
                .kN_sm2(let val, _),
                .kN_m2(let val, _),

                .MN_mm2(let val, _),
                .MN_sm2(let val, _),
                .MN_m2(let val, _),

                .N_mm2(let val, _),
                .N_sm2(let val, _),
                .N_m2(let val, _),

                .Pa(let val, _),
                .kPa(let val, _),
                .MPa(let val, _),

                .atm(let val, _),
                .bar(let val, _),
                .psi(let val, _),
                .mmHg(let val, _):
            return val
        }
    }
}


extension Pressure {

    var toKg_mm2: Pressure {
        get {
            switch self {
            case .kg_mm2:
                return self
            case .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .kg_mm2(val: x / type.val * PressureName.kg_mm2.val, type: .kg_mm2)
            }
        }
    }

    var toKg_sm2: Pressure {
        get {
            switch self {
            case .kg_sm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .kg_sm2(val: x / type.val * PressureName.kg_sm2.val, type: .kg_sm2)
            }
        }
    }

    var toKg_m2: Pressure {
        get {
            switch self {
            case .kg_m2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .kg_m2(val: x / type.val * PressureName.kg_m2.val, type: .kg_m2)
            }
        }
    }


    var toT_mm2: Pressure {
        get {
            switch self {
            case .t_mm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .t_mm2(val: x / type.val * PressureName.t_mm2.val, type: .t_mm2)
            }
        }
    }

    var toT_sm2: Pressure {
        get {
            switch self {
            case .t_sm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .t_sm2(val: x / type.val * PressureName.t_sm2.val, type: .t_sm2)
            }
        }
    }

    var toT_m2: Pressure {
        get {
            switch self {
            case .t_m2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .t_m2(val: x / type.val * PressureName.t_m2.val, type: .t_m2)
            }
        }
    }


    var toKN_mm2: Pressure {
        get {
            switch self {
            case .kN_mm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .kN_mm2(val: x / type.val * PressureName.kN_mm2.val, type: .kN_mm2)
            }
        }
    }

    var toKN_sm2: Pressure {
        get {
            switch self {
            case .kN_sm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .kN_sm2(val: x / type.val * PressureName.kN_sm2.val, type: .kN_sm2)
            }
        }
    }

    var toKN_m2: Pressure {
        get {
            switch self {
            case .kN_m2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .kN_m2(val: x / type.val * PressureName.kN_m2.val, type: .kN_m2)
            }
        }
    }


    var toMN_mm2: Pressure {
        get {
            switch self {
            case .MN_mm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .MN_mm2(val: x / type.val * PressureName.MN_mm2.val, type: .MN_mm2)
            }
        }
    }

    var toMN_sm2: Pressure {
        get {
            switch self {
            case .MN_sm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .MN_sm2(val: x / type.val * PressureName.MN_sm2.val, type: .MN_sm2)
            }
        }
    }

    var toMN_m2: Pressure {
        get {
            switch self {
            case .MN_m2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .MN_m2(val: x / type.val * PressureName.MN_m2.val, type: .MN_m2)
            }
        }
    }


    var toN_mm2: Pressure {
        get {
            switch self {
            case .N_mm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .N_mm2(val: x / type.val * PressureName.N_mm2.val, type: .N_mm2)
            }
        }
    }

    var toN_sm2: Pressure {
        get {
            switch self {
            case .N_sm2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .N_sm2(val: x / type.val * PressureName.N_sm2.val, type: .N_sm2)
            }
        }
    }

    var toN_m2: Pressure {
        get {
            switch self {
            case .N_m2:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .N_m2(val: x / type.val * PressureName.N_m2.val, type: .N_m2)
            }
        }
    }


    var toPa: Pressure {
        get {
            switch self {
            case .Pa:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .Pa(val: x / type.val * PressureName.Pa.val, type: .Pa)
            }
        }
    }

    var toKPa: Pressure {
        get {
            switch self {
            case .kPa:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .kPa(val: x / type.val * PressureName.kPa.val, type: .kPa)
            }
        }
    }

    var toMPa: Pressure {
        get {
            switch self {
            case .MPa:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .MPa(val: x / type.val * PressureName.MPa.val, type: .MPa)
            }
        }
    }


    var toBar: Pressure {
        get {
            switch self {
            case .bar:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .bar(val: x / type.val * PressureName.bar.val, type: .bar)
            }
        }
    }

    var toPsi: Pressure {
        get {
            switch self {
            case .psi:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .mmHg(let x, let type):
                return .psi(val: x / type.val * PressureName.psi.val, type: .psi)
            }
        }
    }

    var toAtm: Pressure {
        get {
            switch self {
            case .atm:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .bar(let x, let type),
                    .psi(let x, let type),
                    .mmHg(let x, let type):
                return .atm(val: x / type.val * PressureName.atm.val, type: .atm)
            }
        }
    }

    var toMmHg: Pressure {
        get {
            switch self {
            case .mmHg:
                return self
            case .kg_mm2(let x, let type),
                    .kg_sm2(let x, let type),
                    .kg_m2(let x, let type),

                    .t_mm2(let x, let type),
                    .t_sm2(let x, let type),
                    .t_m2(let x, let type),

                    .kN_mm2(let x, let type),
                    .kN_sm2(let x, let type),
                    .kN_m2(let x, let type),

                    .MN_mm2(let x, let type),
                    .MN_sm2(let x, let type),
                    .MN_m2(let x, let type),

                    .N_mm2(let x, let type),
                    .N_sm2(let x, let type),
                    .N_m2(let x, let type),

                    .Pa(let x, let type),
                    .kPa(let x, let type),
                    .MPa(let x, let type),

                    .atm(let x, let type),
                    .bar(let x, let type),
                    .psi(let x, let type):
                return .mmHg(val: x / type.val * PressureName.mmHg.val, type: .mmHg)
            }
        }
    }
}
