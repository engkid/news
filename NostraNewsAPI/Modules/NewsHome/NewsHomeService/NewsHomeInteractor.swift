//
//  NewsHomeInteractor.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 02/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

internal class NewsHomeInteractor {
	
	func fetchData<D: Decodable>(pageSize: Int, page: Int, result: @escaping (Result<D, Error>) -> Void) {
		
		let param = [
			"pageSize": String(pageSize),
			"page": String(page),
			"sources" : "bbc-news",
			"apiKey" : "2486c0dc1c9847baafb8dc5ed4901f06"
		]
		
		NetworkService.getRequest(url: "https://newsapi.org/v2/top-headlines", parameter: param) { (response: URLResponse?, data: Data?, error: Error?) in
			
			guard let data = data else {
				
				if let error = error {
					result(.failure(error))
				}
				
				return
			}
			
			let decoder = JSONDecoder()
			
			do {
				
				let d = try decoder.decode(D.self, from: data)
				
				result(.success(d))
				
			} catch let error {
				
				result(.failure(error))
				
			}
			
		}
		
	}
	
	func getNews(pageSize: Int, page: Int, successBlock: @escaping ((_ news: News) -> Void), failureBlock: @escaping ((_ error: Error?) -> Void)) {
		
		let param = [
			"pageSize": String(pageSize),
			"page": String(page),
			"sources" : "bbc-news",
			"apiKey" : "2486c0dc1c9847baafb8dc5ed4901f06"
		]
		
		NetworkService.getRequest(url: "https://newsapi.org/v2/top-headlines", parameter: param) { (response: URLResponse?, data: Data?, error: Error?) in
			
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
