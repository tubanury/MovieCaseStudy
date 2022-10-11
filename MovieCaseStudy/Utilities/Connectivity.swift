//
//  Connectivity.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//
import Alamofire

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet: Bool {
        let connected = self.sharedInstance.isReachable
        return connected
    }
}//end Connectivity
