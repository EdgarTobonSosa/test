//
//  ObtainEmployeeList.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

class ObtainEmployeeList: ObtainEmployeeListProtocol {
    
    let repository: EmployeeListRepositoryProtocol
    
    
    init(repository: EmployeeListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Employee], employeeDomainError> {
        return await repository.ObtainData()
    }
}


