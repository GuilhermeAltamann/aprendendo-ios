//
//  ViewController.swift
//  Alerta
//
//  Created by Guilherme Pires on 27/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func abrirAlerta(_ sender: Any) {
        
        // Criar alerta
        let alertaController = UIAlertController(title: "Adicionar Contato", message: "Deseja adicionar o contato?", preferredStyle: .actionSheet)
        
        let acaoConfirmar = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
        alertaController.addAction(acaoCancelar)
        
        present(alertaController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

