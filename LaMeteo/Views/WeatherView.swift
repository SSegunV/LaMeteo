//
//  ContentView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 02/12/2023.
//

import SwiftUI
import Charts

var sampleData: [SampleWeather] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4)
]
struct WeatherView: View {
    var body: some View {
        ZStack {
            VStack {
                
                // Weather Display
                Text("HOME")
                HStack {
                    VStack {
                        Text("33˚")
                        Text("29˚")
                    }
                    Text("30˚")
                }
                
                // Hour Forecast
                Chart {
                    BarMark(
                        x: .value("Shape Type", sampleData[0].type),
                        y: .value("Total Count", sampleData[0].count)
                        )
                    BarMark(
                        x: .value("Shape Type", sampleData[1].type),
                        y: .value("Total Count", sampleData[1].count)
                        )
                    BarMark(
                        x: .value("Shape Type", sampleData[2].type),
                        y: .value("Total Count", sampleData[2].count)
                        )
                }
                .frame(height: 300)
                .padding()
                
                // Additional data
                HStack{
                    VStack{
                        Label("Feels Like", systemImage: "thermometer")
                        Text("30")
                    }
                    Spacer()
                    VStack{
                        Label("Humidity", systemImage: "humidity")
                        Text("5.3")
                    }
                    Spacer()
                    VStack{
                        Label("Visibility", systemImage: "eye")
                        Text("40")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    WeatherView()
}
