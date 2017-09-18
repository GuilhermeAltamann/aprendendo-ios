//
//  LocaisViagemTableViewController.swift
//  MinhasViagens
//
//  Created by Guilherme Pires on 03/09/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class LocaisViagemTableViewController: UITableViewController {

    var locaisViagens: [Dictionary<String,String>] = []
    var controleNavegacao = "adicionar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.controleNavegacao = "adicionar"
        self.atualizarViagens()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.locaisViagens.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viagem = self.locaisViagens[indexPath.row]["local"]
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)

        cell.textLabel?.text = viagem
        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        
            ArmazenamentoDados().removerViagem(indice: indexPath.row)
            self.atualizarViagens()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.controleNavegacao = "listar"
        performSegue(withIdentifier: "verLocal", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "verLocal"{
            
            let viewControllerDestino = segue.destination as! ViewController
            
            if self.controleNavegacao == "listar"{
            
                if let indiceRecuperado = sender{
                    
                    let indice = indiceRecuperado as! Int
                    viewControllerDestino.viagem = self.locaisViagens[indice]
                    viewControllerDestino.indiceSelecionado = indice
                }
            } else{
                
                viewControllerDestino.viagem = [:]
                viewControllerDestino.indiceSelecionado = -1
            }
        }
    }
    
    
    
    func atualizarViagens(){
        
        locaisViagens = ArmazenamentoDados().listarViagens()
        tableView.reloadData()
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
