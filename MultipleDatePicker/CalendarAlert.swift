//
//  CalendarAlert.swift
//  SGADatePicker
//
//  Created by Tam on 6/15/19.
//  Copyright © 2019 SaiGonApps Team. All rights reserved.
//

import UIKit

class CalendarAlert: UIView {

    let kCONTENT_XIB_NAME = "CalendarAlert"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var dateFromTo: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func calculatePosition(point: CGPoint)-> CGPoint{
        return CGPoint(x: point.x - self.frame.width/2, y: point.y - self.frame.height)
    }
    
    func commonInit(){
        let bundle = Bundle(for: self.classForCoder)
        bundle.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
}
