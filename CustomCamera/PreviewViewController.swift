//
//  PreviewViewController.swift
//  CustomCamera
//
//  Created by Tito Albino Evangelista da Silva Junior on 09/11/18.
//  Copyright © 2018 br.com.titoaesj. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    var image : UIImage?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewImageView.image = image
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
