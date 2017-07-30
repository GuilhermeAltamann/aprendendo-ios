//
//  ViewController.swift
//  Idade de Cachorro
//
//  Created by Guilherme Pires on 26/05/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet weak var campoIdadeCachorro: UITextField!
    @IBOutlet weak var legendaResultado: UILabel!
    
    @IBAction func descobrirIdade(_ sender: Any) {
        
        legendaResultado.text = "A idade de cachorro é:" + String(Int(campoIdadeCachorro.text!)! * 7)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

