//
//  NewsHomeInteractor.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 02/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

internal class NewsHomeInteractor {
	
	func getNews(successBlock: @escaping ((_ news: News) -> Void), failureBlock: @escaping ((_ error: Error?) -> Void)) {
		
		NetworkService.getRequest(url: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-11-02&sortBy=publishedAt&apiKey=2486c0dc1c9847baafb8dc5ed4901f06", parameter: nil) { (response: URLResponse?, data: Data?, error: Error?) in
			
			guard let data = data else {
				
				if error != nil {
					failureBlock(error)
				}
				
				return
			}
			
			let decoder = JSONDecoder()
			
			do {
				
				let news = try decoder.decode(News.self, from: data)
				
				successBlock(news)
				
			} catch let error {
				
				failureBlock(error)
				
			}
			
		}
		
	}
	
}
