//
//  PublisherExtention.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import Foundation
import Combine
 
extension Published.Publisher where Value == String {
    
    func nonEmptyValidator(_ errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return ValidationPublishers.nonEmptyValidation(for: self, errorMessage: errorMessage())
    }
    
    func leastValidation(_ errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return ValidationPublishers.leastValidation(for: self, errorMessage: errorMessage())
    }
    
    
}
   
