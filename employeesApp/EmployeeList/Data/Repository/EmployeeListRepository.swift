//
//  EmployeeListRepository.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

class EmployeeListRepository: EmployeeListRepositoryProtocol {
    
    let dataSource: EmployeeListDataSourceProtocol
    
    init(dataSource: EmployeeListDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func ObtainData() async -> Result<[Employee], employeeDomainError> {
        return await dataSource.obtainData()
    }
}


