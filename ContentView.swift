//
//  ContentView.swift
//  TestApp2.0
//
//  Created by Руслан Плешкунов on 24.10.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [DataUser]()
    @State private var showingAddUser: Bool = false
    
    @State private var sortOrder = [SortDescriptor(\DataUser.firstName)]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path){
            UserView(searchString: searchText, sortOrder: sortOrder)
            .navigationTitle("Пользователи")
            .navigationDestination(for: DataUser.self){ user in
                CreatedUserView(user: user)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Имя (А-Я)")
                            .tag([SortDescriptor(\DataUser.secondName)])
                        Text("Имя (Я-А)")
                            .tag([SortDescriptor(\DataUser.secondName, order: .reverse)])
                    }
                }
                //ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action: {
                        showingAddUser = true
                    }) {
                        Label("Добавить", systemImage: "plus")
                    }
                    
                }
            }
            .searchable(text: $searchText)
            .sheet(isPresented: $showingAddUser){
                CreatedUserView(user: DataUser(firstName: "", secondName: "", middleName: "", username: "", password: "", dateCreated: Date()))
                    .presentationCornerRadius(25)
            }
        }
    }
//}

#Preview {
    ContentView()
}
