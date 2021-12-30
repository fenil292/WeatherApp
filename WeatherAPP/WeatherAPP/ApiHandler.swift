//
//  ApiHandler.swift
//  WeatherAPP
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
class ApiHandler {
    static let shared = ApiHandler()
    
    private init() {}
    
    func getStockPrice(completion : @escaping(([WeatherDetails]) -> Void)){
        if let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=27c1886734f946f0b0b110846212412&q=surat&aqi=yes") {
            do { let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                do {
                    let jsonWeather = try decoder.decode(WeatherDetails.self, from: data)
                    //print(jsonWeather.current.condition.icon)
                    return  [jsonWeather]
                }catch {
                    print(error)
                }
                
            } catch {
                print(error)
            }

        }
        return [WeatherDetails]()
    }
}
