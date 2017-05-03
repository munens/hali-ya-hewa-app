//
//  Forecast.swift
//  hali-ya-hewa
//
//  Created by Munene Kaumbutho on 2017-05-03.
//  Copyright © 2017 Munene Kaumbutho. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                self._lowTemp = "\(Double(round(min - 273.15)))"
                print(self._lowTemp)
            }
            
            if let max = temp["max"] as? Double {
                self._highTemp = "\(Double(round(max - 273.15)))"
                print(self._highTemp)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
                print(self._weatherType)
            }
            
            if let date = weatherDict["dt"] as? Double {
                
                let unixConvertedDate = Date(timeIntervalSince1970: date)
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                dateFormatter.dateFormat = "EEEE"
                dateFormatter.timeStyle = .none
                
                self._date = unixConvertedDate.dayOftheWeek()
                print(self._date)
            }
        }
    }
}

extension Date {
    func dayOftheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
