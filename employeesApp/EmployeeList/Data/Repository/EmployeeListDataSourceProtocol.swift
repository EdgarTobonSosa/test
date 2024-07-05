//
//  EmployeeListDataSourceProtocol.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

protocol EmployeeListDataSourceProtocol {
    func obtainData() async -> Result<[Employee], employeeDomainError>
}
