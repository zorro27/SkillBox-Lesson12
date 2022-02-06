//
//  ViewController.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 07.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var CityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var fonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CityNameLabel.text = city
        let loader = weatherLoader()
        loader.delegate = self
        loader.loadWeather()
        hours(name: fonImage)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? weather16ViewController, segue.identifier == "LastVC"{
            vc.city = city
        }
    }
}

extension ViewController: weatherDelegate{
    func saveWeather (temp: Double, wind: Double){
        self.tempLabel.text = String(((temp*10).rounded())/10) + "ºC"
        self.windLabel.text = "Сила ветра - " + String(wind) + "м/с"
        }
    }

