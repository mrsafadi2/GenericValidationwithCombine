//
//  Validation.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import Foundation

enum Validation {
    case success
    case failure(message: String)
    
    var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }
}

