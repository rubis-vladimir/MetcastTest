//
//  ListTableViewController.swift
//  MetcastTest
//
//  Created by Владимир Рубис on 17.02.2022.
//

import UIKit

class ListTableViewController: UITableViewController {

    let emptyCity = Weather()
    
    var citiesArray = [Weather]()
    let nameCitiesArray = ["Москва", "Санкт-Петербург", "Пенза"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        addCities()
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        print(citiesArray)
        tableView.reloadData()
    }
    func addCities() {
        
        getCityWeather(citiesArray: nameCitiesArray) { (index, weather) in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ListCell

        var weather = Weather()
        
        weather = citiesArray[indexPath.row]
        
        cell.configure(weather: weather)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let showDetailVC = segue.destination as? DetailVC else {
                return }
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            showDetailVC.weatherModel = citiesArray[index]
            print(citiesArray[index])
        }
    }
}
