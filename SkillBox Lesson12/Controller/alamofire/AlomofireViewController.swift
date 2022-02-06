//
//  AlomofireViewController.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 19.02.2021.
//

import UIKit

class AlomofireViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLanel: UILabel!
    @IBOutlet weak var fonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = city
        let loader = weatherLoaderAlamofire()
        loader.delegate = self
        loader.load()
        hours(name: fonImage)
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? alomofireTableViewController, segue.identifier == "lastVC"{
                vc.nameCity = city
            }
        }
    }
}
extension AlomofireViewController: weatherAlamofireDelegate {
    func saveWeather (temp: Double, wind: Double) {
        tempLabel.text = String(((temp*10).rounded())/10) + "ºC"
        windLanel.text = "Сила ветра - " + String(wind) + "м/с"
    }
}
