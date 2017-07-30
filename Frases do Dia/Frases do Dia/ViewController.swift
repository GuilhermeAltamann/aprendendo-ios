//
//  ViewController.swift
//  Frases do Dia
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

    @IBAction func gerarNovaFrase(_ sender: Any) {
        
        var frases: [String] = []
        
        frases.append("Se você traçar metas absurdamente altas e falhar, seu fracasso será muito melhor que o sucesso de todos.")
        frases.append("O sucesso normalmente vem para quem está ocupado demais para procurar por ele.")
        frases.append("Se você não está disposto a arriscar, esteja disposto a uma vida comum.")

        legendaResultado.text = frases[Int(arc4random_uniform(3))]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

