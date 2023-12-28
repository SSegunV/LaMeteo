//
//  WeatherBoxView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 20/12/2023.
//

import SwiftUI

struct WeatherBoxView: View {
    @Binding var location: LocationData
    @Binding var current_weather: WeatherData
    
    var body: some View {
        VStack {
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
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.23))
            )
    }
}

#Preview {
    WeatherBoxView(location: .constant(LocationData.sampleData[0]), current_weather: .constant(WeatherData.sampleData[0]))
}
