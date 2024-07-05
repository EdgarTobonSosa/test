//
//  EmployeeListFactory.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

class EmployeeListFactory {
    
    func buildDataSource() -> EmployeeListDataSourceProtocol {
        return EmployeeListRemoteSource()
    }
    
    func buildRepository() -> EmployeeListRepositoryProtocol {
        return EmployeeListRepository(dataSource: buildDataSource())
    }
    
    func build() -> ObtainEmployeeListProtocol {
        return ObtainEmployeeList(repository: buildRepository())
    }
}
