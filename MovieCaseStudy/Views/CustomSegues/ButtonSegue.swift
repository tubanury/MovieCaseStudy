//
//  ButtonSegue.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 14.10.2022.
//

import Foundation
import UIKit

class ButtonSegue: UIStoryboardSegue {
 
    
    override func perform() {
        let firstVC = source.view as UIView
        let secondVC = destination.view as UIView
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVC, belowSubview: firstVC)
        
        secondVC.transform = secondVC.transform.scaledBy(x: 0.001, y: 0.001)
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            firstVC.transform = secondVC.transform.scaledBy(x: 0.001, y: 0.001)
         
                }) { (Finished) -> Void in
         
                    UIView.animate(withDuration: 0.5, animations: { () -> Void in
                        secondVC.transform = CGAffineTransform.identity
                        
                    }, completion: { (Finished) -> Void in
         
                        firstVC.transform = CGAffineTransform.identity
                            self.source.present(self.destination as UIViewController, animated: false, completion: nil)
                    })
            }

    }
    
    
}
