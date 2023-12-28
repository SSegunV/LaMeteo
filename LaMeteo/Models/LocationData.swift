//
//  LocationData.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 20/12/2023.
//

import Foundation

struct LocationData: Identifiable, Codable {
    let id: UUID
    var place: String
    var coord: Coord
    
    init(id: UUID = UUID(), place: String, coord: Coord) {
        self.id = id
        self.place = place
        self.coord = coord
    }
    
    static let sampleData: [LocationData] =
    [
        LocationData(place: "Home", coord: Coord(lon: 0.19, lat: 51.50)),
    LocationData(place: "Tax Office", coord: Coord(lon: 55.12, lat: -20.70))
    ]
    
    static let emptyLocation: LocationData =
    LocationData(place: "", coord: Coord(lon: 0.00, lat: 0.00))
}
