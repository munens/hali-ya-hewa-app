//
//  File.swift
//  hali-ya-hewa
//
//  Created by Munene Kaumbutho on 2017-05-02.
//  Copyright © 2017 Munene Kaumbutho. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let CNT = "&cnt=10"
let API_KEY = "b389906bfa958a096a615d30046a77b3"
let APP_ID = "&appid="

// to tell us that the download is complete:
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-0.2921\(LONGITUDE)36.8219\(APP_ID)\(API_KEY)"

let FORECAST_URL = "\(BASE_FORECAST_URL)\(LATITUDE)-0.2921\(LONGITUDE)36.8219\(CNT)\(APP_ID)\(API_KEY)"
