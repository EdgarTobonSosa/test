//
//  EmployeeListRepositoryProtocol.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

protocol EmployeeListRepositoryProtocol {
    
    func ObtainData() async -> Result<[Employee], employeeDomainError>
    
}
