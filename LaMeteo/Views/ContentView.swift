//
//  WeatherContentView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var current_weather = WeatherData.sampleData[2]
    @Binding var location: LocationData
    @State var forecast: ForecastData = ForecastData.sampleData
    @State var bg : Image
    @State var fbg: Image
    @State var fg: Color
    
    var body: some View {
        
        ZStack {
            
            // Time of day bakdrop
            fbg
                .resizable()
                .scaledToFill()
            
            // Current weather in front
            bg
                .resizable()
                .scaledToFill()
            
            // Weather metrics
            VStack {
                WeatherBoxView(location: $location, current_weather: $current_weather)
                    .position(x: UIScreen.main.bounds.width * 1/2, y: UIScreen.main.bounds.height * 1/5)
                ForecastBarView(forecast: $forecast)
                    .position(x: UIScreen.main.bounds.width * 1/2, y: UIScreen.main.bounds.height * 1.1/7)
                AdditionalMetricsView(current_weather: $current_weather)
                    .position(x: UIScreen.main.bounds.width * 1/2, y: UIScreen.main.bounds.height * 0.9/7)
            }
            
            // Change text colour according to time of day
            .foregroundColor(fg)
            
                // Fetch data and change view accordingly 
            .onAppear {
                Task {
                    do {
                        forecast = try await fetchForecast(lon: location.coord.lon!, lat: location.coord.lat!)
                        print("Forecast fetch success")
                    } catch {
                        print("Error fetching forecast")
                    }
                    
                    do {
                        current_weather = try await fetchWeather(lon: location.coord.lon!, lat: location.coord.lat!)
                        print("Weather fetch success")
                    } catch {
                        print("Error fetching weather")
                    }
                    do {
                        bg = backgroundForWeather(current_weather)
                    }
                    do {
                        fbg = backgroundForTimeOfDay(forecast.list![0].dtTxt)
                    }
                    do {
                        fg = foregroundColorForTimeOfDay(forecast.list![0].dtTxt)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView(location: .constant(LocationData.sampleData[0]), bg: Image("Page5"), fbg: Image("Night"), fg: .black)
}
