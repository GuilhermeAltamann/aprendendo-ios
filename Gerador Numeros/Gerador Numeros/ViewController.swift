//
//  ViewController.swift
//  Gerador Numeros
//
//  Created by Guilherme Pires on 27/05/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var legendaResultado: UILabel!
    @IBAction func gerarNumero(_ sender: Any) {
        
        legendaResultado.text = String(arc4random_uniform(101))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

