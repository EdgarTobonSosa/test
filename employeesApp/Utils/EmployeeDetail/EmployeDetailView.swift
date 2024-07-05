//
//  EmployeDetailView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

struct EmployeDetailView: View {
    @StateObject var employeDetailVM:  EmployeeDetailViewModel
   
    var body: some View {
        
        switch employeDetailVM.state {
        case .idle:
            Text("")
                .onAppear{
                    employeDetailVM.obtainEmployeeDetail()
                }
        case .loading:
            Text("Loading")
        case .loaded:
            VStack {
                VStack(alignment: .leading) {
                    Text("ID: \(String(employee.id))")
                        .font(.system(size: 24,weight: .bold))
                        .padding(.bottom)
                    
                    HStack {
                        Text(employee.employeeName)
                        Spacer()
                        Text (String(employee.employeeAge))
                        
                    }
                    .font(.system(size: 24,weight: .bold))
                    .foregroundStyle(Color.gray)
                }
                .padding(.bottom, 40)
                
                Text ("$\(String(employee.employeeSalary))")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundStyle(SalaryValidator.tintSalary(employee.employeeSalary))
            }

        case .error:
            Text("error")
        }
        
            
        
    }
}

extension EmployeDetailView {
    var employee: DataClass{
        return employeDetailVM.employee.first ?? DataClass(id: 122342343, employeeName: "Edgar Tobón Sosa", employeeSalary: 10000, employeeAge: 25, profileImage: "")
}
}
#Preview {
    EmployeDetailView(employeDetailVM: EmployeeDetailViewModel(idEmployee: "1"))
}

class SalaryValidator {
    static func tintSalary(_ salary:Int ) -> Color {
        return salary > 1000 ? Color.green : Color.red
    }
}
