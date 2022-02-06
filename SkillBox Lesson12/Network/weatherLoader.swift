//
//  weatherLoader.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 07.02.2021.
//

import Foundation

protocol weatherDelegate {
    func saveWeather (temp: Double, wind: Double)
}

protocol weather16Delegate {
    func saveWeather (array: [weather])
}

var city = "Moscow"
var apiKey = "df20d04763777b12725acd6f5cb77517"
var urlString = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&units=metric&appid="+apiKey

class weatherLoader {
    
    var delegate: weatherDelegate?
    
    func loadWeather () {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [self] (data, responce, error) in
            do {
                let json: [String : AnyObject] = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                let a = pars(json: json)
                DispatchQueue.main.async {
                    self.delegate?.saveWeather(temp: a.temp, wind: a.wind)
                }
            }
            catch {
                print("Error")
            }
        }
        task.resume()
    }
}

var urlString16 = "http://api.openweathermap.org/data/2.5/forecast?q=" + city + "&units=metric&appid="+apiKey

class weatherLoader16 {
    
    var delegate: weather16Delegate?
    
    func loadWeather16 () {
        let url = URL (string: urlString16)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {(data, responce, error) in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
               let jsonDict = json as? Dictionary<String, Any> {
               let a = parsTable(jsonDict: jsonDict as NSDictionary)
                DispatchQueue.main.async {
                    self.delegate?.saveWeather (array: a)
                }
            }
        }
        task.resume()
    }
}
