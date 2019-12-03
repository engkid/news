//
//  NewsTableViewCell.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 03/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var newsImage: UIImageView?
	@IBOutlet weak var newsTitle: UILabel?
	@IBOutlet weak var newsSource: UILabel?
	
	override func awakeFromNib() {
        super.awakeFromNib()
	}
	
	func configureArticle(article: Articles) {
		
		self.newsTitle?.text = article.title
		self.newsSource?.text = article.source.name
		
		self.newsSource?.textColor = UIColor.red
		self.newsImage?.contentMode = .scaleToFill
		
		guard let url = URL(string: article.urlToImage ?? "") else {
			return
		}
		
		self.newsImage?.sd_setImage(with: url, placeholderImage: UIImage(named: "newsSplash"), options: .retryFailed, context: nil)
	}
    
}
