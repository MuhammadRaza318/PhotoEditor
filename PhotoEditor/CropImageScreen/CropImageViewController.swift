//
//  CropImageViewController.swift
//  PhotoEditor
//
//  Created by Raza on 05/11/2024.
//

import UIKit

class CropImageViewController: UIViewController {
    @IBOutlet var showImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

       }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func downloadBtn(_ sender: Any) {
       
    }

}
