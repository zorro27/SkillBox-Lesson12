//
//  Weather.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 07.02.2021.
//

import Foundation

class weather {
    var temp: Double = 0.0
    var speed: Double = 0.0
    var data: String = ""
    
    init? (data: NSDictionary) {
        guard
            let main = data["main"] as? NSDictionary,
            let wind = data["wind"] as? NSDictionary,
            let temp = main ["temp"] as? Double,
            let speed = wind ["speed"] as? Double,
            let data = data ["dt_txt"] as? String else {return nil}
        
        self.temp = temp
        self.speed = speed
        self.data = data
    }
}

