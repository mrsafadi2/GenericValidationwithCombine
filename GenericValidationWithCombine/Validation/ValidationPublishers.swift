//
//  ValidationPublishers.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import Foundation
import Combine

class ValidationPublishers {
    
    static func nonEmptyValidation(for publisher: Published<String>.Publisher,
                                   errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return publisher.map { value in
            guard value.count > 0 else {
                return .failure(message: errorMessage())
            }
            return .success
        }
        .dropFirst()
        .eraseToAnyPublisher()
    }
    
    static func leastValidation(for publisher: Published<String>.Publisher,
                                   errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return publisher.map { value in
            guard value.count >= 3 else {
                return .failure(message: errorMessage())
            }
            return .success
        }
        .dropFirst()
        .eraseToAnyPublisher()
    }
}
