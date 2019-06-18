//
//  SGAUIButton.swift
//  SGADatePicker
//
//  Created by Tam on 6/17/19.
//  Copyright © 2019 SaiGonApps Team. All rights reserved.
//

import UIKit

@IBDesignable
class SGAUIButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
