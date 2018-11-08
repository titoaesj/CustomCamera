//
//  CustomOverlayView.swift
//  CustomCamera
//
//  Created by Tito Albino Evangelista da Silva Junior on 08/11/18.
//  Copyright © 2018 br.com.titoaesj. All rights reserved.
//

import UIKit

protocol CustomOverlayDelegate{
    func didCancel(overlayView:CustomOverlayView)
    func didShoot(overlayView:CustomOverlayView)
}

class CustomOverlayView: UIView {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    var delegate:CustomOverlayDelegate! = nil
    
    @IBAction func cancelButton(sender: UIButton) {
        delegate.didCancel(overlayView: self)
    }
    @IBAction func shootButton(sender: UIButton) {
        delegate.didShoot(overlayView: self)
    }
}
