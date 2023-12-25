//
//  ResultView.swift
//  Convertor
//
//  Created by Alex on 11.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import UIKit


final class ResultView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftDescriptionLabel: UILabel!
    @IBOutlet weak var rightDescriptionLabel: UILabel!
    @IBOutlet weak var leftValLabel: UILabel!
    @IBOutlet weak var rightValLabel: UILabel!

    @IBOutlet weak var constrLeftViewW: NSLayoutConstraint!
    @IBOutlet weak var constrRightViewW: NSLayoutConstraint!




    class func instanceFromNib() -> UIView {
        let xib = UINib(nibName: "Result", bundle: nil) //Bundle.main)
        return xib.instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
