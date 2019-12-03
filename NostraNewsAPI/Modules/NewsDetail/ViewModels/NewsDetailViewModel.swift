//
//  NewsDetailViewModel.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 03/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

internal final class NewsDetailViewModel {
	
	private let articles: Articles
	
	init(articles: Articles) {
		self.articles = articles
	}
	
	var description: String {
		return articles.description
	}
	
	var imageUrl: String? {
		return articles.urlToImage
	}
	
}
