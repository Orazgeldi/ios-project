//
//  Animation.swift
//  Calc
//
//  Created by Orazkeldi Zhamalbekov on 31.01.18.
//  Copyright © 2018 Orazkeldi Zhamalbekov. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class DesignableButton: BounceButton {
    
    @IBInspectable var borderWidth: CGFloat = 0.0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
