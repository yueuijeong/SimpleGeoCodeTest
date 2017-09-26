//
//  ViewController.swift
//  SimpleGeoCodeTest_01
//
//  Created by D7703_21 on 2017. 9. 26..
//  Copyright © 2017년 D7703_21. All rights reserved.
//////////////////////

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    var lat: Double?
    var long: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        zoomToRegion()
        
        // Reverse GeoCoding
        //        let geoCoder: CLGeocoder = CLGeocoder()
        //
        //        // DIT 35.166083, 129.072669
        //        let myLocation: CLLocation = CLLocation(latitude: 35.166083, longitude: 129.072669)
        //
        //        geoCoder.reverseGeocodeLocation(myLocation, completionHandler: {
        //             (placemarks, error) -> Void in
        //
        //            let myPlacemark: CLPlacemark = placemarks!.first!
        //            print("myPlacemark = \(String(describing: myPlacemark.addressDictionary))")
        //                
        //        })
        //    }

        
        // GeoCoding
        let geoCoder2: CLGeocoder = CLGeocoder()
        let myAddress = "부산광역시 부산진구 양정1동 양지로 54"
        geoCoder2.geocodeAddressString(myAddress, completionHandler: {
            (placemarks, error) -> Void in
            
            if error != nil {
                print(error!)
            } else {

        
        
    

                //              placemarks는 배열 -> [CLPlacemark]
                //              let myCoordinate = placemarks!.first
                let myCoordinate = placemarks?[0]
                self.lat = myCoordinate?.location?.coordinate.latitude
                self.long = myCoordinate?.location?.coordinate.longitude
                //print("latttude = \(String(describing: self.lat))  longitude = \(String(describing: self.long))")
                //print("placemarks = \(String(describing: placemarks))")
                
                print("country code = \(String(describing: myCoordinate?.isoCountryCode))")
                print("time zone = \(String(describing: myCoordinate?.timeZone))")
                
                let center = CLLocationCoordinate2DMake(self.lat!, self.long!)
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegionMake(center, span)
                self.myMapView.setRegion(region, animated: true)
                
                // pin annotation
                let anno = MKPointAnnotation()
                anno.coordinate.latitude = self.lat!
                anno.coordinate.longitude = self.long!
                anno.title = "DIT 동의과학대학교"
                anno.subtitle = "우리들의 꿈이 자라는 것"
                self.myMapView.addAnnotation(anno)
                self.myMapView.selectAnnotation(anno, animated: true)
            }
            
        })
        
    }
    
}
