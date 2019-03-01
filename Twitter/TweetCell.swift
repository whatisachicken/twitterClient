//
//  TweetCell.swift
//  Twitter
//
//  Created by JONATHAN CARRERA on 2/14/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1

    //Called when favorite is clicked
    @IBAction func favoriteTweet(_ sender: Any) {
        let notFavorited = !favorited
        if(notFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success:{
                self.setFavorite(true)
                },
                failure: { (error) in print("Error - couldn't post favorite\(error)")
            })
            }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success:{
                self.setFavorite(false)
            },
                failure: { (error) in print("Error - couldn't delete favorite\(error)")
            })
        }
    }
    func setRetweeeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    //Called when retweet is clicked
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setRetweeeted(true)
        }, failure: {
            (error) in
            print("Error in retweeting \(error)")
        })
    }
    
    //Function to set the image of a button
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited) {
            favoriteButton.setImage(UIImage(named:"fav-icon-red"), for:UIControl.State.normal)
        }
        else {
            favoriteButton.setImage(UIImage(named:"fav-icon"), for:UIControl.State.normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
