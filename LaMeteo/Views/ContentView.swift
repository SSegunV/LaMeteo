//
//  ContentView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 02/12/2023.
//

import SwiftUI
import Charts

var data: [SampleWeather] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4)
]
struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("HOME")
                Text("Sunny | 30")
                Chart {
                    BarMark(
                        x: .value("Shape Type", data[0].type),
                        y: .value("Total Count", data[0].count)
                        )
                    BarMark(
                        x: .value("Shape Type", data[1].type),
                        y: .value("Total Count", data[1].count)
                        )
                    BarMark(
                        x: .value("Shape Type", data[2].type),
                        y: .value("Total Count", data[2].count)
                        )
                }
                .frame(height: 300)
                .padding()
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
    ContentView()
}
