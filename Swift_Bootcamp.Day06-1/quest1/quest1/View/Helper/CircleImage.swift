//
//  CircleImage.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//

import SwiftUI

struct CircleImage: View {
    var urlPath: String

    var body: some View {
        AsyncImage(url: URL(string: urlPath)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(urlPath:  "https://files.betamax.raywenderlich.com/attachments/collections/194/e12e2e16-8e69-432c-9956-b0e40eb76660.png")
}


