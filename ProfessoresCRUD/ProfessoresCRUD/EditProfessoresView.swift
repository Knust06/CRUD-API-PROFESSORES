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
   //Vai receber o objeto a ser alterado
    @State var professor : ProfessorModel
    
    var body: some View {
        Form {
            Section {
                VStack{
                    Text("Nome")
                    TextField("Nome", text: $nome)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                VStack{
                    Text("Email")
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                
                    .onAppear(){
                        self.nome = professor.nome
                        self.email = professor.email
                    }
                HStack{
                    Button("Edit"){ //Como eu faço para colocar o onappear /e o id no update
                        viewModel.updateProfessores(id: professor.id , nome: nome , email: email)
                        dismiss()
                    }
                }
            }
        }
    }
}

