//
//  LoginViewModel.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject {
    
    @Published var inputValidationID: String = "input ID"
    
    var cancellables = Set<AnyCancellable>()
    
    
    init(){
        
    }
    
    func startValidation() {
        $inputValidationID.sink { status in
            switch status {
            case .finished:
                return
            case .failure(_):
                return
            }
        } receiveValue: { it in
            self.inputValidationID = it
        }
        .store(in: &cancellables)

    }
    
}
