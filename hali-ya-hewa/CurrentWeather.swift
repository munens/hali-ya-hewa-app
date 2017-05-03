//
//  CurrentWeather.swift
//  hali-ya-hewa
//
//  Created by Munene Kaumbutho on 2017-05-02.
//  Copyright © 2017 Munene Kaumbutho. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp  = 0.0
        }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download:
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!, method: .get).responseJSON { response in
            let result = response.result
            
            // create a dictionary if we recieve a value:
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                //get the name value from the dictinary we recieve and give it the value of _cityName:
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                // get the weather values that are of type dictionary. Take the 'main' value and set it as the value of _weatherType:
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                // get the current temperature values of type dictionary. Get the current temperature in Kelvin and set the value of it as _currentTemperature:
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        self._currentTemp = (currentTemperature - 273.15).rounded()
                    }   
                }
            }
            // need to tell it when to complete:
            completed()
        }
        
    }
}
