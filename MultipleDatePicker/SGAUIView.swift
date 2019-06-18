//
//  SGAUIView.swift
//  SGADatePicker
//
//  Created by Tam on 6/13/19.
//  Copyright © 2019 SaiGonApps Team. All rights reserved.
//

import UIKit

@IBDesignable
class SGAUIView: UIView {

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
    
    // top-right-bottom-left
    @IBInspectable var edgeCornerRadius: String = "0-0-0-0"{
        didSet{
            let stringArr = edgeCornerRadius.split(separator: "-")
            self.layer.addBorder(edge: .top, color: self.borderColor, thickness: CGFloat(Int(stringArr[0])!))
            self.layer.addBorder(edge: .top, color: self.borderColor, thickness: CGFloat(Int(stringArr[1])!))
            self.layer.addBorder(edge: .top, color: self.borderColor, thickness: CGFloat(Int(stringArr[2])!))
            self.layer.addBorder(edge: .top, color: self.borderColor, thickness: CGFloat(Int(stringArr[3])!))
            self.layoutIfNeeded()
        }
    }
    
}

