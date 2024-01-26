//
//  ViewController.swift
//  BottomSheetPro
//
//  Created by Dharam Dhurandhar on 26/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Create a UIButton
      let centerButton: UIButton = {
          let button = UIButton(type: .system) // Use .system for a button with default styling
          button.setTitle("Tap Me", for: .normal) // Set the button title
          button.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
          return button
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        addButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func addButton() {
        // Add the button to the view controller's view
        view.addSubview(centerButton)
        
        // Set up constraints for the button to center it
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Add target-action pattern for the button
        centerButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
    @objc func buttonTapped() {
            print("Button was tapped!")
        presentBottomSheet()
            // Add further actions here
        }

    
    func presentBottomSheet() {
        let bottomSheetVC = BottomSheetViewController()
        bottomSheetVC.modalPresentationStyle = .custom
        bottomSheetVC.transitioningDelegate = self
        bottomSheetVC.shouldUseCustomTransition = true
        self.shouldUseCustomTransition = true
        self.present(bottomSheetVC, animated: true, completion: nil)
    }


}

