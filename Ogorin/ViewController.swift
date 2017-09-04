//
//  ViewController.swift
//  Ogorin
//
//  Created by Rei Yamaguchi on 2017/09/02.
//  Copyright © 2017年 Rei.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginView: UIImageView!
    @IBOutlet var pageControll: UIPageControl!


    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.image = UIImage(named: "login_view0.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeView(_ sender: Any) {
        loginView.image = UIImage(named: "login_view" + "\((sender as AnyObject).currentPage)" + ".png")
        // デバック
        print("login_view" + "\((sender as AnyObject).currentPage!)" + ".png")
    }
    
}

