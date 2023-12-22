//
//  UserLocations.swift
//  LaMeteo
//
//  Created by Victor Jegede on 20/12/2023.
//

import Foundation

struct UserLocation: Identifiable, Codable {
    let id: UUID
    var place: String
    var coord: Coord
    
    init(id: UUID = UUID(), place: String, coord: Coord) {
        self.id = id
        self.place = place
        self.coord = coord
    }
    
    static let sampleData: [UserLocation] =
    [
    UserLocation(place: "The Crib", coord: Coord(lon: -0.21, lat: 51.51)),
    UserLocation(place: "Outside", coord: Coord(lon: 55.12, lat: -20.70))
    ]
    
    static let emptyLocation: UserLocation =
    UserLocation(place: "", coord: Coord(lon: 0.00, lat: 0.00))
}
