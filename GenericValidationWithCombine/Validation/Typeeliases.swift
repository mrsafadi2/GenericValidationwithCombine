//
//  Typeeliases.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import Foundation
import Combine

typealias ValidationErrorClosure = () -> String
typealias ValidationPublisher = AnyPublisher<Validation, Never>

