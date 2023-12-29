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
                .dynamicTypeSize(.xxLarge)
            HStack {
                VStack {
                    Text(
                        String(format: "%.0f˚", current_weather.main.temp_max!)
                    )
                    .dynamicTypeSize(.xSmall)
                    Text(
                        String(format: "%.0f˚", current_weather.main.temp_min!)
                    )
                    .dynamicTypeSize(.small)
                }
                Text(
                    String(format: "%.0f˚", current_weather.main.temp!)
                )
                .dynamicTypeSize(.xxLarge)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 10, style: .continuous)
            )
    }
}

#Preview {
    WeatherBoxView(location: .constant(LocationData.sampleData[0]), current_weather: .constant(WeatherData.sampleData[0]))
}
