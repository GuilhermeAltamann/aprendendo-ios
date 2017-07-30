//
//  TarefasTableViewController.swift
//  ListaTarefas
//
//  Created by Guilherme Pires on 29/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {

    var tarefas: [String] = []
    
    func atualizarListaTarefas(){
        
        let tarefa = TarefaUserDefault()
        self.tarefas = tarefa.listar()
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.atualizarListaTarefas()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let tarefa = TarefaUserDefault()
            tarefa.remover(indice: indexPath.row)
            self.atualizarListaTarefas()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        celula.textLabel?.text = self.tarefas[indexPath.row]
        
        return celula
    }
}
