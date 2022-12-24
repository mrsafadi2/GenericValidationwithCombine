//
//  FormViewModel.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import Foundation
import Combine

class FormViewModel:ObservableObject {
    
    @Published var name: String = ""
    @Published var mobile: String = ""
    @Published var password:String = ""
 
    
    lazy var nameValidation: ValidationPublisher = {
        $name.nonEmptyValidator("Name must be provided")
    }()
    lazy var mobileValidation: ValidationPublisher = {
        $mobile.nonEmptyValidator("Mobile must be provided")
    }()
    lazy var paswordValidation: ValidationPublisher = {
        $password.nonEmptyValidator("Password must be provided")
    }()
    lazy var leastPasswordValidation: ValidationPublisher = {
         $password.leastValidation("Password must be at leat 3 characters")
    }()
    
    
    lazy var allPasswordValidation:ValidationPublisher  = {
        Publishers.CombineLatest(paswordValidation , leastPasswordValidation)
            .map{ value1 , value2 in
                print("password: \(value2)")

                return [value1, value2].allSatisfy { $0.isSuccess } ? .success : .failure(message: "")
            }.eraseToAnyPublisher()
    }()
    
    lazy var allValidation: ValidationPublisher = {
        Publishers.CombineLatest3(
            nameValidation,
            mobileValidation,
            allPasswordValidation
        ).map { nameValue, mobileValue , passwordValue in
            return [nameValue, mobileValue , passwordValue].allSatisfy { $0.isSuccess } ? .success : .failure(message: "")
        }.eraseToAnyPublisher()
    }()
    
}

 
