//
//  RcValues.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//

import Firebase

enum ValueKey: String{
    case appLaunchScreenText
}

class RCValues {
  static let sharedInstance = RCValues()

  private init() {
    loadDefaultValues()
    fetchCloudValues()
  }

 func launchScreenText(forKey key: ValueKey) -> String {
      let text = RemoteConfig.remoteConfig()[key.rawValue]
        .stringValue ?? ""
      
      return text
}
  func loadDefaultValues() {
    let appDefaults: [String: Any?] = [
        ValueKey.appLaunchScreenText.rawValue : "Test"
    ]
    RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
  }
    
  func activateDebugMode() {
      let settings = RemoteConfigSettings()
      //Disable that before launch
      settings.minimumFetchInterval = 0
      RemoteConfig.remoteConfig().configSettings = settings
    }
    
    
 func fetchCloudValues() {
    activateDebugMode()

    RemoteConfig.remoteConfig().fetch { [weak self] _, error in
        if let error = error {
          print("Uh-oh. Got an error fetching remote values \(error)")
          // In a real app, you would probably want to call the loading
          // done callback anyway, and just proceed with the default values.
          // I won't do that here, so we can call attention
          // to the fact that Remote Config isn't loading.
          return
        }

    RemoteConfig.remoteConfig().activate { _, _ in
       
        let appLaunchScreenText = RemoteConfig.remoteConfig()
                                  .configValue(forKey: "appLaunchScreenText")
                                  .stringValue ?? "undefined"
        print("""
          Our app's Launch Screen Text is \
          \(appLaunchScreenText)
          """)
        }
    }
  }
}
