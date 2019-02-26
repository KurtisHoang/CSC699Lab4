//
//  ViewController.swift
//  CSC699Lab4
//
//  Created by Kurtis Hoang on 2/23/19.
//  Copyright © 2019 Kurtis Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kart0: UIImageView!
    @IBOutlet weak var kart1: UIImageView!
    @IBOutlet weak var kart2: UIImageView!
    
    //for storing inital position
    var startingPointKart0 = CGPoint()
    var startingPointKart1 = CGPoint()
    var startingPointKart2 = CGPoint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startingPointKart0 = kart0.center
        startingPointKart1 = kart1.center
        startingPointKart2 = kart2.center
        
    }
    
    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        //get location of mouse
        let location = sender.location(in: self.view)
        
        //show loaction
        //print("Location: x: \(location.x), y: \(location.y)")
        
        //get current kart image selected
        let kartView = sender.view!
        //move kart
        kartView.center = location
    }
    
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        
        //get scaling from image
        let scale = sender.scale
        
        //show scaling
        //print("Scale: \(scale)")
        
        //get current kart image selected
        let kartView = sender.view!
        //scale kart
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        
        //get rotation
        let rotate = sender.rotation
        
        //show rotation
        //print("Rotation: \(rotate)")
        
        //get current kart image selected
        let kartView = sender.view!
        //rotate kart
        kartView.transform = CGAffineTransform(rotationAngle: rotate)
        
    }
    
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        
        //change the tap to 2 taps in the attributes inspector
        
        //show double tap works
        //print("Double Tap recognized")
        
        //get current kart image selected
        let kartView = sender.view!
        
        //animate the kart moving to the right
        UIView.animate(withDuration: 0.6) {
            kartView.center.x += 400
        }
        
    }
    
    @IBAction func didLongPressed(_ sender: UILongPressGestureRecognizer) {
        
        
        //move them back to their initial position
        UIView.animate(withDuration: 0.8) {
            self.kart0.center = self.startingPointKart0
            self.kart1.center = self.startingPointKart1
            self.kart2.center = self.startingPointKart2
            
            self.kart0.transform = CGAffineTransform.identity
            self.kart1.transform = CGAffineTransform.identity
            self.kart2.transform = CGAffineTransform.identity
        }
        
    }
}

