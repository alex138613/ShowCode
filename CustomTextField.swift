//
//  CustomTextField.swift
//  Convertor
//
//  Created by Alex on 17.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import UIKit


final class CustomTextField: UITextField {

    private var insets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)

    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "minus"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        button.addTarget(self, action: #selector(refresh), for: .touchUpInside)
        return button
    }()




    required init?(coder: NSCoder) {
        super.init(coder: coder)

        layer.cornerRadius = 13.0
        borderStyle = .none
        textColor = .white
        font = .systemFont(ofSize: 50)
        placeholder = "0,0"

        tintColor = .white

        keyboardType = .decimalPad

        rightView = button
        rightViewMode = .never
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        changeRightInsets()
        return bounds.inset(by: insets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        changeRightInsets()
        return bounds.inset(by: insets)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        changeRightInsets()
        return bounds.inset(by: insets)
    }
}


extension CustomTextField {

    private func changeRightInsets() {
        insets.right = rightViewMode == .always ? 50 : 13
    }

    @objc private func refresh() {
        guard var text = text else { return }

        if !text.contains("-") {
            self.text = String(format: "-%@", text)
        } else {
            text.removeFirst()
            self.text = text
        }
    }
}
