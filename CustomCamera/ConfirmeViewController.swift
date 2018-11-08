//
//  ConfirmeViewController.swift
//  CustomCamera
//
//  Created by Tito Albino Evangelista da Silva Junior on 08/11/18.
//  Copyright © 2018 br.com.titoaesj. All rights reserved.
//

import UIKit

class ConfirmeViewController: UIViewController {
    
    @IBOutlet weak var previewImageView: UIImageView!
    
     var image : UIImage?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewImageView.image = image
    }

    @IBAction func takeNewPhoto(_ sender: Any) {
        
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
    }
    
}
