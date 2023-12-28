//
//  BackgroundTest.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 23/12/2023.
//

import SwiftUI

struct BackgroundTest: View {
    var current_weather: WeatherData
    var forecast: ForecastData
    var body: some View {
        
        VStack {
            Text("Hello World")
        }
        .background(backgroundForTimeOfDay(forecast.list![0].dtTxt))
    }
}

#Preview {
    BackgroundTest(current_weather: WeatherData.sampleData[1],
                   forecast: ForecastData.sampleData)
}
