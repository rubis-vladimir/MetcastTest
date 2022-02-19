//
//  ListCell.swift
//  MetcastTest
//
//  Created by Владимир Рубис on 19.02.2022.
//

import UIKit

class ListCell: UITableViewCell {


    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var conditionCityLabel: UILabel!
    @IBOutlet weak var tempCityLabel: UILabel!
    
    func configure(weather: Weather) {
        
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.conditionString
        self.tempCityLabel.text = weather.temperatureString
    }
}
