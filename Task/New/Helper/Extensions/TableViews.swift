//
//  TableViews.swift
//  Smartista
//
//  Created by Emad Habib on 7/24/20.
//  Copyright © 2020 Emad Habib. All rights reserved.
//

import Foundation
import UIKit

final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

final class ContentSizedScrollView: UIScrollView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

class SelfSizedTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        let height = min(.infinity, contentSize.height)
        return CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
}

extension UITableViewCell {
    func getDayOfWeek(_ today:String) -> String? {
         let formatter  = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd"
         guard let todayDate = formatter.date(from: today) else { return nil }
         let myCalendar = Calendar(identifier: .gregorian)
         let weekDay = myCalendar.component(.weekday, from: todayDate)
         switch weekDay {
         case 1: return "Sunday"
         case 2: return "Monday"
         case 3: return "Tuesday"
         case 4: return "Wednesday"
         case 5: return "Thursday"
         case 6: return "Friday"
         case 7: return "Saturday"
         default: return ""
         }
     }
}

extension UICollectionViewCell {
    func getDayOfWeek(_ today:String) -> String? {
         let formatter  = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd"
         guard let todayDate = formatter.date(from: today) else { return nil }
         let myCalendar = Calendar(identifier: .gregorian)
         let weekDay = myCalendar.component(.weekday, from: todayDate)
         switch weekDay {
         case 1: return "Sunday"
         case 2: return "Monday"
         case 3: return "Tuesday"
         case 4: return "Wednesday"
         case 5: return "Thursday"
         case 6: return "Friday"
         case 7: return "Saturday"
         default: return ""
         }
     }
}
