//
//  TestApp2_0App.swift
//  TestApp2.0
//
//  Created by Руслан Плешкунов on 24.10.2024.
//

import SwiftUI
import SwiftData

@main
struct TestApp2_0App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataUser.self)
    }
}
