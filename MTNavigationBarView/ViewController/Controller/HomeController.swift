//
//  HomeController.swift
//  MTNavigationBarView
//
//  Created by pham.minh.tien on 9/21/18.
//  Copyright © 2018 pham.minh.tien. All rights reserved.
//

import UIKit

class HomeController: SearchController {
    override func fetchData() {
        self._targetTableView?.alpha = 0.0
        UIView.animate(withDuration: 0.25, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self._targetTableView?.alpha = 1.0
        }) { (finish) in
            self.updateWithListItem([Quotations(0).getListQuotations()] as [AnyObject])
        }
    }
}
