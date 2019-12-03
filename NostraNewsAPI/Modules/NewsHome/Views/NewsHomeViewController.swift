//
//  NewsHomeViewController.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 29/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class NewsHomeViewController: UIViewController {
	
	enum newsTableSection: CaseIterable {
		case news
	}

	@IBOutlet weak var newsTable: UITableView?
	// TODO: - View setup here
	
	var viewModel: NewsHomeViewModel?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = viewModel?.title
		configureNewsObserver()
		configureNewsTable()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		getNews()
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: "NewsHomeViewController", bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Private methods
	private func configureNewsTable() {
		
		newsTable?.delegate = self
		newsTable?.dataSource = self
		newsTable?.estimatedRowHeight = 223
		newsTable?.rowHeight = UITableView.automaticDimension
		newsTable?.separatorStyle = .none
		
		newsTable?.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
		
	}
	
	private func getNews() {
		
		viewModel?.getNews()
		
	}
	
	private func configureNewsObserver() {
		
		viewModel?.newsDidChange = {
			
		}
		
		viewModel?.onReload = { [weak self] in
			
			guard let self = self else {
				return
			}
			
			DispatchQueue.main.async {
				self.newsTable?.reloadData()
			}
		}
		
		viewModel?.onError = { [weak self] (error: Error) in
			
			guard let self = self else {
				return
			}
			
			DispatchQueue.main.async {
				let errorVc: ErrorPageViewController = ErrorPageViewController()
				self.navigationController?.pushViewController(errorVc, animated: true)
			}
			
			
		}
		
	}
	
}

extension NewsHomeViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return newsTableSection.allCases.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		guard let articles = viewModel?.articles else {
			return 0
		}
		
		return articles.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// TODO: - Configure table view cell here
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell, let article = viewModel?.articles[indexPath.row] else {
			return UITableViewCell()
		}
		
		cell.configureArticle(article: article)
		cell.selectionStyle = .none
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 223
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		
		guard let viewModel = viewModel, indexPath.row == viewModel.articles.count - 1, !viewModel.isEndPage else {
			return
		}
		
		getNews()
		
	}
	
}

extension NewsHomeViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		
		
	}
	
}
