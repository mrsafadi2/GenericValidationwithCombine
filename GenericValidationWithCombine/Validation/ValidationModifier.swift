//
//  ValidationModifier.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import Foundation
import SwiftUI

struct ValidationModifier: ViewModifier {
    
    @State var latstValidation: Validation = .success
    let validationPublisher: ValidationPublisher
        
    func body(content: Content) -> some View {
        return VStack(alignment: .leading) {
            content
            validationMessage
        }.onReceive(validationPublisher) { validation in
            self.latstValidation = validation
        }
    }
    
    var validationMessage: some View {
        switch latstValidation {
        case .success:
            return AnyView(EmptyView())
        case .failure(let message):
            let text = Text(message)
                .foregroundColor(Color.red)
                .font(.caption)
            return AnyView(text)
        }
    }
}

extension View {
    
    func validation(_ validationPublisher: ValidationPublisher) -> some View {
        self.modifier(ValidationModifier(validationPublisher: validationPublisher))
    }
    
}
