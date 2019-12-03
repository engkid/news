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
	
	var newsDidChange: (() -> Void)?
	var onError: ((Error) -> Void)?
	
	var news: News? {
		
		didSet {
			self.newsDidChange?()
		}
		
	}
	
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
		
		interactor.getNews(pageSize: 5, page: 1, successBlock: { [weak self] (news: News) in
			
			guard let self = self else {
				return
			}
			
			self.news = news
			
		}) { (error: Error?) in
			
			self.error = error
			
		}
	}
	
}
