//
//  ErrorViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 13.10.2022.
//

import UIKit

class ErrorViewController: UIViewController {

    var connection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        connection = Connectivity.isConnectedToInternet
        return connection
    }
    
}
