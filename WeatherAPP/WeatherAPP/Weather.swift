//
//  Weather.swift
//  WeatherAPP
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class WeatherDetails:Decodable{
    var location: Weather
}
class Weather:Decodable
{
    var name = ""
    var region = ""
    var country = ""
    var tz_id = ""
    var localtime = ""
}
