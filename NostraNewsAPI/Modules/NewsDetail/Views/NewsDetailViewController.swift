//
//  NewsDetailViewController.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 03/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

	@IBOutlet weak var descriptionLabel: UILabel?
	@IBOutlet weak var newsImage: UIImageView?
	
	var viewModel: NewsDetailViewModel?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		configureView()
    }
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: "NewsDetailViewController", bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Private methods
	private func configureView() {
		
		self.descriptionLabel?.text = viewModel?.description
		
		guard let viewModel = viewModel, let url = URL(string: viewModel.imageUrl ?? "") else {
			return
		}
		
		self.newsImage?.sd_setImage(with: url, placeholderImage: UIImage(named: "newsSplash"), options: .retryFailed, context: nil)
		
	}
	
}
