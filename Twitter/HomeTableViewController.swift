//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by JONATHAN CARRERA on 2/14/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var tweetArray = [NSDictionary]()
    var numOfTweets : Int!
    let myRefreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweets()
        myRefreshControl.addTarget(self, action: #selector(loadTweets), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
    }
    //Function to load tweets on first load
    @objc func loadTweets(){
        numOfTweets = 20
        let requestURL = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": numOfTweets]
        TwitterAPICaller.client?.getDictionariesRequest(url: requestURL, parameters: myParams, success:
            { (tweets: [NSDictionary]) in
            self.tweetArray.removeAll()
            for tweet in tweets {
                self.tweetArray.append(tweet)
        }
            self.tableView.reloadData()
            self.myRefreshControl.endRefreshing()
        }, failure: {(Error) in
            print("Couldn't find tweets")
        })
    }
    func loadMoreTweets(){
        let requestURL = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": numOfTweets]
        numOfTweets = numOfTweets + 20
        TwitterAPICaller.client?.getDictionariesRequest(url: requestURL, parameters: myParams, success:
            { (tweets: [NSDictionary]) in
            self.tweetArray.removeAll()
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            self.tableView.reloadData()
            self.myRefreshControl.endRefreshing()
        }, failure: {(Error) in
            print("Couldn't find tweets")
        })
    }
    //Function to call loadMoreTweets when a condition is met
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        //If current row displayed is more than the available tweets in tweetArray
        if indexPath.row + 1 == tweetArray.count{
            //Invoke function
            loadMoreTweets()
        }
    }
    //Function to call when logout is clicked
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        //Set userdefaults to false
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    //Function that creates a cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set cell type
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCell
        //Get dictionary user
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        //Assign text to labels with keys
        cell.userNameLabel.text = user["name"] as? String
        cell.tweetLabel.text = tweetArray[indexPath.row]["text"] as? String
        //Get image data
        let imageURL = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageURL!)
        if let imageData = data {
            cell.userProfileImage.image = UIImage(data: imageData)
        }
        //Return cell
        return cell
    }
    //Function to return number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //Function to return number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }


    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
