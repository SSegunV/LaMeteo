//
//  CardView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 18/12/2023.
//

import SwiftUI

struct CardView: View {
    //@State var current_weather: WeatherData
    @Binding var location: LocationData
    @State private var current_weather = WeatherData.sampleData[2]
    
    // Card view to display location conditions in list
    var body: some View {
        VStack (alignment: .leading) {
            Text(location.place)
                .font(.headline)
                .onAppear {
                    Task {
                        do {
                            current_weather = try await fetchWeather(lon: location.coord.lon!, lat: location.coord.lat!)
                            print("success")
                        } catch {
                            print(error)
                        }
                    }
                }
            Spacer()
            HStack {
                Text("\(current_weather.name) | \(current_weather.weather[0].main!)")
                Spacer()
                Text("\(String(current_weather.main.temp!))˚")
            }
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var current_weather = WeatherData.sampleData[0]
    static var previews: some View {
        CardView(location: .constant(LocationData.sampleData[0]))
    }
}
