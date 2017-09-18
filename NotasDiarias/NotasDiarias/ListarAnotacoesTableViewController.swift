//
//  ListarAnotacoesTableViewController.swift
//  NotasDiarias
//
//  Created by Guilherme Pires on 16/09/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit
import CoreData

class ListarAnotacoesTableViewController: UITableViewController {

    var context: NSManagedObjectContext!
    var anotacoes: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.recuperarAnotacaoes()
    }
    
    func recuperarAnotacaoes(){
     
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Anotacao")
    
        do {
            
            let anotacoesRecuperadas = try self.context.fetch(requisicao)
    
            self.anotacoes = anotacoesRecuperadas as! [NSManagedObject]
            self.tableView.reloadData()
        } catch let erro as Error {
            print("Erro ao recuoerar dados : \(erro.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.anotacoes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        let anotacao = self.anotacoes[indexPath.row]
        cell.textLabel?.text = anotacao.value(forKey: "texto") as? String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        
        let novaData = dateFormatter.string(from: anotacao.value(forKey: "data") as! Date)
        
        cell.detailTextLabel?.text = String(describing: novaData)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let anotacao = self.anotacoes[indexPath.row]
        
        self.performSegue(withIdentifier: "verAnotacao", sender: anotacao)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "verAnotacao"{
            
            let viewDestino = segue.destination as! AnotacaoViewController
            viewDestino.anotacao = sender as? NSManagedObject
            
        }
    }
}
