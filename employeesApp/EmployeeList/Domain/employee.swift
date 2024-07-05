//
//  employee.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

struct EmployeeResponse: Codable {
    let status: String
    let data: [Employee]
    let message: String
    
    enum CodignKeys: String, CodingKey {
        case status, data, message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodignKeys.self)
        
        self.status = try container.decode(String.self, forKey: .status)
        self.data = try container.decode([Employee].self, forKey: .data)
        self.message = try container.decode(String.self, forKey: .message)
    }
}

struct Employee: Codable, Identifiable {
    let id: Int
    let name: String
    let salary: Int
    let age: Int
    let image: String
    
    enum CodignKeys: String,CodingKey {
        case id = "id"
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case image = "profile_image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodignKeys.self)
        
        self.id  = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.salary = try container.decode(Int.self, forKey: .salary)
        self.age = try container.decode(Int.self, forKey: .age)
        self.image = try container.decode(String.self, forKey: .image)
    }
    
    init(id: Int, name: String, salary: Int, age: Int, image: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
        self.image = image
    }
}


struct DetailEmployeeResponse: Codable {
    let status: String
    let data: Employee
    let message: String
    
    enum CodignKeys: String, CodingKey {
        case status, data, message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodignKeys.self)
        
        self.status = try container.decode(String.self, forKey: .status)
        self.data = try container.decode(Employee.self, forKey: .data)
        self.message = try container.decode(String.self, forKey: .message)
    }
}


import Foundation



struct Welcome: Codable {
    let status: String
    let data: DataClass
    let message: String
    
    enum CodignKeys: String, CodingKey {
        case status, data, message
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.data = try container.decode(DataClass.self, forKey: .data)
        self.message = try container.decode(String.self, forKey: .message)
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.employeeName = try container.decode(String.self, forKey: .employeeName)
        self.employeeSalary = try container.decode(Int.self, forKey: .employeeSalary)
        self.employeeAge = try container.decode(Int.self, forKey: .employeeAge)
        self.profileImage = try container.decode(String.self, forKey: .profileImage)
    }
    init(id: Int, employeeName: String, employeeSalary: Int, employeeAge: Int, profileImage: String) {
        self.id = id
        self.employeeName = employeeName
        self.employeeSalary = employeeSalary
        self.employeeAge = employeeAge
        self.profileImage = profileImage
    }
}
