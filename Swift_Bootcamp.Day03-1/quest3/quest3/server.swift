//
//  server.swift
//  quest3
//
//  Created by Юсуп Оздоев on 31.12.2023.
//

import Foundation

protocol PlayerAction {
    func findOpponent() -> Profile?
}

class Server : PlayerAction {
    var players = [Profile]()
    let address: String
    init(_ address: String) {
        self.address = address
    }
    func findOpponent() -> Profile? {
        for player in players {
            if player.status == Profile.Status.SEARCH {
                return player
            }
        }
        return nil
    }
}
