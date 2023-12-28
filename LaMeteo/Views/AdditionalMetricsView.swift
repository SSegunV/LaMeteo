//
//  AdditionalMetricsView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 20/12/2023.
//

import SwiftUI

struct AdditionalMetricsView: View {
    @Binding var current_weather: WeatherData
    var body: some View {
        HStack{
            VStack{
                Label("Feels Like", systemImage: "thermometer")
                Text(
                    String(format: "%.0f˚", current_weather.main.feels_like!)
                )
                .multilineTextAlignment(.leading)
            }
            Spacer()
            VStack{
                Label("Humidity", systemImage: "humidity")
                Text(
                    String("\(current_weather.main.humidity!)%")
                )
                .multilineTextAlignment(.leading)
            }
            Spacer()
            VStack{
                Label("Visibility", systemImage: "eye")
                Text(
                    String("\(current_weather.visibility) m")
                )
                .multilineTextAlignment(.leading)
            }
        }
        .padding()
    }
}

#Preview {
    AdditionalMetricsView(current_weather: .constant(WeatherData.sampleData[0]))
}
