//
//  WeatherCell.swift
//  hali-ya-hewa
//
//  Created by Munene Kaumbutho on 2017-05-03.
//  Copyright © 2017 Munene Kaumbutho. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(forecast: Forecast){
        print(forecast)
        minTempLabel.text = "\(forecast.lowTemp)°C"
        maxTempLabel.text = "\(forecast.highTemp)°C"
        weatherLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherImageView.image = UIImage(named: forecast.weatherType)
    }
    
    /*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
