import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    @State var isAddView : Bool = false
    var body: some View {
        
        VStack{
            NavigationView{
                
                List{
                    
                    /**
                        o parâmetro id é utilizado para saber como identificar unicamente cada objeto. Para isso, ele espera qual atributo do PROFESSORMODEL possa ser utilizado para esta identificação. Então, temos que usar o  \.NOMEDAVARIAVEL.
                     */
                    ForEach(viewModel.items.sorted(by: {$0.id>$1.id}), id: \.id){ item in
                        
                        VStack{
                           // Text("\(item.nome)")
                               // .bold()
                           // Text("\(item.email)")
                               // .foregroundColor(.green)
                               // .italic()
                            NavigationLink(destination: EditProfessoresView(professor:item), label:{
                                Text("\(item.nome)")
                            })
                                
                    
                        }// Vstack
                    }// Foreach
                    .onDelete(perform: deleteProfessores)
                    
                } // List
                .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button {
                                    isAddView.toggle()
                                }//Button
                                label: {
                                    Label("Add", systemImage: "plus.circle")
                                }//label
                                
                            }//ToolbarItem
                   

                        }//toolbar
                        .sheet(isPresented: $isAddView){
                            AddProfessoresView()
                        }//sheet
            } // NavigationView
        }// VSTACK
    } // body
    //IndextSet é uma estrutura que retorna quais elementos foram selecionados para deletarmos
    //voce nao deleta pelo indice do array e sim pelo indice do objeto
    func deleteProfessores(offset : IndexSet){
        
        // eu posso ter um array de IDs para ser excluídos EX: [1, 500]
        let idArrays = offset.map({
            //pego o id do objeto que preciso deletar através do índice do vetor selecionado, que está no IndexSet
            viewModel.items[$0].id
        })
        // Para cada elemento (id do professor) que queremos deletar, temos que fazer uma requisição para API
        for i in idArrays{
            viewModel.deleteProfessores(id: i)
        }
        
        
    }
}

struct ButtonsTestView : View{
    
    var body: some View{
        
        
        Button("Add"){
            ViewModel().createProfessor(nome: "Fabrizio V", email: "TTT7")
        }
        
        Button("Update"){
            ViewModel().updateProfessores(id: 630, nome: "Fabrizio GGGG", email: "YJFJFK")
        }
        
        Button("Delete"){
            ViewModel().deleteProfessores(id: 630)
        }
        Button("Stress Button"){
            ViewModel().fetchProfessores()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
