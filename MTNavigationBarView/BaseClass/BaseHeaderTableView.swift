//
//  BaseHeaderTableView.swift
//  BaseProject
//
//  Created by  on 6/2/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class BaseHeaderTableView: UITableViewHeaderFooterView {
    
    class func height() -> CGFloat {
        return 50.0
    }
    
    class func heightWithItem(_ data: AnyObject) -> CGFloat {
        return 50.0
    }
    
    class func nib() -> UINib {
        return UINib(nibName:String(describing: self), bundle: Bundle.main)
    }
    class func nibName() -> String {
        return String(describing: self)
    }
    
    func configHeaderWithData(_ data: AnyObject?) {}
    
}
