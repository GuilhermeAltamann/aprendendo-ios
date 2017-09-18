//
//  ViewController.swift
//  MinhasViagens
//
//  Created by Guilherme Pires on 03/09/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String, String> = [:]
    var indiceSelecionado: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configuraGerenciadorLocalizacao()
        
        if let indice = self.indiceSelecionado{
            
            if indice != -1{
                
                self.exibirAnotacao(viagem: self.viagem)
            }
        }
        
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.marcar(gesture:)))
        reconhecedorGesto.minimumPressDuration = 1

       self.mapa.addGestureRecognizer(reconhecedorGesto)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if let indice = self.indiceSelecionado{
             if indice == -1{
                let local = locations.last!
                
                let localizacao = CLLocationCoordinate2DMake(local.coordinate.latitude, local.coordinate.longitude)
                let span = MKCoordinateSpanMake(0.01, 0.01)
                
                let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, span)
                self.mapa.setRegion(regiao, animated: true)
            }
        }
    }
    
    func exibirLocal(latitude: Double, longitude: Double) {
        
        let localizacao = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, span)
        self.mapa.setRegion(regiao, animated: true)
    }
    
    func exibirAnotacao(viagem: Dictionary<String, String>){
        
        if let localViagem = viagem["local"] {
           if let latitudeS = viagem["latitude"] {
              if let longitudeS = viagem["longitude"] {
                  if let latitude = Double(latitudeS){
                        if let longitude = Double(longitudeS){
                            
                            let anotacao = MKPointAnnotation()
                            
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            
                            self.mapa.addAnnotation(anotacao)
                            
                            self.exibirLocal(latitude: latitude, longitude: longitude)
                        }
                    }
                }
            }
        }
    }
    
    @objc func marcar(gesture: UIGestureRecognizer) {
        
        if gesture.state == UIGestureRecognizerState.began {
            
            let pontoSelecionado = gesture.location(in: self.mapa)
            let cordenadas = self.mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)
            let localizacao = CLLocation(latitude: cordenadas.latitude, longitude: cordenadas.longitude)
            
            var localCompleto = "Endereco não encontrado!!"
            
            CLGeocoder().reverseGeocodeLocation(localizacao, completionHandler: { (local, erro) in
                
                if erro == nil {
                    
                    if let dadosLocal = local?.first{
                        
                        if let nome = dadosLocal.name {
                            
                            localCompleto = nome
                        }else{
                            
                            if let endereco = dadosLocal.thoroughfare{
                                
                                localCompleto = endereco
                            }
                            
                        }
                    }
                    
                    self.viagem = ["local": localCompleto, "latitude":String(cordenadas.latitude), "longitude":String(cordenadas.longitude)]
                    
                    ArmazenamentoDados().salvarViagem(viagem: self.viagem)
                    
                   self.exibirAnotacao(viagem: self.viagem)
                }
            })
        }
    }
    
    func configuraGerenciadorLocalizacao(){
        
        self.gerenciadorLocalizacao.delegate = self
        self.gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        self.gerenciadorLocalizacao.requestAlwaysAuthorization()
        self.gerenciadorLocalizacao.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse{
            
            let alertaController = UIAlertController(title: "Permissão de localização",
                                                     message: "Necessário permissão para acesso a sua localização!!",
                                                     preferredStyle: .alert)
            
            let acaoConfiguracao = UIAlertAction(title: "Abrir configuração", style: .default, handler: {(alertaConfiguracoes) in
                
                if let configuracoes = NSURL(string: UIApplicationOpenSettingsURLString){
                    
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaController.addAction(acaoConfiguracao)
            alertaController.addAction(acaoCancelar)
            
            present(alertaController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

