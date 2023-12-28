//
//  WeatherData.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 14/12/2023.
//

import Foundation

// Structure to hold weather values
struct WeatherData: Decodable, Identifiable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var rain: Rain?
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct Coord: Codable {
    var lon: Double?
    var lat: Double?
}

struct Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Main: Decodable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
    var sea_level: Int?
    var grnd_level: Int?
}

struct Wind: Decodable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}

struct Rain: Decodable {
    var h1 : Double?
    
    private enum CodingKeys: String, CodingKey {
        case h1 = "1h"
    }
}

struct Clouds: Decodable {
    var all: Int?
}

struct Sys: Decodable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}
    
extension WeatherData {
    static let sampleData: [WeatherData] =
[
    WeatherData(coord: Coord(lon: Optional(-0.21), lat: Optional(51.51)), weather: [Weather(id: Optional(804), main: Optional("Clouds"), description: Optional("overcast clouds"), icon: Optional("04n"))], base: "stations", main: Main(temp: Optional(11.8), feels_like: Optional(11.28), temp_min: Optional(10.89), temp_max: Optional(12.66), pressure: Optional(1025), humidity: Optional(86), sea_level: nil, grnd_level: nil), visibility: 10000, wind: Wind(speed: Optional(6.17), deg: Optional(220), gust: nil), rain: nil, clouds: Clouds(all: Optional(100)), dt: 1702919383, sys: Sys(type: Optional(2), id: Optional(2075535), country: Optional("GB"), sunrise: Optional(1702886528), sunset: Optional(1702914744)), timezone: 0, id: 2641168, name: "Notting Hill", cod: 200),
    WeatherData(coord: Coord(lon: Optional(-0.21), lat: Optional(51.51)), weather: [Weather(id: Optional(804), main: Optional("Clear"), description: Optional("overcast clouds"), icon: Optional("04n"))], base: "stations", main: Main(temp: Optional(11.8), feels_like: Optional(11.28), temp_min: Optional(10.89), temp_max: Optional(12.66), pressure: Optional(1025), humidity: Optional(86), sea_level: nil, grnd_level: nil), visibility: 10000, wind: Wind(speed: Optional(6.17), deg: Optional(220), gust: nil), rain: nil, clouds: Clouds(all: Optional(100)), dt: 1702919383, sys: Sys(type: Optional(2), id: Optional(2075535), country: Optional("GB"), sunrise: Optional(1702886528), sunset: Optional(1702914744)), timezone: 0, id: 2641168, name: "Notting Hill", cod: 200),
    WeatherData(coord: Coord(lon: Optional(0), lat: Optional(0)), weather: [Weather(id: Optional(0), main: Optional("-"), description: Optional("-"), icon: Optional("-"))], base: "stations", main: Main(temp: Optional(0.00), feels_like: Optional(0.00), temp_min: Optional(0.00), temp_max: Optional(0.00), pressure: Optional(Int(0.00)), humidity: Optional(Int(00.00)), sea_level: nil, grnd_level: nil), visibility: 00000, wind: Wind(speed: Optional(0.00), deg: Optional(000), gust: nil), rain: nil, clouds: Clouds(all: Optional(000)), dt: 00000000, sys: Sys(type: Optional(0), id: Optional(000000), country: Optional("-"), sunrise: Optional(0000000), sunset: Optional(000000)), timezone: 0, id: 2641168, name: "-", cod: 200)
    ]
}
