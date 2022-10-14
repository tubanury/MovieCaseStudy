//
//  UIFont.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 13.10.2022.
//

import Foundation
import UIKit

extension UIFont {
    static let pixel17 = UIFont(name: "Starjedi", size: 17.0)
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
