//
//  ContentView.swift
//  ProfessoresCRUD
//
//  Created by user226741 on 9/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button("Add") {
                ViewModel().createProfessor(nome: "Fabrizio V", email: "ttt7")
            }
            Button("Update") {
                ViewModel().updateProfessores(id: 558, nome: "Fabriziooo", email: "ttt7tt")
            }
            Button("Delete") {
                ViewModel().deleteProfessores(id: 635)
            }
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
