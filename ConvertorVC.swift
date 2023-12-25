//
//  ConvertorVC.swift
//  Convertor
//
//  Created by Alex on 24.10.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit
import Foundation


// MARK: Main part -
final class ConvertorVC: UIViewController, ConvertorProtocol {

    var presenter: ConvertorPresenterProtocol?


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var button: UIButton!

    private let subResultView = ResultView.instanceFromNib() as! ResultView


    @IBOutlet weak var constrPickerH: NSLayoutConstraint!
    @IBOutlet weak var constrPickerB: NSLayoutConstraint!
    @IBOutlet weak var constrTextFieldH: NSLayoutConstraint!
    @IBOutlet weak var constrTextFieldB: NSLayoutConstraint!
    @IBOutlet weak var constrResultH: NSLayoutConstraint!


    private var kScale: CGFloat = 1.0


    private let colorBlackView = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 0.1)
    private let colorBlackText = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1.0)

    private let colorBlue = UIColor(red: 32/255, green: 38/255, blue: 62/255, alpha: 1.0)
    private let colorBlueView = UIColor(red: 49/255, green: 55/255, blue: 77/255, alpha: 0.1)
    private let colorBlueText = UIColor(red: 106/255, green: 112/255, blue: 143/255, alpha: 1.0)

    private let colorColorsView = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
    private let colorColorsTitle = UIColor(red: 128/255, green: 147/255, blue: 241/255, alpha: 1)
    private let colorColorsChart = UIColor(red: 121/255, green: 173/255, blue: 220/255, alpha: 1)


    private var colorAB = UIColor.black
    private var colorViewAB = UIColor.black
    private var colorTextAB = UIColor.black
    private var colorChartAB = UIColor.black
    private var colorTitleAB = UIColor.black

    private var gradients: [CAGradientLayer] = []


    private var duration: TimeInterval = 0.25

    private var isHiddenRV = false {
        didSet {
            resultView.isHidden = isHiddenRV
            subResultView.isHidden = isHiddenRV
        }
    }

    private let changeColor = NSLocalizedString("Change Color", comment: "Change Color on Button")




    override func viewDidLoad() {
        super.viewDidLoad()

        addObserver()


        picker.delegate = self
        picker.dataSource = self
        textField.delegate = self


        editConstraints()

        presenter?.loadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        settingsView()

        gradintArray()
        changeColor(button)
    }

    /*override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        statusBarStyleByTag(2)
    }*/


    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: Helper -
extension ConvertorVC {

    private func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBecomeActiveAction),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willResignActiveAction),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
    }


    private func statusBarStyleByTag(_ tag: Int) {
        UIApplication.shared.statusBarStyle = tag == 0 || tag == 1 ? .lightContent : .default
    }


    // Edit constraints depends on height view
    private func editConstraints() {
        let based: CGFloat = 926
        let height = view.bounds.height
        kScale = height / based

        // Edit constraint
        constrPickerH.constant = ceil(kScale * constrPickerH.constant)
        constrPickerB.constant = ceil(kScale * constrPickerB.constant)
        constrTextFieldH.constant = ceil(kScale * constrTextFieldH.constant)
        constrTextFieldB.constant = ceil(kScale * constrTextFieldB.constant)
        constrResultH.constant = ceil(kScale * constrResultH.constant)

        subResultView.constrLeftViewW.constant = ceil(kScale * subResultView.constrLeftViewW.constant)
        subResultView.constrRightViewW.constant = ceil(kScale * subResultView.constrRightViewW.constant)


        let ofSize = ceil((textField.font?.pointSize ?? 1) * kScale)
        textField.font = .systemFont(ofSize: ofSize)


        view.layoutIfNeeded()
    }


    // Settings and setup
    private func createColors() -> (colors: [CGColor], locations: [NSNumber]) {
        let c1 = UIColor(red: 252/255, green: 246/255, blue: 189/255, alpha: 1)
        let c2 = UIColor(red: 124/255, green: 181/255, blue: 24/255, alpha: 1)
        let c3 = UIColor(red: 162/255, green: 210/255, blue: 255/255, alpha: 1)
        let c4 = UIColor(red: 121/255, green: 173/255, blue: 220/255, alpha: 1)
        let c5 = UIColor(red: 128/255, green: 147/255, blue: 241/255, alpha: 1)

        let colors = [c1.cgColor, c2.cgColor, c3.cgColor, c4.cgColor, c5.cgColor]
        let locations: [NSNumber] = [0.0, 0.25, 0.5, 0.75, 1.0]

        return (colors, locations)
    }

    private func gradintArray() {
        let bounds = view.bounds
        let locations: [NSNumber] = [0.0, 1.0]

        let gl1 = CAGradientLayer()
        gl1.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        gl1.locations = locations
        gl1.frame = bounds

        let gl2 = CAGradientLayer()
        gl2.colors = [colorBlue.cgColor, UIColor.white.cgColor]
        gl2.locations = locations
        gl2.frame = bounds


        let (colors3, locations3) = createColors()

        let gl3 = CAGradientLayer()
        gl3.frame = bounds
        gl3.colors = colors3
        gl3.locations = locations3

        gradients = [gl1, gl2, gl3]
    }

    private func settingsPicker() {
        let focusView = picker.subviews[1]
        focusView.backgroundColor = UIColor.white
        focusView.alpha = 0.08
    }

    private func settingsResultView() {
        reloadBorder(isHidden: false)
        resultView.layer.cornerRadius = 13.0

        let icon = presenter?.model.getKeyIconName
        let radius = ceil(subResultView.constrLeftViewW.constant * 0.5)
        let borderWidth: CGFloat = 2
        let masksToBounds = true

        subResultView.titleImageView.image = icon != nil ? UIImage(named: icon!) : nil
        subResultView.leftView.layer.cornerRadius = radius
        subResultView.leftView.layer.borderWidth = borderWidth
        subResultView.leftView.layer.masksToBounds = masksToBounds
        subResultView.rightView.layer.cornerRadius = radius
        subResultView.rightView.layer.borderWidth = borderWidth
        subResultView.rightView.layer.masksToBounds = masksToBounds
        subResultView.frame = resultView.frame

        view.addSubview(subResultView)
    }


    private func settingsButton() {
        button.tag = presenter?.layer.readDefaultColor() ?? 0

        button.layer.cornerRadius = 13
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: -1, height: 1)
        button.layer.shadowColor = UIColor.gray.cgColor

        //button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        //button.layer.shouldRasterize = true
        //button.layer.rasterizationScale = true ? UIScreen.main.scale : 1
        //button.layer.masksToBounds = false
    }

    private func settingsView() {
        settingsPicker()
        settingsResultView()
        settingsButton()
    }


    // Reset colors
    private func resetGradient() {
        view.layer.sublayers?.forEach {
            if let gradientLayer = $0 as? CAGradientLayer {
                gradientLayer.removeFromSuperlayer()
            }
        }

        let gl = gradients[button.tag]
        view.layer.insertSublayer(gl, at: 0)
    }

    private func resetAllColors() {
        let tag = button.tag

        statusBarStyleByTag(tag)


        switch tag {
        case 0:
            // black
            colorTextAB = .white
            colorViewAB = colorBlackView
            colorTitleAB = colorBlackText //colorChartAB
            colorChartAB = colorBlackText

        case 1:
            // blue
            colorTextAB = .white
            colorViewAB = colorBlueView
            colorTitleAB = colorBlueText //colorChartAB
            colorChartAB = colorBlueText

        case 2:
            // colores
            colorTextAB = .white
            colorViewAB = colorColorsView
            colorTitleAB = colorColorsTitle
            colorChartAB = colorColorsChart

        default: break
        }
    }

    private func resetResultView() {
        resultView.backgroundColor = colorViewAB

        subResultView.titleImageView.tintColor = .white //colorTextAB //colorChartAB
        subResultView.titleLabel.textColor = colorTextAB

        subResultView.leftView.backgroundColor = colorChartAB
        subResultView.rightView.backgroundColor = colorChartAB

        subResultView.leftValLabel.textColor = colorTextAB
        subResultView.leftDescriptionLabel.textColor = colorTextAB

        subResultView.rightValLabel.textColor = colorTextAB
        subResultView.rightDescriptionLabel.textColor = colorTextAB

        subResultView.leftView.layer.borderColor = colorChartAB.cgColor
        subResultView.rightView.layer.borderColor = colorChartAB.cgColor
    }

    private func resetTitleButton() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: colorTitleAB,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0)
        ]

        let attrTitle = NSAttributedString(string: changeColor, attributes: attributes)
        button.setAttributedTitle(attrTitle, for: .normal)
    }

    private func resetView() {
        resetGradient()
        resetAllColors()

        view.backgroundColor = colorAB
        textField.backgroundColor = colorViewAB

        resetResultView()
        resetTitleButton()
    }


    // Show or hide button for add minus in temperature value
    private func showButton() {
        textField.rightViewMode = .always
    }

    private func hideButton() {
        textField.rightViewMode = .never
    }

    private func isShowOrHideButton() {
        if presenter?.stateModel.isTemperature ?? false {
            showButton()
        } else {
            hideButton()
        }
    }
}


// MARK: Actions -
extension ConvertorVC {

    private var sizeGradient: Int {
        get {
            return gradients.isEmpty ? 0 : gradients.count - 1
        }
    }

    @IBAction private func changeColor(_ sender: UIButton) {
        resetView()

        let tag = sender.tag

        presenter?.layer.saveDefaultColor(tag)
        sender.tag = tag < sizeGradient ? tag + 1 : 0
    }
}

// MARK: Observer Actions -
extension ConvertorVC {

    @objc private func didBecomeActiveAction() {
        reloadBorder(isHidden: false)
    }

    @objc private func willResignActiveAction() {
        reloadBorder(isHidden: true)
    }
}


// MARK: UIPickerViewDataSource -
extension ConvertorVC: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return presenter?.model.rows ?? 0
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return presenter?.model.key_arrayLocalize.count ?? 0
        case 1:
            return presenter?.model.valueArrayLocalize.count ?? 0
        default:
            return 0
        }
    }
}

// MARK: UIPickerViewDelegate -
extension ConvertorVC: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        presenter?.didSelectRow(component: component, row: row)
    }

    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let ofSize = ceil(kScale * 20)
        let label = view == nil ? UILabel() : view! as! UILabel
        label.font = .boldSystemFont(ofSize: ofSize)
        label.textColor = .white
        label.textAlignment = .center
        label.text = (component == 0)
        ? presenter?.model.key_arrayLocalize[row] :
        presenter?.model.valueArrayLocalize[row]

        return label
    }

}


// MARK: Resign First Responder -
extension ConvertorVC {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
        hideButton()
    }
}

// MARK: UITextFieldDelegate -
extension ConvertorVC: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        isShowOrHideButton()

        picker.isUserInteractionEnabled = false

        textField.text = nil
        isHiddenRV = true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard var text = textField.text else { return }
        let isHasPointOrComma = text.filter { $0 == "." || $0 == "," }.count > 1
        if isHasPointOrComma {
            _ = text.popLast()
            textField.text = text
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text?.replacingOccurrences(of: ".", with: ",") ?? ""
        let str = text.replacingOccurrences(of: ",", with: ".")

        if let val = Double(str) {
            textField.text = text
            presenter?.setInputVal(val)
        } else {
            returnVal()
        }

        picker.isUserInteractionEnabled = true
        hideButton()
    }
}


// MARK: ConvertorProtocol -
extension ConvertorVC {

    func resetText() {
        reloadResultView()
    }

    func resetIndexValue(row: Int) {
        reloadData(row: row)
    }

    func resetIndexKeyAndValue(row1: Int, row2: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [unowned self] in
            self.picker.selectRow(row1, inComponent: 0, animated: true)
            self.reloadData(row: row2)
        }
    }
}

// MARK: Helper for ConvertorProtocol -
extension ConvertorVC {

    private func reloadBorder(isHidden: Bool) {
        if isHidden {
            textField.layer.borderWidth = 0.0
            textField.layer.borderColor = nil
            resultView.layer.borderWidth = textField.layer.borderWidth
            resultView.layer.borderColor = textField.layer.borderColor

        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [unowned self] in
                self.textField.layer.borderWidth = 0.1
                self.textField.layer.borderColor = UIColor.white.cgColor
                self.resultView.layer.borderWidth = self.textField.layer.borderWidth
                self.resultView.layer.borderColor = self.textField.layer.borderColor
            }
        }
    }


    private func reloadData(row: Int) {
        picker.reloadComponent(1)
        picker.selectRow(row, inComponent: 1, animated: true)
        resetText()
    }


    private func reloadResultView() {
        returnVal()


        guard let model = presenter?.stateModel,
              let iconName = presenter?.model.getKeyIconName,
              let oldName = presenter?.model.valueArrayLocalize[model.inputIndexValue],
              let newName = presenter?.model.valueArrayLocalize[model.newIndexValue] else {
            return
        }

        let title = presenter?.model.currentKeyLocalize
        var old = model.inputVal
        var new = model.newVal
        let oldVal = presenter?.getText(old)
        let newVal = presenter?.getText(new)


        // for temperature below zero
        if old < 0 && new < 0 {
            old = abs(old)
            new = abs(new)

        } else if old < 0 {
            /*old = abs(old)
            new = new == 0 ? old : new * 2
            new += old*/
            old = 0

        } else if new < 0 {
            /*new = abs(new)
            old = old == 0 ? new : old * 2
            old += new*/
            new = 0
        }
        // for temperature below zero


        let x = old < new ? new : old
        let hl1 = x == 0 ? 0.001 : CGFloat(old / x)
        let hl2 = x == 0 ? 0.001 : CGFloat(new / x)

        let bounds = subResultView.leftView.bounds
        let m = ceil(subResultView.leftView.layer.borderWidth)
        let m2x = m * 2
        let h = ceil(bounds.height)
        let w = ceil(bounds.width - m2x)
        let y = h - m
        let l1 = ceil((h - m2x) * hl1)
        let l2 = ceil((h - m2x) * hl2)


        let rect = CGRect(x: m, y: y, width: w, height: m)

        let subLeftView = addSubview(parent: subResultView.leftView, rect: rect)
        let subRightView = addSubview(parent: subResultView.rightView, rect: rect)


        subResultView.titleImageView.image = UIImage(named: iconName)
        subResultView.titleLabel.text = title?.uppercased()
        subResultView.titleLabel.sizeToFit()


        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn) {
            self.subResultView.leftValLabel.text = oldVal
            self.subResultView.leftDescriptionLabel.text = oldName

            self.subResultView.rightValLabel.text = newVal
            self.subResultView.rightDescriptionLabel.text = newName

            subLeftView.frame = CGRect(x: m, y: y, width: w, height: -l1)
            subRightView.frame = CGRect(x: m, y: y, width: w, height: -l2)
        }
    }

    private func returnVal() {
        if let val = presenter?.stateModel.newVal {
            textField.text = presenter?.getText(val)
            isHiddenRV = false
        }
    }


    private func addSubview(parent view: UIView, rect: CGRect) -> UIView {
        let tag = 13131313

        if let subview = view.viewWithTag(tag) {
            return subview
        }

        let subview = UIView()
        subview.backgroundColor = .white
        subview.frame = rect
        subview.tag = tag

        view.addSubview(subview)
        return subview
    }
}
