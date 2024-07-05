//
//  EmployeeListView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI


struct EmployeeListView: View {
    @StateObject var emplyeListVM = EmployeeListViewModel()
    var body: some View {
        EmployeeListViewPreview(
            employees: emplyeListVM.employees , stateSevice: emplyeListVM.state, action: {emplyeListVM.ObtainEmployes()})
    }
}

struct EmployeeListViewPreview: View {
    let employees: [Employee]
    let stateSevice: StateService
    let action: () -> ()
    @State private var showSlider = false
    
    var body: some View {
        
        switch stateSevice {
        case .idle:
            Text("")
                .onAppear{
                    action()
                }
            
        case .loading:
            Text("Loading...")
        case .loaded:
            
            VStack {
                
                HStack {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .onTapGesture {
                            self.showSlider.toggle()
                        }
                    Spacer()
                }
                .padding(.leading, 25)
                .padding(.bottom, 15)
                
                
                ScrollView {
                    ForEach((0...(employees.count - 1)),id:\.self) { index in
                        NavigationLink {
                            EmployeDetailView(employeDetailVM: EmployeeDetailViewModel(idEmployee: String(index + 1)))
                        } label: {
                            EmployeeCard(employee: employees[index])
                                .cardStyle()
                        }

                        
                    }
                    .padding([.leading,.trailing], 15)
                }
            }
            .overlay {
                if showSlider {
                    HStack {
                        SliderView(employeeName: "Edgar Tobon", showSlider: $showSlider)
                            .frame(width:UIScreen.main.bounds.width/1.5 )
                            .background{
                                Color.white
                            }
                        Spacer()
                    }

                }
                
            }
            
        case .error:
            Text("Error")
        }
       
    }
}

#Preview {
    EmployeeListViewPreview(employees: [
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: "")
    ],
                            stateSevice: .loaded,
                            action: {}
    )
}


