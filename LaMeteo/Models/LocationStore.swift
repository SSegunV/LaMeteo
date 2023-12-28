//
//  LocationStore.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 21/12/2023.
//

import Foundation

@MainActor
class LocationStore: ObservableObject {
    @Published var locations: [LocationData] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("locations.data")
    }
    
    func load() async throws {
        let task = Task<[LocationData], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let userLocations = try JSONDecoder().decode([LocationData].self, from: data)
            return userLocations
        }
        let locations = try await task.value
        self.locations = locations
    }
    
    func save(locations: [LocationData]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(locations)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
