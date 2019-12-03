//
//  NetworkManager.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 03/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import Reachability

class NetworkManager: NSObject {
	
	var reachability: Reachability?
	
	static let shared: NetworkManager = NetworkManager()
	
	override init() {
		
		do {
			reachability = try Reachability()
		} catch let error {
			print("error getting reachability instance: \(error)")
		}
		
		super.init()
		
	}
	
	private func setNotificationService() {
		
		
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
		
	}
	
	static func isReachable(completed: @escaping (NetworkManager) -> Void) {
		if (NetworkManager.shared.reachability)?.connection != Optional.none {
            completed(NetworkManager.shared)
        }
    }
    
    static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
		if (NetworkManager.shared.reachability)?.connection == Optional.none {
            completed(NetworkManager.shared)
        }
    }
	
}
