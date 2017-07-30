//
//  TarefaUserDefault.swift
//  ListaTarefas
//
//  Created by Guilherme Pires on 29/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class TarefaUserDefault {

    let chave = "listaTarefas"
    var tarefas: [String] = []
    
    func salvar(tarefa: String){
       
        //RECUPERAR DADOS
        self.tarefas = self.listar()
        
        // SALVA
        self.tarefas.append(tarefa)
        UserDefaults.standard.set(self.tarefas, forKey: self.chave)
    }
    
    func listar() -> Array<String> {
        
        let dados = UserDefaults.standard.object(forKey: self.chave)
        
        if dados != nil {
            
            return dados as! Array<String>
        }
        
        return []
    }
    
    func remover(indice: Int) {
        
        //RECUPERAR DADOS
        self.tarefas = self.listar()
        
        //REMOVE ITEM
        tarefas.remove(at: indice)
        
        //SALVA
        UserDefaults.standard.set(self.tarefas, forKey: self.chave)

    }
}
