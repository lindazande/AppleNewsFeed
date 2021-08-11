//
//  NewsTableViewCell.swift
//  AppleNewsFeed
//
//  Created by linda.zande on 09/08/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
