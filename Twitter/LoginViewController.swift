//
//  LoginViewController.swift
//  Twitter
//
//  Created by JONATHAN CARRERA on 2/14/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onLoginClick(_ sender: Any) {
        let requestURL = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: requestURL, success: {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: {(Error) in
            print("Couldn't login in!")
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
