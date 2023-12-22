//
//  WeatherBoxView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 20/12/2023.
//

import SwiftUI

struct WeatherBoxView: View {
    @Binding var location: LocationData
    @Binding var current_weather: WeatherData
    
    var body: some View {
        Text(location.place)
            .textCase(.uppercase)
        HStack {
            VStack {
                Text(
                    String(format: "%.0f˚", current_weather.main.temp_max!)
                    )
                Text(
                    String(format: "%.0f˚", current_weather.main.temp_min!)
                    )
            }
            Text(
                String(format: "%.0f˚", current_weather.main.temp!)
                )
        }
    }
}

#Preview {
    WeatherBoxView(location: .constant(LocationData.sampleData[0]), current_weather: .constant(WeatherData.sampleData[0]))
}
