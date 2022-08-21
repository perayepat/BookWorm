//
//  ContentView.swift
//  Bookworm
//
//  Created by Pat on 2022/08/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books) {book in
                    NavigationLink{
                        Text(book.title ?? "")
                    } label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                            
                            VStack(alignment: .leading){
                                Text(book.title ?? "")
                                    .font(.headline)
                                
                                Text(book.author ?? "")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
        }.sheet(isPresented: $showingAddScreen) {
            AddBookView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

