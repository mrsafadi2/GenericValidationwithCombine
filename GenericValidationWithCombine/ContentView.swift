//
//  ContentView.swift
//  GenericValidationWithCombine
//
//  Created by Mohammed Safadi Macbook Pro on 24/12/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var formVM:FormViewModel = FormViewModel()
    @State var isSaveDisabled = true

    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Personal Information")) {
                    TextEntry(symbolName: "person", placeholder: "Your Email", field: $formVM.name)
                        .validation(formVM.nameValidation)

                    TextEntry(symbolName: "phone", placeholder: "Your Mobile", field: $formVM.mobile)
                        .validation(formVM.mobileValidation)

                    TextEntry(symbolName: "lock", placeholder: "Your PAssword", field: $formVM.password,isSecure: true)
                        .validation(formVM.paswordValidation)
                        .validation(formVM.leastPasswordValidation)
                 }
                  Button(action: {
                      
                 }, label: {
                     Text("Submit").font(.headline)
                         .padding()
                })
                .disabled(self.isSaveDisabled)
            }
            .navigationTitle("Form")
            .onReceive(formVM.allValidation) { validation in
                self.isSaveDisabled = !validation.isSuccess
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
