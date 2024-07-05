//
//  employeesAppApp.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

@main
struct employeesAppApp: App {
    @State private var path = NavigationPath()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                SplashScreenView(path: $path)
            }
           
        }
    }
}
