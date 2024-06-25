//
//  ViewController.swift
//  El_toro
//
//  Created by IOSdev on 18/06/2024.
//

import UIKit

class ViewController: UIViewController,StoinksSelectionDelegate {
 
    
   
    
    
    let selectButton = UIButton()
    let pageLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUi ()
        
    }
    func selectedStoinks(label: String) {
        pageLabel.text = label    }

    
    @objc func openStoinks(){
        let destinationVC = StoinksVC()
        destinationVC.delegate = self
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
    }
    
    func setUpUi (){
        view.addSubview(selectButton)
        view.addSubview(pageLabel)
        
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        
        pageLabel.text = "WELCOME TO EL TORRRO!"
        pageLabel.textAlignment = .center
        pageLabel.textColor = .systemRed
        
        //button config
        
        selectButton.configuration = .tinted()
        //selectButton.configuration?.title = "MORE .."
        selectButton.configuration?.image = UIImage(systemName: "plus")
        selectButton.configuration?.imagePadding = 6
        selectButton.configuration?.baseForegroundColor = .systemBlue
        selectButton.configuration?.baseBackgroundColor = .systemBlue
        selectButton.addTarget(self, action: #selector(openStoinks), for: .touchUpInside)
        //add constraints
        
        NSLayoutConstraint.activate([
            selectButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            selectButton.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -20),
            selectButton.heightAnchor.constraint(equalToConstant: 40),
            selectButton.widthAnchor.constraint(equalToConstant: 80),
            
            
            pageLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageLabel.heightAnchor.constraint(equalToConstant: 60),
            pageLabel.widthAnchor.constraint(equalToConstant: 300)
            
        
        ])
        
    }


}

