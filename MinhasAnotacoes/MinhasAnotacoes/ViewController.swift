//
//  ViewController.swift
//  MinhasAnotacoes
//
//  Created by Guilherme Pires on 29/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let chave = "minhaAnotacao"
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    @IBOutlet weak var textoCampo: UITextView!
    @IBAction func salvarAnotacao(_ sender: Any) {
        
        if let texto = textoCampo.text {
            
            UserDefaults.standard.set(texto, forKey: self.chave)
        }
    }
    
    func recuperarAnotacao() -> String {
        
        if let textoRecuperado = UserDefaults.standard.object(forKey: self.chave) {
            
            return textoRecuperado as! String
        }
        
        return ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textoCampo.text = recuperarAnotacao()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

