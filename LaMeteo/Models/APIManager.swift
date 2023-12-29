//
//  APIManager.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 16/12/2023.
//

import Foundation
import SwiftUI



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

func backgroundForWeather(_ weatherData: WeatherData) -> Image {
    guard let mainWeather = weatherData.weather.first?.main else {
        // Default background for unknown weather
        return Image(systemName: "questionmark.circle.fill")
    }

    switch mainWeather.lowercased() {
    case "thunderstorm":
        return Image("Thunderstorm")
    case "drizzle":
        return Image("Drizzle")
    case "rain":
        return Image("Rainy")
    case "snow":
        return Image("Snowy")
    case "clear":
        return Image("Clear")
    case "clouds":
        return Image("Clouds")
    // Add more cases as needed for other weather conditions
    default:
        // Default background for unknown weather
        return Image(systemName: "questionmark.circle.fill")
    }
}

func backgroundForTimeOfDay(_ dtTxt: String?) -> Image {
        guard let dtTxt = dtTxt, let date = DateFormatter.weatherDateFormatter.date(from: dtTxt) else {
            // Default background for unknown time
            return Image("Day")
        }

        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)

        if (6..<18).contains(hour) {
            // Daytime background
            return Image("Day")
        } else {
            // Nighttime background
            return Image("Night")
        }
    }

extension DateFormatter {
    static let weatherDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}

func extractHour(from dateString: String) -> String? {
    // Find the index of the space character before the hour component
    if let spaceIndex = dateString.firstIndex(of: " ") {
        // Calculate the position of the hour component
        let hourStartIndex = dateString.index(after: spaceIndex)
        let hourEndIndex = dateString.index(hourStartIndex, offsetBy: 2)

        // Extract the hour component
        return String(dateString[hourStartIndex..<hourEndIndex])
    }
    return nil
}

func convertVisibilityToKilometers(_ visibilityInMeters: Int) -> Int {
    // Convert meters to kilometers
    let visibilityInKilometers = visibilityInMeters / 1000
    return visibilityInKilometers
}

func foregroundColorForTimeOfDay(_ dtTxt: String?) -> Color {
    guard let dtTxt = dtTxt, let date = DateFormatter.weatherDateFormatter.date(from: dtTxt) else {
        // Default foreground for unknown time
        return .black
    }

    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)

    if (6..<18).contains(hour) {
        // Daytime foreground
        return .black
    } else {
        // Nighttime foreground
        return .white
    }
}
