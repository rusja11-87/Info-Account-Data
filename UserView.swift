//
//  UserView.swift
//  TestApp2.0
//
//  Created by Руслан Плешкунов on 28.10.2024.
//

import SwiftUI
import SwiftData

struct UserView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [DataUser]

    var body: some View {
        List{
            ForEach(users){ user in
                NavigationLink(value: user){
                    VStack(alignment: .listRowSeparatorLeading) {
                        Text("\(user.firstName) \(user.middleName)")
                        Text("\(user.username)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .onDelete(perform: deleteUser)
        }
    }
    
    init(searchString: String = "", sortOrder:[SortDescriptor<DataUser>] = []){
        _users = Query(filter: #Predicate{ user in
            if searchString.isEmpty {
                true
            } else {
                user.firstName.localizedStandardContains(searchString)
                || user.secondName.localizedStandardContains(searchString)
                || user.username.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteUser(at offsets: IndexSet) {
        for offset in offsets {
            let user = users[offset]
            modelContext.delete(user)
        }
    }
}

#Preview {
    UserView()
}

