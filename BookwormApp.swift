//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Pat on 2022/08/21.
//

import SwiftUI

@main
struct BookwormApp: App {
    //inject the Bookworm model into our app to make it globally persistant
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment( \.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
