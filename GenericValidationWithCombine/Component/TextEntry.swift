//
//  TextEntry.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import SwiftUI

struct TextEntry: View {
    var symbolName: String
    var placeholder: String
    @Binding var field: String
    var isSecure = false
   
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: symbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                    .frame(width: 20)
                if isSecure {
                    SecureField(placeholder, text: $field).frame(height: 50)
                } else {
                    TextField(placeholder, text: $field).frame(height: 50)
                }
            }.autocapitalization(.none)
            .padding(8)
            .background(Color(.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
         }
    }
}

struct TextEntry_Previews: PreviewProvider {
    static var previews: some View {
        TextEntry(symbolName: "envelope", placeholder: "Email Address", field: .constant(""))
    }
}
