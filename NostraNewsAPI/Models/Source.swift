//
//  Source.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 02/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

struct Source: Codable {
	
	let id: String?
	let name: String
	
	enum CodingKeys: CodingKey {
		case id
		case name
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decodeIfPresent(String.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encodeIfPresent(id, forKey: .id)
		try container.encode(name, forKey: .name)
	}
	
}
