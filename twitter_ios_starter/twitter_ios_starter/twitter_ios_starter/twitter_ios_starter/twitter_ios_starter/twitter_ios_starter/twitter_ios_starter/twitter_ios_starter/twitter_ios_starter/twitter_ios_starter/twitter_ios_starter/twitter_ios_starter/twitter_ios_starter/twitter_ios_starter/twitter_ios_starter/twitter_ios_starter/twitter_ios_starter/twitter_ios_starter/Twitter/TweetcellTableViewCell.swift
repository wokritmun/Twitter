//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Favour Movel on 2/20/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileimageview: UIImageView!
    @IBOutlet weak var usernamelabel: UILabel!
    @IBOutlet weak var tweetcontent: UILabel!
    
    @IBOutlet weak var retweetbutton: UIButton!
    
    @IBOutlet weak var favbutton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success:{ self.setFavorite(isFavorited: true)}, failure: { Error in
                print("Favorite did not succeed:\(Error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { Error in
                print("Unfavorite did not succeed:\(Error)")
            })
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(isRetweeted: true)
        }, failure: { Error in
            print("Error retweeting:\(Error)")
        })
    }
    
    func setRetweeted( isRetweeted:Bool){
        if (isRetweeted) {
            retweetbutton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetbutton.isEnabled = false
        } else {
            retweetbutton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetbutton.isEnabled = true
        }
    }
    
    var favorited: Bool = false
    var tweetId: Int = -1
    
    
    func setFavorite( isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favbutton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favbutton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            
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
