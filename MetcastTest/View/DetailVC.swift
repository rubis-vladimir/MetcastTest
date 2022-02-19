//
//  DetailVC.swift
//  MetcastTest
//
//  Created by Владимир Рубис on 19.02.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBOutlet weak var imageCityView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempCityLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    var weatherModel: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshLabels()
       
    }
    
    func refreshLabels() {
        
        nameCityLabel.text = weatherModel.name
        NetworkFetchImage.shared.fetchImage("https://yastatic.net/weather/i/icons/funky/dark/ovc.svg") { (image) in
            self.imageCityView.image = image
        }
//        imageCityView.image = UIImage(data: weatherModel.conditionCode)
//        UIImage(
        conditionLabel.text = weatherModel.conditionString
        tempCityLabel.text = weatherModel.temperatureString
        pressureLabel.text = "\(weatherModel.presureMm)"
        windSpeedLabel.text = "\(weatherModel.windSpeed)"
        minTempLabel.text = "\(weatherModel.tempMin)"
        maxTempLabel.text = "\(weatherModel.tempMax)"
        
    }
}
