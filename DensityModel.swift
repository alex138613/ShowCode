//
//  DensityModel.swift
//  Convertor
//
//  Created by Alex on 23.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


enum DensityName: String, CaseIterable {
    case kg_mm3
    case kg_sm3
    case kg_m3

    case t_mm3
    case t_sm3
    case t_m3

    case n_mm3
    case n_sm3
    case n_m3

    case kN_mm3
    case kN_sm3
    case kN_m3

    case MN_mm3
    case MN_sm3
    case MN_m3


    var val: Double {
        switch self {
        case .kg_mm3: return 0.000001
        case .kg_sm3: return 0.001
        case .kg_m3: return 1000

        case .t_mm3: return 0.000000001
        case .t_sm3: return 0.000001
        case .t_m3: return 1

        case .n_mm3: return 0.00000981
        case .n_sm3: return 0.00981
        case .n_m3: return 9810

        case .kN_mm3: return 0.00000000981
        case .kN_sm3: return 0.00000981
        case .kN_m3: return 9.81

        case .MN_mm3: return 0.00000000000981
        case .MN_sm3: return 0.00000000981
        case .MN_m3: return 0.00981
        }
    }
}




enum Density {
    case kg_mm3(val: Double, type: DensityName)
    case kg_sm3(val: Double, type: DensityName)
    case kg_m3(val: Double, type: DensityName)

    case t_mm3(val: Double, type: DensityName)
    case t_sm3(val: Double, type: DensityName)
    case t_m3(val: Double, type: DensityName)

    case n_mm3(val: Double, type: DensityName)
    case n_sm3(val: Double, type: DensityName)
    case n_m3(val: Double, type: DensityName)

    case kN_mm3(val: Double, type: DensityName)
    case kN_sm3(val: Double, type: DensityName)
    case kN_m3(val: Double, type: DensityName)

    case MN_mm3(val: Double, type: DensityName)
    case MN_sm3(val: Double, type: DensityName)
    case MN_m3(val: Double, type: DensityName)
}


extension Density {

    var description: String {
        switch self {
        case .kg_mm3: return DensityName.kg_mm3.rawValue
        case .kg_sm3: return DensityName.kg_sm3.rawValue
        case .kg_m3: return DensityName.kg_m3.rawValue

        case .t_mm3: return DensityName.t_mm3.rawValue
        case .t_sm3: return DensityName.t_sm3.rawValue
        case .t_m3: return DensityName.t_m3.rawValue

        case .n_mm3: return DensityName.n_mm3.rawValue
        case .n_sm3: return DensityName.n_sm3.rawValue
        case .n_m3: return DensityName.n_m3.rawValue

        case .kN_mm3: return DensityName.kN_mm3.rawValue
        case .kN_sm3: return DensityName.kN_sm3.rawValue
        case .kN_m3: return DensityName.kN_m3.rawValue

        case .MN_mm3: return DensityName.MN_mm3.rawValue
        case .MN_sm3: return DensityName.MN_sm3.rawValue
        case .MN_m3: return DensityName.MN_m3.rawValue
        }
    }

    var val: Double {
        switch self {
        case .kg_mm3(let val, _),
                .kg_sm3(let val, _),
                .kg_m3(let val, _),

                .t_mm3(let val, _),
                .t_sm3(let val, _),
                .t_m3(let val, _),

                .n_mm3(let val, _),
                .n_sm3(let val, _),
                .n_m3(let val, _),

                .kN_mm3(let val, _),
                .kN_sm3(let val, _),
                .kN_m3(let val, _),

                .MN_mm3(let val, _),
                .MN_sm3(let val, _),
                .MN_m3(let val, _):
            return val
        }
    }
}


extension Density {

    var toKg_mm3: Density {
        get {
            switch self {
            case .kg_mm3:
                return self
            case .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .kg_mm3(val: x / type.val * DensityName.kg_mm3.val, type: .kg_mm3)
            }
        }
    }

    var toKg_sm3: Density {
        get {
            switch self {
            case .kg_sm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .kg_sm3(val: x / type.val * DensityName.kg_sm3.val, type: .kg_sm3)
            }
        }
    }

    var toKg_m3: Density {
        get {
            switch self {
            case .kg_m3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .kg_m3(val: x / type.val * DensityName.kg_m3.val, type: .kg_m3)
            }
        }
    }


    var toT_mm3: Density {
        get {
            switch self {
            case .t_mm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),
                
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .t_mm3(val: x / type.val * DensityName.t_mm3.val, type: .t_mm3)
            }
        }
    }

    var toT_sm3: Density {
        get {
            switch self {
            case .t_sm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .t_sm3(val: x / type.val * DensityName.t_sm3.val, type: .t_sm3)
            }
        }
    }

    var toT_m3: Density {
        get {
            switch self {
            case .t_m3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .t_m3(val: x / type.val * DensityName.t_m3.val, type: .t_m3)
            }
        }
    }


    var toN_mm3: Density {
        get {
            switch self {
            case .n_mm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .n_mm3(val: x / type.val * DensityName.n_mm3.val, type: .n_mm3)
            }
        }
    }

    var toN_sm3: Density {
        get {
            switch self {
            case .n_sm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .n_sm3(val: x / type.val * DensityName.n_sm3.val, type: .n_sm3)
            }
        }
    }

    var toN_m3: Density {
        get {
            switch self {
            case .n_m3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .n_m3(val: x / type.val * DensityName.n_m3.val, type: .n_m3)
            }
        }
    }


    var toKN_mm3: Density {
        get {
            switch self {
            case .kN_mm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .kN_mm3(val: x / type.val * DensityName.kN_mm3.val, type: .kN_mm3)
            }
        }
    }

    var toKN_sm3: Density {
        get {
            switch self {
            case .kN_sm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .kN_sm3(val: x / type.val * DensityName.kN_sm3.val, type: .kN_sm3)
            }
        }
    }

    var toKN_m3: Density {
        get {
            switch self {
            case .kN_m3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .kN_m3(val: x / type.val * DensityName.kN_m3.val, type: .kN_m3)
            }
        }
    }


    var toMN_mm3: Density {
        get {
            switch self {
            case .MN_mm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_sm3(let x, let type),
                    .MN_m3(let x, let type):
                return .MN_mm3(val: x / type.val * DensityName.MN_mm3.val, type: .MN_mm3)
            }
        }
    }

    var toMN_sm3: Density {
        get {
            switch self {
            case .MN_sm3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_m3(let x, let type):
                return .MN_sm3(val: x / type.val * DensityName.MN_sm3.val, type: .MN_sm3)
            }
        }
    }

    var toMN_m3: Density {
        get {
            switch self {
            case .MN_m3:
                return self
            case .kg_mm3(let x, let type),
                    .kg_sm3(let x, let type),
                    .kg_m3(let x, let type),

                    .t_mm3(let x, let type),
                    .t_sm3(let x, let type),
                    .t_m3(let x, let type),

                    .n_mm3(let x, let type),
                    .n_sm3(let x, let type),
                    .n_m3(let x, let type),

                    .kN_mm3(let x, let type),
                    .kN_sm3(let x, let type),
                    .kN_m3(let x, let type),

                    .MN_mm3(let x, let type),
                    .MN_sm3(let x, let type):
                return .MN_m3(val: x / type.val * DensityName.MN_m3.val, type: .MN_m3)
            }
        }
    }
}
