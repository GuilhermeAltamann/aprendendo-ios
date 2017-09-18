//
//  AnotacaoViewController.swift
//  NotasDiarias
//
//  Created by Guilherme Pires on 16/09/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit
import CoreData

class AnotacaoViewController: UIViewController {

    @IBOutlet weak var texto: UITextView!
    var context: NSManagedObjectContext!
    var anotacao: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.texto.becomeFirstResponder()
        
        if self.anotacao != nil{
            
            self.texto.text = anotacao.value(forKey: "texto") as? String
        }else{
            
            self.texto.text = ""
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func salvar(_ sender: Any) {
        
        if self.anotacao != nil{
            
            self.atualizarAnotacao()
        }else{
            
            self.salvarAnotacao()
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func atualizarAnotacao(){
        
        self.anotacao.setValue(self.texto.text, forKey: "texto")
        self.anotacao.setValue(Date(), forKey: "data")
        
        do {
            
            try self.context.save()
        } catch let erro as Error {
            
            print("Erro ao salvar : \(erro.localizedDescription)")
        }
    }
    
    func salvarAnotacao() {
        
        let novaAnotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: self.context)
        
        novaAnotacao.setValue(self.texto.text, forKey: "texto")
        novaAnotacao.setValue(Date(), forKey: "data")
        
        do {
            
            try self.context.save()
        } catch let erro as Error {
            
            print("Erro ao salvar : \(erro.localizedDescription)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
