//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 17.01.2024.
//

import Foundation

func main() {
    ObjectURLSessionService().GetData() { flights in
        if let flights = flights?.flights {
            for flight in flights {
                print("Id: \(flight.id), aircraft type: \(flight.aircraftType), flight name: \(flight.flightName), flight state: \(flight.publicFlightState), route: \(flight.route), schedule date: \(flight.scheduleDate), schedule time: \(flight.scheduleTime)")
            }
        }
    }
}

main()
let seconds = 4.0

try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
