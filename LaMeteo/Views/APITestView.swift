//
//  APITest View.swift
//  LaMeteo
//
//  Created by Victor Jegede on 16/12/2023.
//

import SwiftUI

struct APITest_View: View {
    
    var body: some View {
        Text("Hello World")
        
        Button("Get Weather") {
            // Call function
            Task {
                do {
                    let sample = try await fetchForecast(lon: -0.21, lat: 51.51)
                    print(sample)
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    APITest_View()
}
