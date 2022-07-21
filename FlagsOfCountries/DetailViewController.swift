//
//  DetailViewController.swift
//  FlagsOfCountries
//
//  Created by Derya Çayıroğlu on 20.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedCountry{
            imageView.image = UIImage(named: imageToLoad)
            let countryName = imageToLoad.split(separator: "@")
            title = String(countryName[0]).uppercased()
        }
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func shareTapped(){
        guard let image = imageView.image else{
            print("No image found")
            return
        }
        
        var shareItem: [Any] = [image]
        if let imageText = selectedCountry{
            shareItem.append(imageText)
        }
        
        let vc = UIActivityViewController(activityItems: shareItem, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
