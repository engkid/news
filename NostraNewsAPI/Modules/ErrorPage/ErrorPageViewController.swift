//
//  ErrorPageViewController.swift
//  NostraNewsAPI
//
//  Created by Engkit Satia Riswara on 03/12/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import Reachability

class ErrorPageViewController: UIViewController {

	@IBOutlet weak var retryButton: UIButton?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		configureRetryButton()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.setNavigationBarHidden(true, animated: false)
		navigationItem.hidesBackButton = true
	}

	override func viewWillDisappear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: false)
	}
	
	private func configureRetryButton() {
		retryButton?.backgroundColor = UIColor.black
		retryButton?.layer.cornerRadius = 8
		retryButton?.addTarget(self, action: #selector(retryTapped), for: .touchUpInside)
	}
	
	@objc private func retryTapped() {
		
		NetworkManager.isReachable { _ in
			
			self.navigationController?.popViewController(animated: true)
			
		}
		
	}
	
}
