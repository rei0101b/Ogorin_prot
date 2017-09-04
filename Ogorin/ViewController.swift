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
    
    @IBAction func facebookSignIn(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile, .email], viewController: self, completion: {
            result in
            switch result {
            case let .success( permission, declinePemisson, token):
                print("token:\(token),\(permission),\(declinePemisson)")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: token.authenticationToken)
                self.signIn(credential: credential)
            case let .failed(error):
                print("error:\(error)")
            case .cancelled:
                print("cancelled")
            }
            
        })
    }
    
    func signIn(credential:FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            if let error = error {
                print("error:\(error)")
                return
            } else {
                self.performSegue(withIdentifier: "SignedInSegue", sender: nil)
            }
            return
        }
    }
    
}

