//
//  loadViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 14.10.2022.
//

import UIKit

class LoadingViewController: UIViewController {

    var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        button.backgroundColor = .systemTeal
        button.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        return button
        
    }()
    
    var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.8
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        blurEffectView.frame = self.view.bounds
        view.insertSubview(blurEffectView, at: 0)
        button.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        view.addSubview(button)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        animate()
    }
   
    func animate(){
        
        let oldValue = button.frame.width/2
        let newButtonWidth: CGFloat = 30

        /* Do Animations */
        CATransaction.begin()
        CATransaction.setAnimationDuration(6.0)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))

        UIView.animate(withDuration: 0.6,
            animations: {
                self.button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.6) {
                    self.button.transform = CGAffineTransform.identity
                }
            })

        // Layer animations
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.fromValue = oldValue
        cornerAnimation.toValue = newButtonWidth/2

        button.layer.cornerRadius = newButtonWidth/2
        button.layer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius))

        CATransaction.commit() 
        
    }
   

}
