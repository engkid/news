//
//  NetworkService.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 29/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

class NetworkService {
	
	// TODO: - Networking layer here
	static func getRequest(url: String, parameter: [String: Any]?, completion: @escaping ((_ response: URLResponse?, _ data: Data?, _ error: Error?) -> Void)) {
		
		guard let urlRequest = URL(string: url) else {
			return
		}
		
		var request: URLRequest = URLRequest(url: urlRequest)
		request.httpMethod = "GET"
		
		let session: URLSession = URLSession.shared
		
		let task = session.dataTask(with: urlRequest) { (data, response, error) in
			
			if let error = error {
				
				completion(nil, nil, error)
				
			} else {
				
				completion(response, data, nil)
				
			}
			
			
		}
		
		task.resume()
		
	}
	
}
