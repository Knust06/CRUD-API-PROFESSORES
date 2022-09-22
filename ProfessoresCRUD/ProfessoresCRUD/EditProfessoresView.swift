//
//  EditProfessoresView.swift
//  ProfessoresCRUD
//
//  Created by user226741 on 9/22/22.
//

import SwiftUI

struct EditProfessoresView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : ViewModel
    
    @State var nome : String = ""
    @State var email : String = ""
    
    
    var body: some View {
        Form {
            Section {
                TextField("Nome", text: $nome)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .onAppear(){
                        
                    }
                HStack{
                    Button("Edit"){ //Como eu faço para colocar o onappear /e o id no update
                        viewModel.updateProfessores(id: \id , nome: nome , email: email)
                        dismiss()
                    }
                }
            }
        }
    }
}

