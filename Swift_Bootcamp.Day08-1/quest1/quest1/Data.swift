//
//  main.swift
//  quest1
//
//  Created by Юсуп Оздоев on 19.01.2024.
//

import Foundation

class User {
    var id: Int
    var firstName: String
    var lastName: String
    var single: Bool
    
    init(id: Int, firstName: String, lastName: String, single: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.single = single
    }
}

protocol NetworkService {
    func GetUsers() -> [User]
}

class NetworkServiceImpl: NetworkService {
    private var data: [User]
    func GetUsers() -> [User] {
        return data
    }
    init() { 
        let Aup = User(id: 1, firstName: "Aup", lastName: "Ozdoev", single: false)
        let Islam = User(id: 2, firstName: "Islam", lastName: "Ozdoev", single: true)
        let Usup = User(id: 3, firstName: "Usup", lastName: "Ozdoev", single: true)
        let Miki = User(id: 4, firstName: "Miki", lastName: "Ozdoev", single: true)
        data = [Aup, Islam, Usup, Miki]
    }
}

protocol DatabaseService {
    func SaveUsers(users: [User])
}

class ReleaseDatabaseServiceImpl: DatabaseService {
    func SaveUsers(users: [User]) {
        print("Release: \(users)were saved")
    }
    init() { }
}

class DebugDatabaseServiceImpl: DatabaseService {
    func SaveUsers(users: [User]) {
        print("Debug: \(users)were saved")
    }
    init() { }
}

class UserRepository {
    var networkService: NetworkService
    var databaseService: DatabaseService
    func UpdataData() { 
        let r = networkService.GetUsers()
        r[0].id = 32
        databaseService.SaveUsers(users: r)
    }
    init(networkService: NetworkService, databaseService: DatabaseService) {
        self.networkService = networkService
        self.databaseService = databaseService
    }
}
