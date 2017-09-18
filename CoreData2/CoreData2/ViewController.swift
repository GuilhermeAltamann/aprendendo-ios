//
//  ViewController.swift
//  CoreData
//
//  Created by Guilherme Pires on 07/09/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        // ordenacao ascendente
        let ordenacaoDescricaoAsc = NSSortDescriptor(key: "descricao", ascending: true)
        
        // ordenacao descendente
       // let ordenacaoPrecoDesc = NSSortDescriptor(key: "preco", ascending: false)
        
        // filtro
        
        let predicate = NSPredicate(format: "descricao == %@", "Iphone 6s")
        
        // ilike %a%
        //let predicate = NSPredicate(format: "descricao contains [c] %@", "Iphone")
        
        // ilike %a
       // let predicateDesc = NSPredicate(format: "descricao beginswith [c] %@", "Iphone")
        
      //  let predicatePreco = NSPredicate(format: "preco >= %@", "2999")
        
      //  let combFiltro = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateDesc, predicatePreco])

        requisicao.sortDescriptors = [ordenacaoDescricaoAsc]
        requisicao.predicate = predicate
        
        do {
            let produtos = try context.fetch(requisicao)

            if produtos.count > 0 {

                for produto in produtos as! [NSManagedObject]{

                    let descricaoProd = produto.value(forKey: "descricao")
                    let corProd = produto.value(forKey: "cor")
                    let precoProd = produto.value(forKey: "preco")
                    print(String(describing: descricaoProd!) + " " + String(describing: corProd!) + " preço: " + String(describing: precoProd!))
                    
                    // remover
                    context.delete(produto)
                    
                    // atualizar
//                    produto.setValue(2699.99, forKey: "preco")
//
                    do {
                        try context.save()
                        print("Salvo")
                    } catch  {
                        print("Erro")
                    }
                    
                }
            }else{

                print("Nenhum Produto Encontrado")
            }

        } catch  {
            print("Erro")
        }
        
//        let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
//
//        produto.setValue("Playstation 4", forKey: "descricao")
//        produto.setValue("Preto", forKey: "cor")
//        produto.setValue(1599.9991, forKey: "preco")
//
//        do {
//            try context.save()
//            print("Salvo")
//        } catch  {
//            print("Erro")
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

