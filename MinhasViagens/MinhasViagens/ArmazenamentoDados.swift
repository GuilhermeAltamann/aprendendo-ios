//
//  ArmazenamentoDados.swift
//  MinhasViagens
//
//  Created by Guilherme Pires on 03/09/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class ArmazenamentoDados{
    
    let chaveArmazenamento = "locaisViagem"
    var viagens:[Dictionary<String, String>] = []
    
    func getDefaults() -> UserDefaults{
        
        return UserDefaults.standard
    }
    
    func salvarViagem(viagem: Dictionary<String, String>){
        
        self.viagens = listarViagens()
        
        self.viagens.append(viagem)
        
        self.getDefaults().set(self.viagens, forKey: self.chaveArmazenamento)
        self.getDefaults().synchronize()
    }
    
    func listarViagens() -> [Dictionary<String, String>]{
        
        let dados = self.getDefaults().object(forKey: self.chaveArmazenamento)
        
        if dados != nil{
            
            return dados as! Array
        }else{
            
            return []
        }
    }
    
    func removerViagem(indice: Int){
        
        self.viagens = listarViagens()
        self.viagens.remove(at: indice)
        self.getDefaults().set(viagens, forKey: self.chaveArmazenamento)
        self.getDefaults().synchronize()
        
    }
}
