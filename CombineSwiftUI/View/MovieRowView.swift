//
//  MovieRowView.swift
//  CombineSwiftUI
//
//  Created by HardiB.Salih on 6/15/24.
//

import SwiftUI
import Kingfisher

struct MovieRowView: View {
    let movie: Movie
    var body: some View {
        ZStack(alignment: .bottomLeading ) {
            KFImage(movie.backdropURL)
                .resizable()
                .placeholder({ ProgressView() })
                .scaledToFill()
                .frame(width: .screenWidth - 32, height: 160)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
                .overlay {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.black.opacity(0.4))
                        .stroke(Color(.systemGray4), lineWidth: 2)
                }
            
            Text(movie.title)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
            
        }
    }
}

#Preview {
    MovieRowView(movie: .placeholder)
}
