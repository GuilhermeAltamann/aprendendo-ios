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
        
        let usuario = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)
        
        usuario.setValue("Guilherme",forKey: "nome")
        usuario.setValue(29, forKey: "idade")
        usuario.setValue("jamiltondamasceno", forKey: "login")
        usuario.setValue("1234", forKey: "senha")
        
        do {
            try context.save()
        } catch {
            print("Erro")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

