//
//  SplashViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//

import UIKit

class SplashViewController: UIViewController {

    var connection = false
    @IBOutlet weak var SplashScreenLabel: UILabel!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        SplashScreenLabel.text = RCValues.sharedInstance.launchScreenText(forKey: .appLaunchScreenText)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            if self.shouldPerformSegue(withIdentifier: "toSearch", sender: self){
                self.performSegue(withIdentifier: "toSearch", sender: self )
            }
            else{
                self.performSegue(withIdentifier: "toError", sender: self )
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        connection = Connectivity.isConnectedToInternet
        return connection
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSearch"{
                let _ = segue.destination as! SearchViewController
        }
        else if segue.identifier == "toError"{
                let _ = segue.destination as! ErrorViewController
        }

    }
    
}
