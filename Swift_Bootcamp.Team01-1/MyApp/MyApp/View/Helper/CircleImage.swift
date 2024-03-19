//
//  CircleImage.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//

import SwiftUI


struct CircleImage: View {
    var image: Image
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: width, height: height)
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image(systemName: "photo.circle"), width: 200, height: 200)
}


