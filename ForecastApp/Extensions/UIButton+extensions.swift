//
//  UIButton+extensions.swift
//  ForecastApp
//
//  Created by Rafsan Nazmul on 11/22/22.
//

import Foundation
import UIKit

extension UIButton {
    func addButtonRadius(_ radius: CGFloat = 15) {
        self.layer.cornerRadius = radius
        
    }
}


@IBDesignable
class DesignableButton: UIButton {

    @IBInspectable private var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setNeedsDisplay()
    }

}
