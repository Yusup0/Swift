//
//  profile.swift
//  quest3
//
//  Created by Юсуп Оздоев on 31.12.2023.
//

import Foundation

class Profile {
    enum Status {
        case IN_PLAY
        case SEARCH
        case IDLE
        case OFFLINE
    }
    let uuid = NSUUID().uuidString
    var nickname: String?
    var age: Int?
    var name: String?
    var revolver: RevolverMoonClip?
    var status: Status?
    let date: String = String(describing: NSDate())
    lazy var link: String = {
        return "http://gameserver.com/${\(uuid)}-${\(String(describing: nickname))}"
    }()    
    var playerActionDelegate: PlayerAction?

    init(nickname: String? = nil, age: Int? = nil, name: String? = nil, revolver: RevolverMoonClip? = nil, status: Status? = nil, playerActionDelegate: PlayerAction? = nil) {
        self.nickname = nickname
        self.age = age
        self.name = name
        self.revolver = revolver
        self.status = status
        self.playerActionDelegate = playerActionDelegate
    }
    
    func Search() {
        print("Start Search")
        print("SearcherProfile:")
        print("\(String(describing: nickname)), \(String(describing: status))")
        if let server = playerActionDelegate as? Server {
            for player in server.players {
                print("\(String(describing: player.nickname)), \(String(describing: player.status)) ")
            }
        }
        
        status = Status.SEARCH
        var opponent = playerActionDelegate?.findOpponent()
        
        print("Result Search")
        print("SearcherProfile:")
        print("\(String(describing: nickname)), \(String(describing: status))")
        print("Opponent:")
        print("\(String(describing: opponent?.nickname)), \(String(describing: opponent?.status))")
        
        status = Status.IN_PLAY
        opponent?.status = Status.IN_PLAY
        print("ServerProfiles:")
        if let server = playerActionDelegate as? Server {
            for player in server.players {
                print("\(String(describing: player.nickname)), \(String(describing: player.status)) ")
            }
        }
    }
    
    
}

