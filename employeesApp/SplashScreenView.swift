//
//  SplashScreenView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

struct SplashScreenView: View {

    @State private var showSplash = true
    @Binding var path: NavigationPath
    var body: some View {
        if showSplash{
            VStack{
                Image(systemName: "network.badge.shield.half.filled")
                    .resizable()
                    .frame(width: 80,height: 80)
                
                Text("Test")
                    .bold()
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0 ){
                    self.showSplash = false
                }
            }
        }else {
            LoginView()
        }
        
    }
}

#Preview {
    SplashScreenView(path: Binding.constant(NavigationPath()))
}

