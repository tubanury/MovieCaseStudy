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
        
        //self.navigationController?.navigationBar.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            if self.shouldPerformSegue(withIdentifier: "splash", sender: self){
                self.performSegue(withIdentifier: "splash", sender: self )
            }
            else{
                self.presentLostConnectionAlert()
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        connection = Connectivity.isConnectedToInternet
        return connection
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "splash"{
                let _ = segue.destination as! SearchViewController
            //destinationVC.textEmail = self.EmailTextField.text ?? "test"
        }
    }
    
    func presentLostConnectionAlert(){
        let alert = UIAlertController(title: "Check Your Connection", message: "\n\n\n", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "Upload", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        let image = UIImageView(image: UIImage(named: "clip-no-connection.png"))
        alert.view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0))
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0))
        self.present(alert, animated: true, completion: nil)
    }
    
}
