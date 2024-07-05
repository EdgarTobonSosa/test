//
//  EmployeeListViewModel.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

@MainActor
class EmployeeListViewModel: ObservableObject {
    
    @Published var employees = [Employee]()
    @Published var state: StateService = .idle

    let employeesUseCase: ObtainEmployeeListProtocol
    
    
    
    init(employeesUseCase: ObtainEmployeeListProtocol = EmployeeListFactory().build()) {        self.employeesUseCase = employeesUseCase
    }
    
    func ObtainEmployes() {
        Task {
            let result = await employeesUseCase.execute()
            
            guard let employeesResponse = try? result.get() else {
                guard case .failure(let domainError) = result else {
                    self.state = .error
                    return
                }
                switch domainError {
                case .emptyEmployees:
                    self.state = .error
                case .generic:
                    self.state = .error
                    return
                }
                self.state = .error
                return
            }
            self.employees = employeesResponse
            self.state = .loaded
        }
    }
    
}


enum StateService {
    case idle
    case loading
    case loaded
    case error
}
