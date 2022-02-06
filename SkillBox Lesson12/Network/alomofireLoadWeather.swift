//
//  alomofireLoadWeather.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 19.02.2021.
//

import Foundation
import Alamofire

protocol weatherAlamofireDelegate {
    func saveWeather (temp: Double, wind: Double)
}

protocol weather5AlamofireDelegate {
    func saveWeather (array: [weather])
}

class weatherLoaderAlamofire {
    
    var delegate: weatherAlamofireDelegate?
    
    func load() {
        AF.request(urlString).responseJSON { responce in
            if let objects = responce.value,
               let jsonDict = objects as? NSDictionary {
                let a = pars(json: jsonDict as! [String : AnyObject])
                DispatchQueue.main.async {
                    self.delegate?.saveWeather(temp: a.temp, wind: a.wind)
                }
            }
        }
    }
}

class weatherLoaderAlomofire5 {
    
    var delegate: weather5AlamofireDelegate?
    
    func load () {
        AF.request(urlString16).responseJSON { (responce) in
            if let objects = responce.value,
               let jsonDict = objects as? NSDictionary {
                let a = parsTable(jsonDict: jsonDict)
                DispatchQueue.main.async {
                    self.delegate?.saveWeather (array: a)
                }
            }
        }
    }
}
