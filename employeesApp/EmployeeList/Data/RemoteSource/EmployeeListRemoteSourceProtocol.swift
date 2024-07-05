//
//  EmployeeListRemoteSourceProtocol.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

class EmployeeListRemoteSource: EmployeeListDataSourceProtocol {
    
    func obtainData() async -> Result<[Employee], employeeDomainError> {
        let endpoint = "http://dummy.restapiexample.com/api/v1/employees"
        
        guard let url = URL(string: endpoint) else {
            return .failure(.generic)
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let employeResponse = try JSONDecoder().decode(EmployeeResponse.self, from: data)
            return .success(EmployeMapperResponse.map(employeResponse))
        }catch{
            return.failure(.generic)
        }

    
    }
    
}

class EmployeMapperResponse {
    static func map(_ response: EmployeeResponse) -> [Employee] {
        return response.data
    }
}
