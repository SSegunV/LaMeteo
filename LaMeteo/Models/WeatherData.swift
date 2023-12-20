//
//  WeatherData.swift
//  LaMeteo
//
//  Created by Victor Jegede on 14/12/2023.
//

import Foundation

// Structure to hold weather values
struct WeatherData: Decodable, Identifiable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coord: Decodable {
    let lon: Double?
    let lat: Double?
}

struct Weather: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct Main: Decodable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Int?
    let humidity: Int?
    let sea_level: Int?
    let grnd_level: Int?
}

struct Wind: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct Rain: Decodable {
    let h1 : Double?
    
    private enum CodingKeys: String, CodingKey {
        case h1 = "1h"
    }
}

struct Clouds: Decodable {
    let all: Int?
}

struct Sys: Decodable {
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}
    
extension WeatherData {
    static let sampleData: [WeatherData] =
[
    WeatherData(coord: Coord(lon: Optional(-0.21), lat: Optional(51.51)), weather: [Weather(id: Optional(804), main: Optional("Clouds"), description: Optional("overcast clouds"), icon: Optional("04n"))], base: "stations", main: Main(temp: Optional(11.8), feels_like: Optional(11.28), temp_min: Optional(10.89), temp_max: Optional(12.66), pressure: Optional(1025), humidity: Optional(86), sea_level: nil, grnd_level: nil), visibility: 10000, wind: Wind(speed: Optional(6.17), deg: Optional(220), gust: nil), rain: nil, clouds: Clouds(all: Optional(100)), dt: 1702919383, sys: Sys(type: Optional(2), id: Optional(2075535), country: Optional("GB"), sunrise: Optional(1702886528), sunset: Optional(1702914744)), timezone: 0, id: 2641168, name: "Notting Hill", cod: 200),
    WeatherData(coord: Coord(lon: Optional(-0.21), lat: Optional(51.51)), weather: [Weather(id: Optional(804), main: Optional("Clouds"), description: Optional("overcast clouds"), icon: Optional("04n"))], base: "stations", main: Main(temp: Optional(11.8), feels_like: Optional(11.28), temp_min: Optional(10.89), temp_max: Optional(12.66), pressure: Optional(1025), humidity: Optional(86), sea_level: nil, grnd_level: nil), visibility: 10000, wind: Wind(speed: Optional(6.17), deg: Optional(220), gust: nil), rain: nil, clouds: Clouds(all: Optional(100)), dt: 1702919383, sys: Sys(type: Optional(2), id: Optional(2075535), country: Optional("GB"), sunrise: Optional(1702886528), sunset: Optional(1702914744)), timezone: 0, id: 2641168, name: "Notting Hill", cod: 200)
    ]
}
