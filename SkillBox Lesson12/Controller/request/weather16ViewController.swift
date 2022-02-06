//
//  weather16ViewController.swift
//  SkillBox Lesson12
//
//  Created by Роман Зобнин on 14.02.2021.
//

import UIKit

class weather16ViewController: UIViewController {
    @IBOutlet weak var nameCityLabel: UILabel!
    var city: String = ""
    @IBOutlet weak var tableView: UITableView!
    
    var array:[weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameCityLabel.text = city
        let loader = weatherLoader16()
        loader.delegate = self
        loader.loadWeather16()
    }
}

extension weather16ViewController: weather16Delegate {
    
    func saveWeather (array: [weather])  {
        self.array = array
        tableView.reloadData()
    }
}

extension weather16ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! weatherTableViewCell
        
        func processDate(string: String, fromFormat: String = "yyyy-MM-dd", toFormat: String = "dd MMMM") -> String? {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_RU")
            formatter.dateFormat = fromFormat
            guard let date = formatter.date(from: string) else { return nil }

            formatter.dateFormat = toFormat
            return formatter.string(from: date)
        }
        
            let model1 = array[indexPath.row]
            let a = String(model1.data.split(separator: " ", maxSplits: 1)[0])
        let b = processDate(string: a)
            cell.dayLabel.text = b
            cell.tempLabel.text = String((((model1.temp)*10).rounded())/10) + " ºС"
            cell.windLabel.text = String((((model1.speed)*10).rounded())/10) + " м/с"
        
        return cell
    }
}
