//
//  ErrorViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 13.10.2022.
//

import UIKit

class ErrorViewController: UIViewController {

    @IBOutlet weak var tryAgainButton: UIButton!
    var connection = false
    let vc = SearchViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        connection = Connectivity.isConnectedToInternet
        return connection
    }
    
    @IBAction func didTapTryAgain(_ sender: Any) {
        connection = Connectivity.isConnectedToInternet
        if(connection){
            //self.present(vc, animated: true, completion: nil)
        }
        
    }
}
