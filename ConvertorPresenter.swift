//
//  ConvertorPresenter.swift
//  Convertor
//
//  Created by Alex on 04.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


protocol ConvertorProtocol: AnyObject {
    var presenter: ConvertorPresenterProtocol? { get set }

    func resetText()
    func resetIndexValue(row: Int)
    func resetIndexKeyAndValue(row1: Int, row2: Int)
}


protocol ConvertorPresenterProtocol: AnyObject {
    var view: ConvertorProtocol? { get }
    var model: ConvertorModel { get }
    var stateModel: StateModel { get set }
    var layer: LayerSave { get }

    init(view: ConvertorProtocol?, model: ConvertorModel, stateModel: StateModel, layer: LayerSave)


    func loadData()
    func getText(_ result: Double) -> String
    func didSelectRow(component: Int, row: Int)
    func setInputVal(_ val: Double)
}




final class ConvertorPresenter: ConvertorPresenterProtocol {

    weak var view: ConvertorProtocol?

    var model: ConvertorModel
    var stateModel: StateModel

    var layer: LayerSave




    required init(view: ConvertorProtocol?, model: ConvertorModel, stateModel: StateModel, layer: LayerSave) {
        self.view = view
        self.model = model
        self.stateModel = stateModel
        self.layer = layer

        addMissingData()
    }


    func loadData() {
       if let currentKey = layer.readDefaultKey(),
           let val = model.dict[currentKey] {

           model.currentKeyRow = val.indexKey
           stateModel = val


           let row1 = val.indexKey
           let row2 = val.newIndexValue

           view?.resetIndexKeyAndValue(row1: row1, row2: row2)

       } else {
           view?.resetText()
       }
   }


    func getText(_ result: Double) -> String {
        var text = String(format: "%.3f", result)
        text = editText(text: text)
        return text.replacingOccurrences(of: ".", with: ",")
    }
}


// MARK: Select row -
extension ConvertorPresenter {

    func didSelectRow(component: Int, row: Int) {
        if component == 0 {
            model.currentKeyRow = row

            if let valFromDict = model.currentValFromDict {
                stateModel = valFromDict
            } else {
                stateModel.indexKey = model.currentKeyRow
                stateModel.indexKeyName = model.currentKey

                stateModel.inputIndexValue = 0
                stateModel.inputVal = 0

                stateModel.oldIndexValue = 0
                stateModel.newIndexValue = 0

                stateModel.oldVal = 0
                stateModel.newVal = 0
            }

            model.dict[model.currentKey] = stateModel

            view?.resetIndexValue(row: stateModel.newIndexValue)

            layer.saveDefaultKey(stateModel.indexKeyName)

        } else if component == 1 {
            model.currentValueRow = row

            if let current = model.dict[model.currentKey] {
                stateModel = current
            }

            stateModel.oldIndexValue = stateModel.newIndexValue
            stateModel.newIndexValue = row


            convert()
        }
    }
}


// MARK: Input val -
extension ConvertorPresenter {

    func setInputVal(_ val: Double) {
        if let current = model.dict[model.currentKey] {
            stateModel = current

            stateModel.inputIndexValue = stateModel.newIndexValue
            stateModel.inputVal = val

            stateModel.oldVal = val
            stateModel.newVal = val

        } else {
            stateModel.indexKey = model.currentKeyRow
            stateModel.indexKeyName = model.currentKey

            stateModel.inputIndexValue = 0
            stateModel.inputVal = val

            stateModel.oldIndexValue = 0
            stateModel.newIndexValue = 0

            stateModel.oldVal = val
            stateModel.newVal = val
        }


        model.currentValueRow = stateModel.newIndexValue
        model.dict[model.currentKey] = stateModel

        layer.saveDefaultKey(stateModel.indexKeyName)
    }
}

// MARK: Convert val -
extension ConvertorPresenter {

    func convert() {
        let row1 = stateModel.oldIndexValue
        let row2 = stateModel.newIndexValue

        let indexKey = stateModel.indexKey
        let val = Double(stateModel.newVal)

        var result: Double = 0


        let key = ListModels(rawValue: model.key_array[indexKey].lowercased() )
        switch key {

        case .weight:
            let oldWeight = WeightName(rawValue: model.valueArray[row1])
            let newWeight = WeightName(rawValue: model.valueArray[row2])

            let befor = helperWeight(old: oldWeight, current: val)
            let after = editHelperWeight(new: newWeight, current: befor)

            result = after?.val ?? 0

        case .length:
            let oldLength = LengthName(rawValue: model.valueArray[row1])
            let newLength = LengthName(rawValue: model.valueArray[row2])

            let befor = helperLength(old: oldLength, current: val)
            let after = editHelperLength(new: newLength, current: befor)

            result = after?.val ?? 0

        case .pressure:
            let oldPressure = PressureName(rawValue: model.valueArray[row1])
            let newPressure = PressureName(rawValue: model.valueArray[row2])

            let befor = helperPressure(old: oldPressure, current: val)
            let after = editHelperPressure(new: newPressure, current: befor)

            result = after?.val ?? 0

        case .moment:
            let oldMoment = MomentName(rawValue: model.valueArray[row1])
            let newMoment = MomentName(rawValue: model.valueArray[row2])

            let befor = helperMoment(old: oldMoment, current: val)
            let after = editHelperMoment(new: newMoment, current: befor)

            result = after?.val ?? 0

        case .volume:
            let oldVolume = VolumeName(rawValue: model.valueArray[row1])
            let newVolume = VolumeName(rawValue: model.valueArray[row2])

            let befor = helperVolume(old: oldVolume, current: val)
            let after = editHelperVolume(new: newVolume, current: befor)

            result = after?.val ?? 0

        case .area:
            let oldArea = AreaName(rawValue: model.valueArray[row1])
            let newArea = AreaName(rawValue: model.valueArray[row2])

            let befor = helperArea(old: oldArea, current: val)
            let after = editHelperArea(new: newArea, current: befor)

            result = after?.val ?? 0

        case .speed:
            let oldSpeed = SpeedName(rawValue: model.valueArray[row1])
            let newSpeed = SpeedName(rawValue: model.valueArray[row2])

            let befor = helperSpeed(old: oldSpeed, current: val)
            let after = editHelperSpeed(new: newSpeed, current: befor)

            result = after?.val ?? 0

        case .temperature:
            let oldTemperature = TemperatureName(rawValue: model.valueArray[row1])
            let newTemperature = TemperatureName(rawValue: model.valueArray[row2])

            let befor = helperTemperature(old: oldTemperature, current: val)
            let after = editHelperTemperature(new: newTemperature, current: befor)

            result = after?.val ?? 0

        case .density:
            let oldDensity = DensityName(rawValue: model.valueArray[row1])
            let newDensity = DensityName(rawValue: model.valueArray[row2])

            let befor = helperDensity(old: oldDensity, current: val)
            let after = editHelperDensity(new: newDensity, current: befor)

            result = after?.val ?? 0


        default: break
        }


        stateModel.oldVal = val
        stateModel.newVal = result
        model.dict[model.currentKey] = stateModel


        result = result > 0 ? round(result * 1000) / 1000 : result

        view?.resetText()

        layer.updateDB(stateModel)
        layer.saveDefaultKey(stateModel.indexKeyName)
    }
}


// MARK: Helpers for Edit val and First start -
extension ConvertorPresenter {

    private func addMissingData() {
        model.dict = layer.readDB()

        for (num, key) in model.key_array.enumerated() {
            if let _ = model.dict[key] {
                continue
            } else {
                model.dict[key] = StateModel(indexKey: num, indexKeyName: key)
            }
        }
    }


    private func editText(text: String) -> String {
        var str = text

        guard let last = str.popLast(), text.contains(".") else {
            return text
        }

        if last == "0" || last == "." {
            return editText(text: str)
        }

        return text
    }
}


// MARK: Helpers for Convertor val -
extension ConvertorPresenter {

    private func editHelperWeight(new type: WeightName?,
                                  current val: Weight?) -> Weight? {
        var value: Weight?

        switch type {
        case .kg:
            value = val?.toKg
        case .lb:
            value = val?.toLb
        case .oz:
            value = val?.toOz
        case .t:
            value = val?.toT
        case .N:
            value = val?.toN
        case .kN:
            value = val?.toKN
        case .MN:
            value = val?.toMN
        default:
            break
        }

        return value
    }

    private func helperWeight(old type: WeightName?,
                              current val: Double) -> Weight? {
        var value: Weight?
        guard let type = type else { return value }

        switch type {
        case .kg:
            value = Weight.kg(val: val, type: type)
        case .lb:
            value = Weight.lb(val: val, type: type)
        case .oz:
            value = Weight.oz(val: val, type: type)
        case .t:
            value = Weight.t(val: val, type: type)
        case .N:
            value = Weight.N(val: val, type: type)
        case .kN:
            value = Weight.kN(val: val, type: type)
        case .MN:
            value = Weight.MN(val: val, type: type)
        }

        return value
    }
}

extension ConvertorPresenter {

    private func editHelperLength(new type: LengthName?,
                                  current val: Length?) -> Length? {
        var value: Length?

        switch type {
        case .ft:
            value = val?.toFt
        case .miles:
            value = val?.toMiles
        case .miles_s:
            value = val?.toMiles_s
        case .km:
            value = val?.toKm
        case .yd:
            value = val?.toYd
        case .m:
            value = val?.toM
        case .inch:
            value = val?.toInch
        case .sm:
            value = val?.toSm
        case .mm:
            value = val?.toMm
        default:
            break
        }

        return value
    }

    private func helperLength(old type: LengthName?,
                              current val: Double) -> Length? {
        var value: Length?
        guard let type = type else { return value }

        switch type {
        case .ft:
            value = Length.ft(val: val, type: type)
        case .miles:
            value = Length.miles(val: val, type: type)
        case .miles_s:
            value = Length.miles_s(val: val, type: type)
        case .km:
            value = Length.km(val: val, type: type)
        case .yd:
            value = Length.yd(val: val, type: type)
        case .m:
            value = Length.m(val: val, type: type)
        case .inch:
            value = Length.inch(val: val, type: type)
        case .sm:
            value = Length.sm(val: val, type: type)
        case .mm:
            value = Length.mm(val: val, type: type)
        }

        return value
    }
}

extension ConvertorPresenter {

    private func editHelperPressure(new type: PressureName?,
                                    current val: Pressure?) -> Pressure? {
        var value: Pressure?

        switch type {
        case .kg_mm2:
            value = val?.toKg_mm2
        case .kg_sm2:
            value = val?.toKg_sm2
        case .kg_m2:
            value = val?.toKg_m2

        case .t_mm2:
            value = val?.toT_mm2
        case .t_sm2:
            value = val?.toT_sm2
        case .t_m2:
            value = val?.toT_m2

        case .kN_mm2:
            value = val?.toKN_mm2
        case .kN_sm2:
            value = val?.toKN_sm2
        case .kN_m2:
            value = val?.toKN_m2

        case .MN_mm2:
            value = val?.toMN_mm2
        case .MN_sm2:
            value = val?.toMN_sm2
        case .MN_m2:
            value = val?.toMN_m2

        case .N_mm2:
            value = val?.toN_mm2
        case .N_sm2:
            value = val?.toN_sm2
        case .N_m2:
            value = val?.toN_m2

        case .Pa:
            value = val?.toPa
        case .kPa:
            value = val?.toKPa
        case .MPa:
            value = val?.toMPa

        case .atm:
            value = val?.toAtm
        case .bar:
            value = val?.toBar
        case .psi:
            value = val?.toPsi

        case .mmHg:
            value = val?.toMmHg

        default:
            break
        }

        return value
    }

    private func helperPressure(old type: PressureName?,
                                current val: Double) -> Pressure? {
        var value: Pressure?
        guard let type = type else { return value }

        switch type {
        case .kg_mm2:
            value = Pressure.kg_mm2(val: val, type: type)
        case .kg_sm2:
            value = Pressure.kg_sm2(val: val, type: type)
        case .kg_m2:
            value = Pressure.kg_m2(val: val, type: type)

        case .t_mm2:
            value = Pressure.t_mm2(val: val, type: type)
        case .t_sm2:
            value = Pressure.t_sm2(val: val, type: type)
        case .t_m2:
            value = Pressure.t_m2(val: val, type: type)

        case .kN_mm2:
            value = Pressure.kN_mm2(val: val, type: type)
        case .kN_sm2:
            value = Pressure.kN_sm2(val: val, type: type)
        case .kN_m2:
            value = Pressure.kN_m2(val: val, type: type)

        case .MN_mm2:
            value = Pressure.MN_mm2(val: val, type: type)
        case .MN_sm2:
            value = Pressure.MN_sm2(val: val, type: type)
        case .MN_m2:
            value = Pressure.MN_m2(val: val, type: type)

        case .N_mm2:
            value = Pressure.N_mm2(val: val, type: type)
        case .N_sm2:
            value = Pressure.N_sm2(val: val, type: type)
        case .N_m2:
            value = Pressure.N_m2(val: val, type: type)

        case .Pa:
            value = Pressure.Pa(val: val, type: type)
        case .kPa:
            value = Pressure.kPa(val: val, type: type)
        case .MPa:
            value = Pressure.MPa(val: val, type: type)

        case .atm:
            value = Pressure.atm(val: val, type: type)
        case .bar:
            value = Pressure.bar(val: val, type: type)
        case .psi:
            value = Pressure.psi(val: val, type: type)
        case .mmHg:
            value = Pressure.mmHg(val: val, type: type)
        }

        return value
    }

}

extension ConvertorPresenter {

    private func editHelperMoment(new type: MomentName?,
                                  current val: Moment?) -> Moment? {
        var value: Moment?

        switch type {
        case .kg_mm:
            value = val?.toKg_mm
        case .kg_sm:
            value = val?.toKg_sm
        case .kg_m:
            value = val?.toKg_m

        case .t_mm:
            value = val?.toT_mm
        case .t_sm:
            value = val?.toT_sm
        case .t_m:
            value = val?.toT_m

        case .n_mm:
            value = val?.toN_mm
        case .n_sm:
            value = val?.toN_sm
        case .n_m:
            value = val?.toN_m

        case .kN_mm:
            value = val?.toKN_mm
        case .kN_sm:
            value = val?.toKN_sm
        case .kN_m:
            value = val?.toKN_m

        case .MN_mm:
            value = val?.toMN_mm
        case .MN_sm:
            value = val?.toMN_sm
        case .MN_m:
            value = val?.toMN_m

        default:
            break
        }

        return value
    }

    private func helperMoment(old type: MomentName?,
                              current val: Double) -> Moment? {
        var value: Moment?
        guard let type = type else { return value }

        switch type {
        case .kg_mm:
            value = Moment.kg_mm(val: val, type: type)
        case .kg_sm:
            value = Moment.kg_sm(val: val, type: type)
        case .kg_m:
            value = Moment.kg_m(val: val, type: type)

        case .t_mm:
            value = Moment.t_mm(val: val, type: type)
        case .t_sm:
            value = Moment.t_sm(val: val, type: type)
        case .t_m:
            value = Moment.t_m(val: val, type: type)

        case .n_mm:
            value = Moment.n_mm(val: val, type: type)
        case .n_sm:
            value = Moment.n_sm(val: val, type: type)
        case .n_m:
            value = Moment.n_m(val: val, type: type)

        case .kN_mm:
            value = Moment.kN_mm(val: val, type: type)
        case .kN_sm:
            value = Moment.kN_sm(val: val, type: type)
        case .kN_m:
            value = Moment.kN_m(val: val, type: type)

        case .MN_mm:
            value = Moment.MN_mm(val: val, type: type)
        case .MN_sm:
            value = Moment.MN_sm(val: val, type: type)
        case .MN_m:
            value = Moment.MN_m(val: val, type: type)
        }

        return value
    }
}

extension ConvertorPresenter {

    private func editHelperVolume(new type: VolumeName?,
                                  current val: Volume?) -> Volume? {
        var value: Volume?

        switch type {
        case .ml:
            value = val?.toMl
        case .l:
            value = val?.toL
        case .gal:
            value = val?.toGal

        case .sm3:
            value = val?.toSm3
        case .m3:
            value = val?.toM3
        default:
            break
        }

        return value
    }

    private func helperVolume(old type: VolumeName?,
                              current val: Double) -> Volume? {
        var value: Volume?
        guard let type = type else { return value }

        switch type {
        case .ml:
            value = Volume.ml(val: val, type: type)
        case .l:
            value = Volume.l(val: val, type: type)
        case .gal:
            value = Volume.gal(val: val, type: type)

        case .sm3:
            value = Volume.sm3(val: val, type: type)
        case .m3:
            value = Volume.m3(val: val, type: type)
        }

        return value
    }
}

extension ConvertorPresenter {

    private func editHelperArea(new type: AreaName?,
                                current val: Area?) -> Area? {
        var value: Area?

        switch type {
        case .mm2:
            value = val?.toMm2
        case .sm2:
            value = val?.toSm2
        case .m2:
            value = val?.toM2
        case .weaving:
            value = val?.toWeaving
        case .hectare:
            value = val?.toHectare
        case .km2:
            value = val?.toKm2

        default:
            break
        }

        return value
    }
    
    private func helperArea(old type: AreaName?,
                            current val: Double) -> Area? {
        var value: Area?
        guard let type = type else { return value }

        switch type {
        case .mm2:
            value = Area.mm2(val: val, type: type)
        case .sm2:
            value = Area.sm2(val: val, type: type)
        case .m2:
            value = Area.m2(val: val, type: type)
        case .weaving:
            value = Area.weaving(val: val, type: type)
        case .hectare:
            value = Area.hectare(val: val, type: type)
        case .km2:
            value = Area.km2(val: val, type: type)
        }

        return value
    }

}

extension ConvertorPresenter {

    private func editHelperSpeed(new type: SpeedName?,
                                  current val: Speed?) -> Speed? {
        var value: Speed?

        switch type {
        case .kph:
            value = val?.toKph
        case .mph:
            value = val?.toMph
        case .ms:
            value = val?.toMs

        case .mph_s:
            value = val?.toMph_s
        case .knot:
            value = val?.toKnot
        case .lei:
            value = val?.toLei

        default:
            break
        }

        return value
    }

    private func helperSpeed(old type: SpeedName?,
                              current val: Double) -> Speed? {
        var value: Speed?
        guard let type = type else { return value }

        switch type {
        case .kph:
            value = Speed.kph(val: val, type: type)
        case .mph:
            value = Speed.mph(val: val, type: type)
        case .ms:
            value = Speed.ms(val: val, type: type)

        case .mph_s:
            value = Speed.mph_s(val: val, type: type)
        case .knot:
            value = Speed.knot(val: val, type: type)
        case .lei:
            value = Speed.lei(val: val, type: type)
        }

        return value
    }
}

extension ConvertorPresenter {

    private func editHelperTemperature(new type: TemperatureName?,
                                       current val: Temperature?) -> Temperature? {
        var value: Temperature?

        switch type {
        case .t:
            value = val?.toT
        case .f:
            value = val?.toF
        default:
            break
        }

        return value
    }

    private func helperTemperature(old type: TemperatureName?,
                                   current val: Double) -> Temperature? {
        var value: Temperature?
        guard let type = type else { return value }

        switch type {
        case .t:
            value = Temperature.t(val: val, type: type)
        case .f:
            value = Temperature.f(val: val, type: type)
        }

        return value
    }
}

extension ConvertorPresenter {

    private func editHelperDensity(new type: DensityName?,
                                       current val: Density?) -> Density? {
        var value: Density?

        switch type {
        case .kg_mm3:
            value = val?.toKg_mm3
        case .kg_sm3:
            value = val?.toKg_sm3
        case .kg_m3:
            value = val?.toKg_m3

        case .t_mm3:
            value = val?.toT_mm3
        case .t_sm3:
            value = val?.toT_sm3
        case .t_m3:
            value = val?.toT_m3

        case .n_mm3:
            value = val?.toN_mm3
        case .n_sm3:
            value = val?.toN_sm3
        case .n_m3:
            value = val?.toN_m3

        case .kN_mm3:
            value = val?.toKN_mm3
        case .kN_sm3:
            value = val?.toKN_sm3
        case .kN_m3:
            value = val?.toKN_m3

        case .MN_mm3:
            value = val?.toMN_mm3
        case .MN_sm3:
            value = val?.toMN_sm3
        case .MN_m3:
            value = val?.toMN_m3

        default:
            break
        }

        return value
    }

    private func helperDensity(old type: DensityName?,
                                   current val: Double) -> Density? {
        var value: Density?
        guard let type = type else { return value }

        switch type {
        case .kg_mm3:
            value = Density.kg_mm3(val: val, type: type)
        case .kg_sm3:
            value = Density.kg_sm3(val: val, type: type)
        case .kg_m3:
            value = Density.kg_m3(val: val, type: type)

        case .t_mm3:
            value = Density.t_mm3(val: val, type: type)
        case .t_sm3:
            value = Density.t_sm3(val: val, type: type)
        case .t_m3:
            value = Density.t_m3(val: val, type: type)

        case .n_mm3:
            value = Density.n_mm3(val: val, type: type)
        case .n_sm3:
            value = Density.n_sm3(val: val, type: type)
        case .n_m3:
            value = Density.n_m3(val: val, type: type)

        case .kN_mm3:
            value = Density.kN_mm3(val: val, type: type)
        case .kN_sm3:
            value = Density.kN_sm3(val: val, type: type)
        case .kN_m3:
            value = Density.kN_m3(val: val, type: type)

        case .MN_mm3:
            value = Density.MN_mm3(val: val, type: type)
        case .MN_sm3:
            value = Density.MN_sm3(val: val, type: type)
        case .MN_m3:
            value = Density.MN_m3(val: val, type: type)
        }

        return value
    }
}
