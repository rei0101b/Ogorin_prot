//
//  ViewController.swift
//  Ogorin
//
//  Created by Rei Yamaguchi on 2017/09/02.
//  Copyright © 2017年 Rei.inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet var loginView: UIImageView!
    @IBOutlet var pageControll: UIPageControl!


    override func viewDidLoad() {
        super.viewDidLoad()
//        loginView.image = UIImage(named: "login_view0.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        // currentUserがnilならログインしていない
//        if Auth.auth().currentUser == nil {
//            // ログインしていないときの処理
//            DispatchQueue.main.async {
//                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
//                self.present(loginViewController!, animated: true, completion: nil)
//            }
//        }
//    }
    @IBAction func startApp(_ sender: Any) {
        // メイン画面へ遷移
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "mainPage") as! UITabBarController
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func changeView(_ sender: Any) {
        loginView.image = UIImage(named: "login_view" + "\((sender as AnyObject).currentPage)" + ".png")
        // デバック
        print("login_view" + "\((sender as AnyObject).currentPage!)" + ".png")
    }
    
    
    @IBAction func handleLogoutButton(_ sender: Any) {
        // ログアウトする
        try! Auth.auth().signOut()
        // ログイン画面を表示する
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.present(loginViewController!, animated: true, completion: nil)
    }
}


