//
//  ObtainEmployeeList.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

protocol ObtainEmployeeListProtocol {
    
    func execute() async -> Result<[Employee],employeeDomainError>
}


enum employeeDomainError: Error {
    case generic
    case emptyEmployees
}
