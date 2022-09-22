//
//  AddProfessoresView.swift
//  ProfessoresCRUD
//
//  Created by user226741 on 9/22/22.
//

import SwiftUI

struct AddProfessoresView: View {
    @EnvironmentObject var viewModel : ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var nome : String = ""
    @State var email : String = ""
    
    
    var body: some View {
        Form{
                    Section{
                        TextField("Username", text: $nome)
                            .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                    
                        HStack{
                            Button("Add"){
                                viewModel.createProfessor(nome: nome, email: email)
                                dismiss()
                            }//Button
                            Spacer()
                            
                        }//HStack
                    }//Section
                }//Form
    }
}

