//
//  CadastroTarefaViewController.swift
//  ListaTarefas
//
//  Created by Guilherme Pires on 29/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class CadastroTarefaViewController: UIViewController {

    @IBOutlet weak var tarefaCampo: UITextField!
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        
        if let textoDigitado = tarefaCampo.text{
            
            let tarefa = TarefaUserDefault()
            tarefa.salvar(tarefa: textoDigitado)
            tarefaCampo.text = ""
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
