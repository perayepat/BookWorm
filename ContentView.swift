//
//  ContentView.swift
//  Bookworm
//
//  Created by Pat on 2022/08/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)//makesit easier when you have two of the same books but different authors
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books) {book in
                    NavigationLink{
                        DetailView(book: book)
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
                }.onDelete { IndexSet in
                    deleteBooks(at: IndexSet)
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
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
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets{
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

