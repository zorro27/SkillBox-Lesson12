//
//  hours.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 27.02.2021.
//

import Foundation
import UIKit

func hours(name: UIImageView) {
    
    let hour = Calendar.current.component(.hour, from: Date())
            if hour > 05 && hour < 17 {
                let img: UIImage = UIImage(named: "fon")!
                name.contentMode = .scaleAspectFill
                name.image = img
            } else {
               let img: UIImage = UIImage(named: "fon_night")!
                name.contentMode = .scaleAspectFill
                name.image = img
            }
}
