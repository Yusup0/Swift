//
//  ContentView.swift
//  Team00
//
//  Created by Юсуп Оздоев on 07.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RecipeList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
