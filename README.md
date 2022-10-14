# Movie Case Study

This is an IOS app. You can search for movies from [OMDBApi](http://omdbapi.com) and get detailed information about them.

[![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift)
[![Firebase](https://img.shields.io/badge/firebase-6.9.0-orange.svg?style=flat)](https://firebase.google.com) 
   
# Usage

To get this project working, insert your apiKey to Constants.swift
```swift
enum Api {
    static let baseUrl = "http://www.omdbapi.com/"
    static let apikey = "YOUR API KEY GOES HERE"
    static let parameterForSearch = "?s="
    static let parameterForImdb = "?i="
    static let parameterForApikey = "&apikey="
}

```

# Screenshots


<img src="https://github.com/tubanury/MovieCaseStudy/blob/main/Screenshots/splashScreen.png" width="250" ><img src="https://github.com/tubanury/MovieCaseStudy/blob/main/Screenshots/homeBeforeSearch.png" width="250"> 
<img src="https://github.com/tubanury/MovieCaseStudy/blob/main/Screenshots/homeScreen.png" width="250"> 
<img src="https://github.com/tubanury/MovieCaseStudy/blob/main/Screenshots/DetailScreen.png" width="250" > <img src="https://github.com/tubanury/MovieCaseStudy/blob/main/Screenshots/errorScreen.png" width="250">
