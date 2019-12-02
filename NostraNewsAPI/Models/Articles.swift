//
//  News.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 02/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

struct Articles: Codable {
	
	let source: Source
	let author: String?
	let title: String
	let description: String
	let url: String
	let urlToImage: String?
	let publishedAt: String
	let content: String
	
	enum CodingKeys: CodingKey {
		case source
		case author
		case title
		case description
		case url
		case urlToImage
		case publishedAt
		case content
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		source = try container.decode(Source.self, forKey: .source)
		title = try container.decode(String.self, forKey: .title)
		description = try container.decode(String.self, forKey: .description)
		url = try container.decode(String.self, forKey: .url)
		urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
		publishedAt = try container.decode(String.self, forKey: .publishedAt)
		content = try container.decode(String.self, forKey: .content)
		author = try container.decodeIfPresent(String.self, forKey: .author)
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(source.id, forKey: .source)
		try container.encode(source.name, forKey: .source)
		try	container.encodeIfPresent(author, forKey: .author)
		try container.encode(title, forKey: .title)
		try container.encode(description, forKey: .description)
		try container.encode(url, forKey: .url)
		try container.encodeIfPresent(urlToImage, forKey: .urlToImage)
		try container.encode(publishedAt, forKey: .publishedAt)
		try container.encode(content, forKey: .content)
	}
	
}
