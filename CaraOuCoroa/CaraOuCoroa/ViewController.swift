//
//  ViewController.swift
//  CaraOuCoroa
//
//  Created by Guilherme Pires on 19/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "jogarMoeda" {
           
            let numero = arc4random_uniform(2)
            
            let viewControllerDestino = segue.destination as! DetalhesViewController
            
            viewControllerDestino.numeroRandomicoRecebido = Int(numero)
        
        }
    }
}

