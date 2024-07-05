//
//  EmployeeCard.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

struct EmployeeCard: View {
    let employee: Employee
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 40,height: 40)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("ID:")
                            .bold()
                        Text(String(employee.id))
                        
                    }
                    .font(.system(size: 14))
                    
                    
                    Text(employee.name)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.gray)
                        .bold()
                }
                Spacer()
                VStack(alignment: .leading) {
                    
                    Text("$"+String(employee.salary))
                        .foregroundStyle(SalaryValidator.tintSalary(employee.salary))
                        .font(.system(size: 20))
                        .bold()
                    
                    Text("Age: \(employee.age)")
                        .font(.system(size: 12))
                        .foregroundStyle(Color.gray)
                        .bold()
                }
            }
        }
        .padding()
    }
}

#Preview {
    EmployeeCard(employee: Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""))
}

