//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 19.01.2024.
//

import Foundation
import Swinject

func main() {
    First()
    Second()
    Third()
}

main()

func First() {
    let contaner = Container()
    contaner.register(NetworkService.self) { _ in NetworkServiceImpl() }
    contaner.register(DatabaseService.self) { _ in ReleaseDatabaseServiceImpl() }
    contaner.register(UserRepository.self) { r in
        UserRepository(networkService: r.resolve(NetworkService.self)!, databaseService: r.resolve(DatabaseService.self)!)
    }
    let userRepository = contaner.resolve(UserRepository.self)!
    userRepository.UpdataData()
    let userRepository2 = contaner.resolve(UserRepository.self)!
    print(userRepository === userRepository2)
    print(userRepository.networkService.GetUsers()[0].id)
    print(userRepository2.networkService.GetUsers()[0].id)
}

func Second() {
    let contaner = Container()
    contaner.register(NetworkService.self) { _ in NetworkServiceImpl() }
    contaner.register(DatabaseService.self, name: "release") { _ in ReleaseDatabaseServiceImpl() }
    contaner.register(DatabaseService.self, name: "debug") { _ in DebugDatabaseServiceImpl() }
    contaner.register(UserRepository.self, name: "release") { r in
        UserRepository(networkService: r.resolve(NetworkService.self)!, databaseService: r.resolve(DatabaseService.self, name: "release")!)
    }
    contaner.register(UserRepository.self, name: "debug") { r in
        UserRepository(networkService: r.resolve(NetworkService.self)!, databaseService: r.resolve(DatabaseService.self, name: "debug")!)
    }
    let userRepository = contaner.resolve(UserRepository.self, name: "release")!
    userRepository.UpdataData()
    let userRepository2 = contaner.resolve(UserRepository.self, name: "debug")!
    userRepository2.UpdataData()
}

func Third() {
    let contaner = Container()
    contaner.register(NetworkService.self) { _ in NetworkServiceImpl() }
    contaner.register(DatabaseService.self) { _ in ReleaseDatabaseServiceImpl() }
    contaner.register(UserRepository.self) { r in
        UserRepository(networkService: r.resolve(NetworkService.self)!, databaseService: r.resolve(DatabaseService.self)!)
    }
    .inObjectScope(.container)
    let userRepository = contaner.resolve(UserRepository.self)!
    userRepository.UpdataData()
    let userRepository2 = contaner.resolve(UserRepository.self)!
    print(userRepository === userRepository2)
    print(userRepository.networkService.GetUsers()[0].id)
    print(userRepository2.networkService.GetUsers()[0].id)
}
