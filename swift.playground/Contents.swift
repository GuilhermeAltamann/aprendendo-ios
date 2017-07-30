//: Playground - noun: a place where people can play

import UIKit



class Animal{

    //Atributos
    var cor = "marrom"
    
    func dormir() -> String{
        
        return "dormir"
    }

}
class Cachorro: Animal{

    func latir() -> String{
        return "latir"
    }
}

class Passaro: Animal{



}


var c = Cachorro()
c.latir()