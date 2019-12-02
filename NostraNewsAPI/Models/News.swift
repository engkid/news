//
//  News.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 02/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

struct News: Codable {
	
	let status: String
	let totalResults: Int
	let articles: [Articles]
	
	enum CodingKeys: CodingKey {
		case status
		case totalResults
		case articles
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		status = try container.decode(String.self, forKey: .status)
		totalResults = try container.decode(Int.self, forKey: .totalResults)
		articles = try container.decode([Articles].self, forKey: .articles)
	}
 
	func encode(to encoder: Encoder) throws {
		
		var container = encoder.container(keyedBy: CodingKeys.self)
		var response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .articles)
		
		try container.encode(status, forKey: .status)
		try container.encode(totalResults, forKey: .totalResults)
		try response.encode(articles, forKey: .articles)
		
		
	}
	
}
