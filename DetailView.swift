//
//  DetailView.swift
//  Bookworm
//
//  Created by Pat on 2022/08/21.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaleEffect()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 450)
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(book: )
//    }
//}
