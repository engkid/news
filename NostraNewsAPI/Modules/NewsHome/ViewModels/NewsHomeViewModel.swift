//
//  NewsHomeViewModel.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 29/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

internal final class NewsHomeViewModel {
	
	private let interactor: NewsHomeInteractor
	private let pageSize: Int = 5
	private var page: Int = 0
	
	var newsDidChange: (() -> Void)?
	var onReload: (() -> Void)?
	var onError: ((Error) -> Void)?
	
	var news: News? {
		
		didSet {
			self.newsDidChange?()
		}
		
	}
	
	var isEndPage: Bool = false
	
	var articles: [Articles] = []
	
	var error: Error? {
		
		didSet {
			
			guard let error = error else {
				return
			}
			
			self.onError?(error)
		}
		
	}
	
	var title: String {
		return "Nostra News"
	}
	
	// TODO: - Business logic here
	init(interactor: NewsHomeInteractor) {
		self.interactor = interactor
	}
	
	func getNews() {
		
		page += 1
		
		interactor.fetchData(pageSize: pageSize, page: page, successBlock: { [weak self] (news: News) in
			
			guard let self = self else {
				return
			}
			
			self.news = news
			
			if news.articles.count > 0 {
				self.articles += news.articles
			} else {
				self.isEndPage = true
			}
			
			self.onReload?()
			
		}) { (error: Error?) in
			
			self.error = error
			
		}
	}
	
}
