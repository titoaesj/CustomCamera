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
    
    var imagePickerControoler : UIImagePickerController!
    var image : UIImage?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewImageView.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToShowImage") {
            let destinationVC = segue.destination as! PreviewViewController
            if let mImage = sender as? UIImage {
                destinationVC.image = mImage
            }
        }
    }
    
    @IBAction func takeNewPhoto(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToCamera", sender: image)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToShowImage", sender: image)
    }
    
}
