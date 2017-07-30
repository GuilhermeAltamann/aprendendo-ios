//
//  ViewController.swift
//  Signos
//
//  Created by Guilherme Pires on 27/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var signos: [String] = []
    var significadoSignos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signos.append("Áries")
        signos.append("Touro")
        signos.append("Gêmeos")
        signos.append("Câncer")
        signos.append("Leão")
        signos.append("Virgem")
        signos.append("Libra")
        signos.append("Escorpião")
        signos.append("Sagitário")
        signos.append("Capricórnio")
        signos.append("Aquário")
        signos.append("Peixe")
        
        
        significadoSignos.append("O ariano é uma pessoa cheia de energia e entusiasmo. Pioneiro e aventureiro, lhe encantam as metas, a liberdade e as ideias novas.")
        
        significadoSignos.append("Zeloso e possessivo, um touro pode tender a ser inflexivel e ressentido. As vezes os Touros pecam de ser cobiços e de permitir-se tudo.")
        
        significadoSignos.append("2 - ..")
        significadoSignos.append("3 - ..")
        significadoSignos.append("4- ..")
        significadoSignos.append("5 - ..")
        significadoSignos.append("6 - ..")
        significadoSignos.append("7 - ..")
        significadoSignos.append("8 - ..")
        significadoSignos.append("9 - ..")
        significadoSignos.append("10 - ..")
        significadoSignos.append("11 - ..")
        significadoSignos.append("12 - ..")
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = signos[indexPath.row]
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alertaController =  UIAlertController(title: "Significado", message: significadoSignos[indexPath.row], preferredStyle: .alert)
        
        let acaoConfirmar = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
        
        present(alertaController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

