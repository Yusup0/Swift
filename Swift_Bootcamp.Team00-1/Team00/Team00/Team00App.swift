//
//  Team00App.swift
//  Team00
//
//  Created by Юсуп Оздоев on 07.01.2024.
//

import SwiftUI

@main
struct Team00App: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
