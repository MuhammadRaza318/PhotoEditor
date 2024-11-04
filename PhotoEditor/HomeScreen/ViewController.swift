//
//  ViewController.swift
//  PhotoEditor
//
//  Created by Raza on 04/11/2024.
//

import UIKit
class HomeScreen: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var galleryBtn: UIButton!
    @IBOutlet var shareBtn: UIButton!
    @IBOutlet var cameraBtn: UIButton!
    @IBOutlet var homeGalleryView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        homeView()
        // Add action to galleryBtn
    galleryBtn.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
    }
//MARK: - HomeView
    func homeView() {
        let path = UIBezierPath(
                    roundedRect: homeGalleryView.bounds,
                    byRoundingCorners: [.topLeft, .topRight],
                    cornerRadii: CGSize(width: 34, height: 34)
                )
                
                let maskLayer = CAShapeLayer()
                maskLayer.path = path.cgPath
                homeGalleryView.layer.mask = maskLayer
        
        
        // Set border properties for shareBtn and cameraBtn
        let borderColor = UIColor.black.cgColor
        shareBtn.layer.borderWidth = 3
        shareBtn.layer.borderColor = borderColor
        cameraBtn.layer.borderWidth = 3
        cameraBtn.layer.borderColor = borderColor
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          applyTopCornersRadius()
      }
      
      private func applyTopCornersRadius() {
          let path = UIBezierPath(
              roundedRect: homeGalleryView.bounds,
              byRoundingCorners: [.topLeft, .topRight],
              cornerRadii: CGSize(width: 34, height: 34)
          )
          let maskLayer = CAShapeLayer()
          maskLayer.path = path.cgPath
          homeGalleryView.layer.mask = maskLayer
      }
    
    //MARK: - Action to galleryBtn
    
    // MARK: - Open Gallery
       @objc func openGallery() {
           let imagePicker = UIImagePickerController()
           imagePicker.sourceType = .photoLibrary
           imagePicker.delegate = self
           imagePicker.allowsEditing = true
           present(imagePicker, animated: true, completion: nil)
       }
       
       // MARK: - UIImagePickerControllerDelegate Methods
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let selectedImage = info[.editedImage] as? UIImage {
               // Handle the selected image (e.g., display it in an ImageView or use it in your app)
               // For example, set it to an image view: imageView.image = selectedImage
           }
           dismiss(animated: true, completion: nil)
       }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           dismiss(animated: true, completion: nil)
       }
 }
