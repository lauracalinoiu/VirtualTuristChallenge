//
//  MapViewController.swift
//  VirtualTuristChallenge
//
//  Created by Laura Calinoiu on 13/09/15.
//  Copyright © 2015 3Smurfs. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let longPress = UILongPressGestureRecognizer(target: self, action: "dropPin:")
        longPress.minimumPressDuration = 0.5
        map.addGestureRecognizer(longPress)
        
        map.delegate = self
    }
    
    func dropPin(gestureRecognizer: UIGestureRecognizer){
        let tapPoint : CGPoint = gestureRecognizer.locationInView(map)
        let touchMapCoordinate = map.convertPoint(tapPoint, toCoordinateFromView: map)
        
        if UIGestureRecognizerState.Began == gestureRecognizer.state{
            let pin = MKPointAnnotation()
            pin.coordinate = touchMapCoordinate
            map.addAnnotation(pin)
        }
    }

}
