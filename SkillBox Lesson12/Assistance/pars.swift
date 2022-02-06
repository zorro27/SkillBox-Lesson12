//
//  pars.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 27.02.2021.
//

import Foundation


    func pars(json: [String : AnyObject]) -> (temp: Double, wind: Double) {
        var temp1: Double = 0.0
        var wind1: Double = 0
        
        if let temp = json ["main"] {
            temp1 = temp["temp"] as! Double
        }
        if let wind = json ["wind"] {
            wind1 = wind["speed"] as! Double
        }
        return (temp: temp1, wind: wind1)
    }

func parsTable(jsonDict: NSDictionary) -> ([weather]) {
    var array1:[weather] = []
    
    if let array = jsonDict["list"] as? NSArray {
        for i in array{
            if let data = i as? NSDictionary {
                if (weather.init(data: data)!).data.split(separator: " ", maxSplits: 1)[1] == "12:00:00" {
                    array1.append(weather.init(data: data)!)
                }
            }
        }
    }
    return (array1)
}
