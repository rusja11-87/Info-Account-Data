//
//  CreatedUserView.swift
//  TestApp2.0
//
//  Created by Руслан Плешкунов on 24.10.2024.
//

import SwiftUI
import SwiftData

struct CreatedUserView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var user: DataUser
    @State private var trigger = false
    var body: some View {
        Form{
            Section("Информация о пользователе"){
                TextField("Фамилия", text: $user.secondName)
                TextField("Имя", text: $user.firstName)
                TextField("Отчество", text: $user.middleName)
                TextField("Логин", text: $user.username)
                    .textContentType(.username)
                    .textInputAutocapitalization(.never)
                TextField("Пароль", text: $user.password)
                DatePicker("Дата создания", selection: $user.dateCreated)
            }
            Button("Сохранить"){
                addUser()
                dismiss()
                trigger = true
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(.white)
            .font(.title2)
            .scrollContentBackground(.hidden)
            .listRowBackground(Color.blue)
            .sensoryFeedback(.impact, trigger: trigger)
            
            
        }
    }
    func addUser(){
        modelContext.insert(user)
    }
}

#Preview {
    CreatedUserView(user: DataUser(firstName: "", secondName: "", middleName: "", username: "", password: "", dateCreated: Date()))
}
