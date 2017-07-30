//
//  DetalhesViewController.swift
//  PassandoDadosViews
//
//  Created by Guilherme Pires on 19/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import Foundation
import UIKit

class DetalhesViewController: UIViewController {
    
    @IBOutlet weak var resultadoLabel: UILabel!
    var textoRecebido: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultadoLabel.text = textoRecebido
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
