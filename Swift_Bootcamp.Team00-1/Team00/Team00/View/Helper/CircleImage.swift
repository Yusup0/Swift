//
//  CircleImage.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//

import SwiftUI

struct CircleImage: View {
    var image: AsyncImage<Image>

    var body: some View {
        image
            .scaleEffect(CGSize(width: 0.2, height: 0.2))
            .frame(width: 200, height: 200)
//            .clipShape(Circle())
//            .overlay {
//                Circle().stroke(.white, lineWidth: 4)
//            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: AsyncImage<Image>(url: URL(string: "https://ozisapp.ru/file/download/")))
}

