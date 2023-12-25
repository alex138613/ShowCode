//
//  ConvertorBuilder.swift
//  Convertor
//
//  Created by Alex on 04.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


protocol ConvertorBuilderProtocol {
    static func createModule(view: ConvertorProtocol?) -> ConvertorProtocol?
}


final class ConvertorBuilder: ConvertorBuilderProtocol {

    static func createModule(view: ConvertorProtocol?) -> ConvertorProtocol? {
        let model = ConvertorModel()
        let state = StateModel(indexKeyName: model.key_array.first!)
        let layer = LayerSave()

        let presenter = ConvertorPresenter(view: view, model: model, stateModel: state, layer: layer)
        view?.presenter = presenter

        return view
    }
}
