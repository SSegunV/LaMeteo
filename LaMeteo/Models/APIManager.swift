//
//  APIManager.swift
//  LaMeteo
//
//  Created by Victor Jegede on 16/12/2023.
//

import Foundation


func fetchWeather(lon: Double, lat: Double) async throws -> WeatherData {
    let api_key = "4e1d3a52061b74330ee1bf7e2269e621"
    
    // Define URL
    let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(api_key)&units=metric"
    let url = URL(string: urlString)!
    
    // Fethc data using urlsession (in language browser)
    let (data, _) = try await URLSession.shared.data(from: url)
    
    // decode data
    let decoded = try JSONDecoder().decode(WeatherData.self, from: data)
    
    return decoded
}

func fetchForecast(lon: Double, lat: Double) async throws -> ForecastData {
    let api_key = "4e1d3a52061b74330ee1bf7e2269e621"
    
    // Define URL
    let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(api_key)&units=metric"
    let url = URL(string: urlString)!
    
    // Fethc data using urlsession (in language browser)
    let (data, _) = try await URLSession.shared.data(from: url)
    
    // decode data
    let decoded = try JSONDecoder().decode(ForecastData.self, from: data)
    
    return decoded
}

