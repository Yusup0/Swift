//
//  dto.swift
//  quest1
//
//  Created by Юсуп Оздоев on 17.01.2024.
//

import Foundation


struct FlightList: Decodable {
    var flights: [Flight]
}

struct Flight: Identifiable, Decodable {
    var id: String
    var aircraftType: AircraftType
    var flightName: String
    var publicFlightState: PublicFlightStateType
    var route: RouteType
    var airlineCode: Int
    var flightDirection: String
    var scheduleDate: String
    var scheduleTime: String
    var terminal: Int?
}

struct RouteType: Decodable {
    var destinations: [String]
    var eu: String
    var visa: Bool
}

struct PublicFlightStateType: Decodable {
    var flightStates: [String]
}

struct AircraftType: Decodable {
    var iataMain: String
    var iataSub: String
}

protocol IObjectService {
    var urlRequest: URLRequest { get set }
    func GetData(completion: @escaping (FlightList?) -> ()) 
}
