//
//  ForeCastingController.swift
//  Weather Forecasting
//
//  Created by MD ISHTIYAK on 24/05/19.
//  Copyright © 2019 MD ISHTIYAK. All rights reserved.
//


import Foundation


struct Ids {
    static let AppId        =       "a45dd0443da73f64f48686a8e89e1c04"
}

struct weeks {
    static let days         =       ["Friday","Saturday","Sunday","Monday","Tuesday"]
}
//MARK: Methods API
struct Methods {
    static let GET          =       "GET"
    static let POST         =       "POST"
}

//MARK: ALL KEYS
struct Keys {
    
     static var cityTitle   =       ""
     static var lat         =       ""
     static var long        =       ""
    
}

//MARK: API URLS
struct Urls {
   
    static  let mainUrl             =   "http://api.openweathermap.org/data/2.5/forecast?"
    static  let imgUrl              =   "http://openweathermap.org/img/w/"
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
