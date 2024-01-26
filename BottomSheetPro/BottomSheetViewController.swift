//
//  BottomSheetViewController.swift
//  BottomSheetPro
//
//  Created by Dharam Dhurandhar on 26/01/24.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        // Create the ContainerView
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white // Set the background color as needed
        
        // Add the ContainerView to the main view
        view.addSubview(containerView)
        
        // Center the ContainerView horizontally and vertically within the main view

            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                   containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                   containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                   containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(lessThanOrEqualToConstant: 320).isActive = true
                   
        
        var previousLabel: UILabel?
        
        // Create and add three UILabels
//        for i in 1...3 {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "Label \(i)"
//            containerView.addSubview(label)
//            
//            // Position the labels horizontally at the center of the ContainerView
//            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//            
//            // Position the labels vertically below each other
//            if let previousLabel = previousLabel {
//                label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: 20).isActive = true
//            } else {
//                label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
//            }
//            
//            previousLabel = label
//        }
//        
        // Create and add a square UIView
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .blue // Set the color as needed
        containerView.addSubview(squareView)
        
        // Center the square horizontally within the ContainerView
//        squareView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        // Position the square below the last label
//        squareView.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? containerView.topAnchor, constant: 20).isActive = true
//        
//        // Set the square's width and height (assuming you want it square)
//        squareView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 300).isActive = true // You can change the size as needed
        squareView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        squareView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        squareView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        squareView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
}
