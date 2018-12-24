//
//  ViewController.swift
//  ContainerViewsDemo
//
//  Created by Nayem BJIT on 12/24/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(hideControlViews(_:)), name: Notification.Name(rawValue: "hideControlViews"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func hideControlViews(_ notification: Notification){
        let userInfo = notification.userInfo! as! [String : Bool]
        if (userInfo["hidetop"]!){
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.topView.isHidden = true
            }, completion: nil)
        } else{
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.topView.isHidden = false
            }, completion: nil)
        }

        if (userInfo["hidebottom"]!){
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.bottomView.isHidden = true
            }, completion: nil)
        } else{
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.bottomView.isHidden = false
            }, completion: nil)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "hideControlViews"), object: nil)
    }

}

