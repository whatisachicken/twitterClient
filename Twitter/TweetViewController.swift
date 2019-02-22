//
//  TweetViewController.swift
//  Twitter
//
//  Created by JONATHAN CARRERA on 2/21/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
    }
    
    //Function invoked when cancel is clicked
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //Function invoked when tweet is clicked
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text,
            success: {
                self.dismiss(animated: true, completion: nil)
            },
            failure: { (error) in
                print("Failed to post a tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
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
