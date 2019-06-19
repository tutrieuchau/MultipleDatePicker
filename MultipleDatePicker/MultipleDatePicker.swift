//
//  MultipleDatePicker.swift
//  SGADatePicker
//
//  Created by Tam on 6/15/19.
//  Copyright © 2019 SaiGonApps Team. All rights reserved.
//

import UIKit

public class MultipleDatePicker: UIView {
    
    @IBOutlet var contentView: UIView!
    

    @IBOutlet weak var dateFromTo: UILabel!
    @IBOutlet weak var currentMonth: UILabel!
    
    @IBOutlet weak var datePickerWrapper: UIView!
    @IBOutlet weak var monthPickerWrapper: UIView!
    @IBOutlet weak var yearPickerWrapper: UIView!
    
    @IBOutlet weak var datePickerCalendarHead: UICollectionView!
    @IBOutlet weak var datePickerCalendarBody: UICollectionView!
    @IBOutlet weak var monthPickerCalendar: UICollectionView!
    @IBOutlet weak var yearPickerCalendar: UICollectionView!
    
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //Header Control
    @IBAction func onNext(_ sender: Any) {
        print(targetDate)
        targetDate = targetDate.nextMonth()
        print(targetDate)
        reloadCalendar()
        refreshDataOfCalendar()
    }
    
    @IBAction func onDoubleNext(_ sender: Any) {
        print(targetDate)
//        targetDate = targetDate.nextYear()
        print(targetDate)
        reloadCalendar()
        refreshDataOfCalendar()
    }
    
    @IBAction func onPrev(_ sender: Any) {
        targetDate = targetDate.lastMonth()
         reloadCalendar()
        refreshDataOfCalendar()
    }
    
    @IBAction func onDoublePrev(_ sender: Any) {
//        targetDate = targetDate.lastYear()
        reloadCalendar()
        refreshDataOfCalendar()
    }
    //
    
    @IBOutlet weak var checkBoxYearPicker: SGAUIButton!
    @IBAction func onSelectYearPicker(_ sender: Any) {
        pickerMode = .YearPicker
    }
    
    
    @IBOutlet weak var checkBoxMonthPicker: SGAUIButton!
    @IBAction func onSelectMonthPicker(_ sender: Any) {
        pickerMode = .MonthPicker
    }
    
    
    
    @IBOutlet weak var checkBoxDatePicker: SGAUIButton!
    @IBAction func onSelectDatePicker(_ sender: Any) {
        pickerMode = .DatePicker
    }
    
    @IBAction func onDone(_ sender: Any) {
        delegate?.onSelected(start: firstDate, end: lastDate)
    }
    
    
    
    let dayStrings: [String] = ["Su", "Mo", "Tu", "We", "Th" , "Fr", "Sa"]
    var datePickerCalendarBodyItems:[[Date]] = []
    var monthPickerCalendarItems:[[Date]] = []
    var yearPickerCalendarItems:[[Date]] = []
    
    var targetDate = Date()
    var firstDate : Date? = nil
    var lastDate: Date? = nil
    var calendarAlert = CalendarAlert(frame: CGRect.zero)
    var lastIndexPath = IndexPath(row: -1, section: -1)
    let CONTENT_XIB_NAME = "MultipleDatePicker"
    
    var pickerMode : MultipleDatePickerMode = .MonthPicker {
        didSet{
            let bundle = Bundle(for: self.classForCoder)
            let imageBundle = Bundle(url: bundle.url(forResource: "MultipleDatePickerImages", withExtension: "bundle")!)
            let imgChecked = UIImage(named: "date_picker_checked", in: imageBundle, compatibleWith: nil)
            switch pickerMode {
            case .DatePicker:
                datePickerWrapper.isHidden = false
                monthPickerWrapper.isHidden = true
                yearPickerWrapper.isHidden = true
                prevButton.isHidden = false
                nextButton.isHidden = false
                
                checkBoxDatePicker.setImage(imgChecked, for: UIControl.State.normal)
                checkBoxMonthPicker.setImage(nil, for: UIControl.State.normal)
                checkBoxYearPicker.setImage(nil, for: UIControl.State.normal)
                break
            case .MonthPicker:
                datePickerWrapper.isHidden = true
                monthPickerWrapper.isHidden = false
                yearPickerWrapper.isHidden = true
                prevButton.isHidden = true
                nextButton.isHidden = true
                
                checkBoxDatePicker.setImage(nil, for: UIControl.State.normal)
                checkBoxMonthPicker.setImage(imgChecked, for: UIControl.State.normal)
                checkBoxYearPicker.setImage(nil, for: UIControl.State.normal)
                break
            case .YearPicker:
                datePickerWrapper.isHidden = true
                monthPickerWrapper.isHidden = true
                yearPickerWrapper.isHidden = false
                prevButton.isHidden = true
                nextButton.isHidden = true
                
                checkBoxDatePicker.setImage(nil, for: UIControl.State.normal)
                checkBoxMonthPicker.setImage(nil, for: UIControl.State.normal)
                checkBoxYearPicker.setImage(imgChecked, for: UIControl.State.normal)
                break
                
            }
            reloadCalendar()
            firstDate = nil
            lastDate = nil
            lastIndexPath = IndexPath(row: -1, section: -1)
            calendarAlert.removeFromSuperview()
        }
    }
    
    
    public var delegate : MultipleDatePickerDelegate?

    override public func draw(_ rect: CGRect) {
        initalCalendar()
        pickerMode = .DatePicker
        drawTarget()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        let bundle = Bundle(for: self.classForCoder)
        bundle.loadNibNamed(CONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func initalCalendar(){
        
        let bundle = Bundle(for: self.classForCoder)
        datePickerCalendarHead.register(UINib(nibName: "MonthCalendarHeadCollectionViewCell", bundle: bundle), forCellWithReuseIdentifier: "monthCalendarHeadCell")
        datePickerCalendarHead.delegate = self
        datePickerCalendarHead.dataSource = self
        
        datePickerCalendarBodyItems = createDateList(date: targetDate)
        datePickerCalendarBody.register(UINib(nibName: "MonthCalendarBodyCollectionViewCell", bundle: bundle), forCellWithReuseIdentifier: "monthCalendarBodyCell")
        datePickerCalendarBody.delegate = self
        datePickerCalendarBody.dataSource = self
        
        monthPickerCalendarItems = createMonthList(date: targetDate)
        monthPickerCalendar.register(UINib(nibName: "MonthCalendarBodyCollectionViewCell", bundle: bundle), forCellWithReuseIdentifier: "monthCalendarBodyCell")
        monthPickerCalendar.delegate = self
        monthPickerCalendar.dataSource = self
        
        yearPickerCalendarItems = createYearList(date: targetDate)
        yearPickerCalendar.register(UINib(nibName: "MonthCalendarBodyCollectionViewCell", bundle: bundle), forCellWithReuseIdentifier: "monthCalendarBodyCell")
        yearPickerCalendar.delegate = self
        yearPickerCalendar.dataSource = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(toSelectCells:)))
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)
    }
    
    func refreshDataOfCalendar(){
        switch pickerMode {
        case .DatePicker:
            datePickerCalendarBodyItems = createDateList(date: targetDate)
            break
        case .MonthPicker:
            monthPickerCalendarItems = createMonthList(date: targetDate)
            break
        case .YearPicker:
            yearPickerCalendarItems = createYearList(date: targetDate)
            break
            
        }
    }
    
    func createDateList(date: Date) -> [[Date]]{
        var dates:[Date] = []
        let firstDateOfThisMonth = date.startOfMonth()
        let numberDaysOfLastMonthOnCalendar = firstDateOfThisMonth.dayNumberOfWeek()! - 1//1234567 31-7
        var startDate = firstDateOfThisMonth.daysAgo(offset: numberDaysOfLastMonthOnCalendar)
        while (dates.count <= 42){
            dates.append(startDate)
            startDate = startDate.daysLater(offset: 1)
        }
        return dates.chunked(into: 7)
    }
    
    func createMonthList(date: Date) -> [[Date]]{
        var dates:[Date] = []
        var startMonth = targetDate.firstDateOfYear()
        while dates.count <= 12 {
            dates.append(startMonth)
            startMonth = startMonth.nextMonth()
        }
        return dates.chunked(into: 3)
    }
    
    func createYearList(date: Date)-> [[Date]]{
        var years:[Date] = []
        var startYear = date.nextYear()
        while years.count <= 12 {
            years.append(startYear)
            startYear = startYear.lastYear()
        }
        years = years.sorted(by: {$0 < $1})
        return years.chunked(into: 4)
    }
    
    func drawTarget(){
        let dateFormatterPrint = DateFormatter()
        switch pickerMode {
        case .DatePicker:
            dateFormatterPrint.dateFormat = "LLLL yyyy"
            currentMonth.text = dateFormatterPrint.string(from: targetDate)
            var str = ""
            if firstDate != nil {
                str = firstDate!.getShortMonthDateString()
            }
            if lastDate != nil {
                str = str + " - " + lastDate!.getShortMonthDateString()
            }
            dateFromTo.text = str
            break
        case .MonthPicker:
            dateFormatterPrint.dateFormat = "yyyy"
            currentMonth.text = dateFormatterPrint.string(from: targetDate)
            var str = ""
            if firstDate != nil {
                str = firstDate!.getShortMonthString()
            }
            if lastDate != nil {
                str = str + " - " + lastDate!.getShortMonthString()
            }
            dateFromTo.text = str
             break
        case .YearPicker:
            if yearPickerCalendarItems.count == 4 {
                currentMonth.text = yearPickerCalendarItems[0][0].getYearString() + " - " + yearPickerCalendarItems[2][3].getYearString()
            }
            var str = ""
            if firstDate != nil {
                str = firstDate!.getYearString()
            }
            if lastDate != nil {
                str = str + " - " + lastDate!.getYearString()
            }
            dateFromTo.text = str
            break
        }
        
    }
    
    @IBAction func nextMonth(_ sender: Any) {
        targetDate = targetDate.nextMonth()
        reloadCalendar()
    }
    
    @IBAction func nextYear(_ sender: Any) {
        targetDate = targetDate.nextYear()
        reloadCalendar()
    }
    
    @IBAction func prevMonth(_ sender: Any) {
        targetDate = targetDate.lastMonth()
        reloadCalendar()
    }
    @IBAction func prevYear(_ sender: Any) {
        targetDate = targetDate.lastYear()
        reloadCalendar()
    }
}

extension MultipleDatePicker : UIGestureRecognizerDelegate{
    @objc func didPan(toSelectCells panGesture: UIPanGestureRecognizer){
        if panGesture.state == .changed {
            if pickerMode == .DatePicker {
                let location: CGPoint = panGesture.location(in: datePickerCalendarBody)
                if let indexPath: IndexPath = datePickerCalendarBody.indexPathForItem(at: location) {
                    if indexPath == lastIndexPath {
                        return
                    }
                    lastIndexPath = indexPath
                    if firstDate == nil {
                        firstDate = datePickerCalendarBodyItems[indexPath.section][indexPath.row]
                        dateFromTo.text = firstDate?.getShortMonthDateString()
                    }else {
                        lastDate = datePickerCalendarBodyItems[indexPath.section][indexPath.row]
                        if lastDate! < firstDate! {
                            let tmp = firstDate
                            firstDate = lastDate
                            lastDate = tmp
                        }
                        dateFromTo.text = firstDate!.getShortMonthDateString() + " - " + lastDate!.getShortMonthDateString()
                    }
                    reloadCalendar()
                }
            }else if pickerMode == .MonthPicker {
                let location: CGPoint = panGesture.location(in: monthPickerCalendar)
                if let indexPath: IndexPath = monthPickerCalendar.indexPathForItem(at: location) {
                    if indexPath == lastIndexPath {
                        return
                    }
                    lastIndexPath = indexPath
                    if firstDate == nil {
                        firstDate = monthPickerCalendarItems[indexPath.section][indexPath.row]
                        dateFromTo.text = firstDate?.getShortMonthDateString()
                    }else {
                        lastDate = monthPickerCalendarItems[indexPath.section][indexPath.row]
                        if lastDate! < firstDate! {
                            let tmp = firstDate
                            firstDate = lastDate
                            lastDate = tmp
                        }
                        dateFromTo.text = firstDate!.getShortMonthString() + " - " + lastDate!.getShortMonthString()
                    }
                    reloadCalendar()
                }
            }else if pickerMode == .YearPicker{
                let location: CGPoint = panGesture.location(in: yearPickerCalendar)
                if let indexPath: IndexPath = yearPickerCalendar.indexPathForItem(at: location) {
                    if indexPath == lastIndexPath {
                        return
                    }
                    lastIndexPath = indexPath
                    if firstDate == nil {
                        firstDate = yearPickerCalendarItems[indexPath.section][indexPath.row]
                        dateFromTo.text = firstDate?.getShortMonthDateString()
                    }else {
                        lastDate = yearPickerCalendarItems[indexPath.section][indexPath.row]
                        if lastDate! < firstDate! {
                            let tmp = firstDate
                            firstDate = lastDate
                            lastDate = tmp
                        }
                        dateFromTo.text = firstDate!.getShortMonthString() + " - " + lastDate!.getShortMonthString()
                    }
                    reloadCalendar()
                }
            }
            
        }else if panGesture.state == .ended {
            if pickerMode == .DatePicker {
                calendarAlert.removeFromSuperview()
                // make sure select
                let cell = datePickerCalendarBody.cellForItem(at: lastIndexPath)
                if cell != nil {
                    var point = cell!.frame.origin
                    point.y = point.y + 26
                    point.x = point.x - 32
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideCalendarAlert))
                    calendarAlert.addGestureRecognizer(tapGesture)
                    calendarAlert.dateFromTo.text = self.dateFromTo.text
                    calendarAlert.frame = CGRect(origin: point, size: CGSize(width: 110, height: 55))
                    self.contentView.addSubview(calendarAlert)
                    self.bringSubviewToFront(calendarAlert)
                }
            }else if pickerMode == .MonthPicker {
                calendarAlert.removeFromSuperview()
                // make sure select
                let cell = monthPickerCalendar.cellForItem(at: lastIndexPath)
                if cell != nil {
                    var point = cell!.frame.origin
                    point.x = point.x - 3
                    point.y = point.y - 5 // cell height*2 + section space * 2 + ofset
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideCalendarAlert))
                    calendarAlert.addGestureRecognizer(tapGesture)
                    calendarAlert.dateFromTo.text = self.dateFromTo.text
                    calendarAlert.frame = CGRect(origin: point, size: CGSize(width: 110, height: 55))
                    self.contentView.addSubview(calendarAlert)
                    self.bringSubviewToFront(calendarAlert)
                }
            }else if pickerMode == .YearPicker {
                calendarAlert.removeFromSuperview()
                // make sure select
                let cell = yearPickerCalendar.cellForItem(at: lastIndexPath)
                if cell != nil {
                    var point = cell!.frame.origin
                    point.x = point.x - 15
                    point.y = point.y - 5 // cell height*2 + section space * 2 + ofset
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideCalendarAlert))
                    calendarAlert.addGestureRecognizer(tapGesture)
                    calendarAlert.dateFromTo.text = self.dateFromTo.text
                    calendarAlert.frame = CGRect(origin: point, size: CGSize(width: 110, height: 55))
                    self.contentView.addSubview(calendarAlert)
                    self.bringSubviewToFront(calendarAlert)
                }
            }
           
            
        }
        
    }
    
    @objc func hideCalendarAlert(){
        calendarAlert.removeFromSuperview()
    }
    
}

extension MultipleDatePicker: UICollectionViewDelegate, UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == datePickerCalendarBody || collectionView == datePickerCalendarHead {
            return 7
        }else if collectionView == monthPickerCalendar {
            return 3
        }else if collectionView == yearPickerCalendar {
            return 4
        }
        return 0
    }
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == datePickerCalendarHead {
            return 1
        } else if collectionView == datePickerCalendarBody {
            return 6
        }else if collectionView == monthPickerCalendar {
            return 4
        }else if collectionView == yearPickerCalendar {
            return 3
        }
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == datePickerCalendarHead {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthCalendarHeadCell", for: indexPath) as! MonthCalendarHeadCollectionViewCell
            cell.day.text = dayStrings[indexPath.row]
            return cell
            
        }else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthCalendarBodyCell", for: indexPath) as! MonthCalendarBodyCollectionViewCell
            var item = targetDate
            if collectionView == datePickerCalendarBody {
                item = datePickerCalendarBodyItems[indexPath.section][indexPath.row]
                cell.date.text = item.getDateString()
                if item.getMonthString() == targetDate.getMonthString() {
                    cell.type = .Normal
                }else {
                    cell.type = .NormalNotOfTargetMonth
                }
            }else if collectionView == monthPickerCalendar {
                item = monthPickerCalendarItems[indexPath.section][indexPath.row]
                cell.ratio.constant = CGFloat(20)
                cell.date.text = item.getShortMonthString()
                cell.type = .Normal
            }else {
                item = yearPickerCalendarItems[indexPath.section][indexPath.row]
                cell.ratio.constant = CGFloat(30)
                cell.date.text = item.getYearString()
                cell.type = .Normal
            }
            //draw selected
            if item == firstDate{
                cell.type = lastDate == nil ? .FirstSelected : .FirstDate
            }else if item == lastDate {
                cell.type = .LastDate
            }else if (firstDate != nil && lastDate != nil) && firstDate! < item && item < lastDate! {
                cell.type = .Selected
            }
            
            return cell
            
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == datePickerCalendarBody
        || collectionView == monthPickerCalendar
        || collectionView == yearPickerCalendar{
            if firstDate == nil {
                switch collectionView {
                case datePickerCalendarBody:
                    firstDate = datePickerCalendarBodyItems[indexPath.section][indexPath.row]
                    break
                case monthPickerCalendar:
                    firstDate = monthPickerCalendarItems[indexPath.section][indexPath.row]
                    break
                case yearPickerCalendar:
                    firstDate = yearPickerCalendarItems[indexPath.section][indexPath.row]
                    break
                default :
                    break
                }
                 reloadCalendar()
            }else {
                switch collectionView {
                    case datePickerCalendarBody:
                         lastDate = datePickerCalendarBodyItems[indexPath.section][indexPath.row]
                        break
                    case monthPickerCalendar:
                        lastDate = monthPickerCalendarItems[indexPath.section][indexPath.row]
                        break
                    case yearPickerCalendar:
                        lastDate = yearPickerCalendarItems[indexPath.section][indexPath.row]
                        break
                    default:
                        break
                }
               
                // double select in one item will clean selected
                if firstDate == lastDate {
                    firstDate = nil
                    lastDate = nil
                    dateFromTo.text = ""
                }else if lastDate! < firstDate! {
                    let tmp = firstDate
                    firstDate = lastDate
                    lastDate = tmp
                    dateFromTo.text = firstDate!.getShortMonthDateString() + " - " + lastDate!.getShortMonthDateString()
                }
                reloadCalendar()
                
            }
        }
    }

    func reloadCalendar(){
        if pickerMode == .DatePicker {
            datePickerCalendarBody.reloadData()
        }else if pickerMode == .MonthPicker {
            monthPickerCalendar.reloadData()
        }else if pickerMode == .YearPicker {
            yearPickerCalendar.reloadData()
        }
         drawTarget()
    }
    
}

enum MultipleDatePickerMode{
    case DatePicker
    case MonthPicker
    case YearPicker
}

