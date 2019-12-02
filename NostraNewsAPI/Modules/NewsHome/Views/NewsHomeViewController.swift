//
//  NewsHomeViewController.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 29/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class NewsHomeViewController: UIViewController {

	// TODO: - View setup here
	
	var viewModel: NewsHomeViewModel?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = viewModel?.title
		viewModel?.getNews()
		configureNewsObserver()
    }
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: "NewsHomeViewController", bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureNewsObserver() {
		
		viewModel?.newsDidChange = { [weak self] in
			print("reload table here")
		}
		
	}
	
}
