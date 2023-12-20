//
//  CardView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 18/12/2023.
//

import SwiftUI

struct CardView: View {
    let current_weather: WeatherData
    
    // Card view to display location conditions in list
    var body: some View {
        VStack (alignment: .leading) {
            Text("Mum's House")
                .font(.headline)
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
        CardView(current_weather: current_weather)
    }
}
