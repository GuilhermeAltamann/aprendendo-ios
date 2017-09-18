//
//  ViewController.swift
//  OndeEstou
//
//  Created by Guilherme Pires on 28/08/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var logitudeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario = locations.last!
        
        let longitude = localizacaoUsuario.coordinate.longitude
        let latitude = localizacaoUsuario.coordinate.latitude
        
        self.logitudeLabel.text = String(describing: longitude)
        self.latitudeLabel.text = String(describing: latitude)
        
        if(localizacaoUsuario.speed > 0){
            
            self.velocidadeLabel.text =  String(describing: localizacaoUsuario.speed)
        }
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let localizacao:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let areaExibicao:MKCoordinateSpan = MKCoordinateSpanMake(deltaLat, deltaLon)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span:areaExibicao)
        
        self.mapa.setRegion(regiao, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) { (detalhesLocal, erro) in
            
            if erro == nil{
                
                if let dadosLocal = detalhesLocal?.first {
                
                    var thoroughfare:String = ""
                    
                    if dadosLocal.thoroughfare != nil {
                        
                        thoroughfare = dadosLocal.thoroughfare!
                    }
                    
                    var subThoroughfare:String = ""
                    
                    if dadosLocal.subThoroughfare != nil {
                        
                        subThoroughfare  = dadosLocal.subThoroughfare!
                    }
                    
                    var locality:String = ""
                    
                    if dadosLocal.locality != nil {
                        
                        locality  = dadosLocal.locality!
                    }
                    
                    var subLocality:String = ""
                    
                    if dadosLocal.subLocality != nil {
                        
                        subLocality  = dadosLocal.subLocality!
                    }
                    
                    var postalCode:String = ""
                    
                    if dadosLocal.postalCode != nil {
                        
                        postalCode  = dadosLocal.postalCode!
                    }
                    
                    var country:String = ""
                    
                    if dadosLocal.country != nil {
                        
                        country  = dadosLocal.country!
                    }
                    
                    var administrativeArea:String = ""
                    
                    if dadosLocal.administrativeArea != nil {
                        
                        administrativeArea  = dadosLocal.administrativeArea!
                    }
                    
                    var subAdministrativeArea:String = ""
                    
                    if dadosLocal.subAdministrativeArea != nil {
                        
                        subAdministrativeArea  = dadosLocal.subAdministrativeArea!
                    }
                    
                    print( "\n / thoroughfare:" + thoroughfare +
                           "\n / subThoroughfare:" + subThoroughfare +
                           "\n / locality:" + locality +
                           "\n / subLocality:" + subLocality +
                           "\n / postalCode:" + postalCode +
                           "\n / country:" + country +
                           "\n / administrativeArea:" + administrativeArea +
                           "\n / subAdministrativeArea:" + subAdministrativeArea
                    )
                    
                    self.enderecoLabel.text = thoroughfare + " - " +
                                              subThoroughfare + " / " +
                                              locality + " / " +
                                              country
                }
            }else{
                
            }
        }
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

