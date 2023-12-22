//
//  LaMeteoApp.swift
//  LaMeteo
//
//  Created by Victor Jegede on 14/12/2023.
//

import SwiftUI
//@Binding var locations: [LocationData]
//@Binding var current_weather: WeatherData
@main
struct LaMeteoApp: App {
    @StateObject private var store = LocationStore()
    
    var body: some Scene {
        WindowGroup {
            LocationsView(locations: $store.locations) {
                Task {
                    do { try await store.save(locations: store.locations)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
