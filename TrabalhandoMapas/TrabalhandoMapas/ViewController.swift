//
//  ViewController.swift
//  TrabalhandoMapas
//
//  Created by Guilherme Pires on 29/07/17.
//  Copyright © 2017 Guilherme Pires. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var locationMananger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationMananger.delegate = self
        locationMananger.desiredAccuracy =  kCLLocationAccuracyBest
        locationMananger.requestWhenInUseAuthorization()
        locationMananger.startUpdatingLocation()
/*
        let latitude: CLLocationDegrees = -29.378839
        let longitude: CLLocationDegrees = -50.872865
        
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        mapa.setRegion(regiao, animated: true)
        
        let anotacao = MKPointAnnotation()
        
        anotacao.coordinate = localizacao
        anotacao.title = "Museu da Lingua portuguesa"
        anotacao.subtitle = "Museu iterativo sobre a lingua portuguesa"
        mapa.addAnnotation(anotacao)
 */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

