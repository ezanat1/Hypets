//
//  ViewController.swift
//  Hypets
//
//  Created by Ezana Tesfaye on 3/28/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dogButton: UIButton!
    @IBOutlet var catsButton: UIButton!
    @IBOutlet var mainViewBG: UIImageView!
    //    let dogsBtn : UIButton = {
//        let btn = UIButton(frame: CGRect(x: 20, y: 100, width: 140, height: 130))
//        btn.clipsToBounds = true
//        btn.layer.cornerRadius = 9
//        btn.layer.borderWidth = 0
//        btn.setImage(UIImage(named: "dogs.png"), for: .normal)
//        btn.imageView?.contentMode = .scaleToFill
//        btn.tag = 0
//
//        return btn
//
//    }()
//    let catsBtn : UIButton = {
//        let btn = UIButton(frame: CGRect(x: 200, y: 100, width: 140, height: 130))
//        btn.clipsToBounds = true
//        btn.layer.cornerRadius = 9
//        btn.layer.borderWidth = 0
//        btn.setImage(UIImage(named: "cats.png"), for: .normal)
//        btn.imageView?.contentMode = .scaleToFill
//        btn.tag = 1
//
//        return btn
//
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let imageView = UIImageView(image: UIImage(named: "bg.png"))
//        imageView.isUserInteractionEnabled = true
//        view = imageView

//        let dogsButton = CustomButton(frame: CGRect(x: 20, y: 100, width: 140, height: 130))
//        let catsButton = CustomButton(frame: CGRect(x: 200, y: 100, width: 140, height: 130))
//        dogsButton.configure(with: CustomButtonViewModel(image: "dogs.png"))
//        catsButton.configure(with: CustomButtonViewModel(image: "cats.png"))


//        dogsBtn.addTarget(self, action: #selector(dogsButtonClicked), for: .touchUpInside)
//        catsBtn.addTarget(self, action: #selector(catsButtonClicked), for: .touchUpInside)
//        view.addSubview(dogsBtn)
//        view.addSubview(catsBtn)
  
            UIColor.black.withAlphaComponent(0.5)
        dogButton.clipsToBounds = true
        dogButton.layer.cornerRadius = 8
        catsButton.clipsToBounds = true
        catsButton.layer.cornerRadius = 8
        
    }
  

//    @objc func tapped(){
//
//        let vc = CollectionViewController()
//        let navVC = UINavigationController(rootViewController: vc)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//
//    }
//    @objc func dogsButtonClicked(){
//        print("dogs button clicked")
//        let vc = CollectionViewController()
//        vc.imageString = "dogprint"
//        let navVC = UINavigationController(rootViewController: vc)
//        navVC.modalPresentationStyle = .overFullScreen
//        present(navVC, animated: true)
//
//
//    }
//    @objc func catsButtonClicked(){
//       print("cats clicked")
//        let vc = CollectionViewController()
//        vc.imageString = "catprint"
//        let navVC = UINavigationController(rootViewController: vc)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//
//
//    }
    @IBAction func dogsClicked(_ sender: Any) {
        let vc = CollectionViewController()
        vc.imageString = "dogprint"
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @IBAction func catsClicked(_ sender: Any) {
        let vc = CollectionViewController()
        vc.imageString = "catprint"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

