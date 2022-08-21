//
//  Tests.swift
//  Bookworm
//
//  Created by Pat on 2022/08/21.
//

import SwiftUI

//MARK: - App Storage
struct AppStorageTest: View{
    @AppStorage("notes") private var notes = ""
    var body: some View{
        NavigationView{
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}


//MARK: - Binding Test
struct BindingTest: View{
    @State private var remmberMe = false
    var body: some View{
        VStack {
//            Toggle("Remeber Me", isOn: $remmberMe)
            PushButton(title: "Remember me ", isON: $remmberMe)
            Text(remmberMe ? "On" : "Off")
        }
    }
}
struct PushButton: View{
    let title: String
    @Binding var isON: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View{
        Button(title){
            isON.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isON ? onColors : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isON ? 0 : 5)
    }
}


//MARK: - Core Data Saving and calling

struct coreTest: View{
    @Environment(\.managedObjectContext) var moc
    ///make a new fetch request with no sotrting , and put the resiults in a students arrau
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    var body: some View{
        VStack{
            List(students) { student in
                Text(student.name ?? "Unkown")
            }
            //Add students
            Button("Add"){
                let firstName = ["Ginny", "Sans", "Helvetice", "Comic Sans"]
                let lastNames = ["A","B","A+","D"]
                
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                //MARK: - Call the obejct we want to save
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName)  \(chosenLastName)"
                //MARK: - save to context
                try? moc.save()
            }
        }
    }
}
