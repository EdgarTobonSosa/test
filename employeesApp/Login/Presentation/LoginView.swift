//
//  LoginView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginVM = LoginViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            
            Image(systemName: "person.3")
                .resizable()
                .frame(width:200 ,height: 150)
                .foregroundStyle(Color.indigo)
            Text("Enter your user ID")
                .font(.system(size: 18,weight: .bold))
            
            TextEditor(text: $loginVM.inputValidationID)
                .font(.system(size: 16,weight: .regular))
                .foregroundStyle(Color.gray)
                .frame(height: 30)
                .padding()
                .cardStyle()

                .onTapGesture {
                    loginVM.inputValidationID = ""
                }
                           
                
            Spacer()
            
            NavigationLink {
                EmployeeListView()
            } label: {
                HStack {
                    Spacer()
                    Text("Login")
                        .font(.system(size: 16,weight: .bold))
                    Spacer()
                        
                    }
                
                .foregroundStyle(Color.white)
                .background {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(height: 50)
                        .padding([.leading,.trailing], 20)

                }
            }
            .padding(.bottom,50)
        }

    }
}

#Preview {
    LoginView()
}


