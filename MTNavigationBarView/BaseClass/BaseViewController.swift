//
//  BaseViewController.swift
//  BaseProjectSwift
//
//  Created by Minh Tien on 4/9/16.
//  Copyright © 2016 MTLABSWIFT. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    var nibName_: String?
    var myNavigationBar: NavigationBarView?

    class func initUsingStoryboard(storyboardName storyName: String, withIndetifier indentifier:String ) -> UIViewController{
        let storyboard = UIStoryboard(name: storyName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: indentifier)
    }
    
    class func initUsingStoryboard(storyboardName storyboardname: String) -> UIViewController{
        let  storyboard = UIStoryboard(name: storyboardname, bundle: nil)
        let indentyfier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: indentyfier)
    }
    
    convenience init(usingNib _nibName:String) {
        self.init(nibName:_nibName, bundle: nil)
    }

    class func newViewController() -> UIViewController{
        let  storyboard = UIStoryboard(name: "Main", bundle: nil)
        let indentyfier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: indentyfier)
    }
    
    class func nibName() -> String{
        return String(describing: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 7.0, *), self.navigationController != nil {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            if self.navigationController?.viewControllers.count == 1 {
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            }else {
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            }
        }
    }
    
    override public var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Navigation Bar
    func initNaviBar(onView owner:UIViewController?, withTitle title: String?) {
        if myNavigationBar == nil {
            myNavigationBar = NavigationBarView.instanceFromNib(CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: MyAppLication.navigationBarHeight))
            self.view.addSubview(myNavigationBar!)
            myNavigationBar?.delegate = owner as? NavigationHandle
        }
        myNavigationBar?.updateTitle(title)
        myNavigationBar?.navigationBarType = .standard
        
    }
    
    func initNaviBarSearch(onView owner:UIViewController?, withTitle title:String?) {
        if myNavigationBar == nil {
            myNavigationBar = NavigationBarView.instanceFromSearchNib(CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: MyAppLication.navigationBarHeight))
            self.view.addSubview(myNavigationBar!)
            myNavigationBar?.delegate = owner as? NavigationHandle
        }
        myNavigationBar?.updateTitle(title)
        myNavigationBar?.navigationBarType = .naviSearchBar
    }
    
    func initNaviBarSearchButton(onView owner:UIViewController?, withTitle title:String?) {
        if myNavigationBar == nil {
            myNavigationBar = NavigationBarView.instanceFromSearchNib(CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: MyAppLication.navigationBarHeight))
            self.view.addSubview(myNavigationBar!)
            myNavigationBar?.delegate = owner as? NavigationHandle
        }
        myNavigationBar?.updateTitle(title)
        myNavigationBar?.navigationBarType = .naviSearchButton
    }
    
    func initNavigationForListBookLibrary(onView owner:UIViewController?, withTitle title:String?) {
        if myNavigationBar == nil {
            myNavigationBar = NavigationBarView.instanceFromLibraryBooksNib(CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: MyAppLication.navigationBarHeight))
            self.view.addSubview(myNavigationBar!)
            myNavigationBar?.delegate = owner as? NavigationHandle
        }
        myNavigationBar?.updateTitle(title)
        myNavigationBar?.navigationBarType = .libraryBooks
    }
}

extension BaseViewController {
    func trackViewController(_ name: String) { }
    func trackEvent(_ name: String, withEvent event:String) {}
}

