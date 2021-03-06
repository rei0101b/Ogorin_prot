//
//  TabBarController.swift
//  Ogorin
//
//  Created by Rei Yamaguchi on 2017/09/05.
//  Copyright © 2017年 Rei.inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font:UIFont! = UIFont(name:"HelveticaNeue-Bold",size:10)
        let selectedAttributes:NSDictionary! = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor(red:0.31, green:0.89, blue:0.76, alpha:1.0)]
        
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes as? [String : Any], for: UIControlState.selected)
        
        UITabBar.appearance().tintColor = UIColor(red:0.31, green:0.89, blue:0.76, alpha:1.0)


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // currentUserがnilならログインしていない
        if Auth.auth().currentUser == nil {
            // ログインしていないときの処理
            DispatchQueue.main.async {
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(loginViewController!, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
