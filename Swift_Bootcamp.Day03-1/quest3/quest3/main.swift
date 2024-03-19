//
//  main.swift
//  quest3
//
//  Created by Юсуп Оздоев on 31.12.2023.
//

import Foundation

func main() {
    var player = Profile(nickname: "coolpicker", status: Profile.Status.IDLE)
    
    var server = Server("8.8.8.8")
    server.players = [Profile(nickname: "super3228", status: Profile.Status.IDLE), Profile(nickname: "lrdxg", status: Profile.Status.SEARCH),
                      Profile(nickname: "kmaw", status: Profile.Status.IN_PLAY), Profile(nickname: "aveelyr", status: Profile.Status.SEARCH),
                      player]
    
    print("SearcherProfile:")
    print("\(String(describing: player.nickname)), \(String(describing: player.status))")
    
    print("ServerProfiles:")
    for player in server.players {
        print("\(String(describing: player.nickname)), \(String(describing: player.status)) ")
    }
    
    player.playerActionDelegate = server
    player.Search()
}

main()
