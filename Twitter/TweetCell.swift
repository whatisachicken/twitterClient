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
    //Called when favorite is clicked
    @IBAction func favoriteTweet(_ sender: Any) {
        
    }
    //Called when retweet is clicked
    @IBAction func retweet(_ sender: Any) {
        
    }
    var favorited:Bool = false
    //Function to set the image of a button
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited) {
            favoriteButton.setImage(UIImage(named:"fav-icon-red"), for:UIControl.State.normal)
        }
        else {
            favoriteButton.setImage(UIImage(named:"fav-icon"), for:UIControl.State.normal)        }
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
