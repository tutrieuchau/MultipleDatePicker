//
//  MonthCalendarBodyCollectionViewCell.swift
//  SGADatePicker
//
//  Created by Tam on 6/13/19.
//  Copyright © 2019 SaiGonApps Team. All rights reserved.
//

import UIKit

class MonthCalendarBodyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var leftBG: UIView!
    @IBOutlet weak var rightBG: UIView!
    @IBOutlet weak var border: SGAUIView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var ratio: NSLayoutConstraint!{
        didSet{
            self.layoutIfNeeded()
        }
    }
    let kCONTENT_XIB_NAME = "MonthCalendarBodyCollectionViewCell"
    var type: MonthCalendarBodyCellType = .Normal {
        didSet{
            switch type {
            case .Normal:
                rightBG.backgroundColor = UIColor.white
                leftBG.backgroundColor = UIColor.white
                border.backgroundColor = UIColor.white
                border.borderColor = UIColor.white
                date.textColor = UIColor.black
                date.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
                break
            case .NormalNotOfTargetMonth:
                rightBG.backgroundColor = UIColor.white
                leftBG.backgroundColor = UIColor.white
                border.backgroundColor = UIColor.white
                border.borderColor = UIColor.white
                date.textColor = UNFORCUS_COLOR
                date.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
                break
            case .Selected:
                rightBG.backgroundColor = SELECTED_COLOR
                leftBG.backgroundColor = SELECTED_COLOR
                border.backgroundColor = SELECTED_COLOR
                border.borderColor = SELECTED_COLOR
                date.textColor = UIColor.black
                date.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
                break
            case .FirstSelected:
                rightBG.backgroundColor = UIColor.white
                leftBG.backgroundColor = UIColor.white
                border.borderColor = HIGHTLIGHT_COLOR
                border.backgroundColor = SELECTED_COLOR
                date.textColor = HIGHTLIGHT_COLOR
                date.font = UIFont.boldSystemFont(ofSize: 15)
                break
            case .FirstDate:
                rightBG.backgroundColor = SELECTED_COLOR
                leftBG.backgroundColor = UIColor.white
                border.borderColor = HIGHTLIGHT_COLOR
                border.backgroundColor = SELECTED_COLOR
                date.textColor = HIGHTLIGHT_COLOR
                date.font = UIFont.boldSystemFont(ofSize: 15)
                break
            case .LastDate:
                leftBG.backgroundColor = SELECTED_COLOR
                rightBG.backgroundColor = UIColor.white
                border.borderColor = HIGHTLIGHT_COLOR
                border.backgroundColor = SELECTED_COLOR
                date.textColor = HIGHTLIGHT_COLOR
                date.font = UIFont.boldSystemFont(ofSize: 15)
                break
            }
        }
    }
    let SELECTED_COLOR = UIColor(red: 215/255, green: 238/255, blue: 211/255, alpha: 1)
    let HIGHTLIGHT_COLOR = UIColor(red: 19/255, green: 78/255, blue: 9/255, alpha: 1)
    let UNFORCUS_COLOR = UIColor(red: 186/255, green: 186/255, blue: 186/255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
class MonthCalendarBodyItem : NSObject{
    var date : Date
    init(mDate: Date) {
        date = mDate
    }
}
enum MonthCalendarBodyCellType {
    case Normal
    case NormalNotOfTargetMonth
    case Selected
    case FirstSelected
    case FirstDate
    case LastDate
}
