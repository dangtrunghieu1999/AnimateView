//
//  ViewController.swift
//  AnimateView
//
//  Created by DangTrungHieu on 3/29/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let boxView: UIView = {
        let boxView = UIView()
        boxView.layer.cornerRadius = 8
        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.backgroundColor = .darkGray
        return boxView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg")
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.frame
        return imageView
    }()
    
    
    var boxHeight: NSLayoutConstraint!
    var boxWidth:  NSLayoutConstraint!
    var boxtop:    NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(boxView)
        
        boxHeight = boxView.heightAnchor.constraint(equalToConstant: 125)
        boxWidth  = boxView.widthAnchor.constraint(equalToConstant: 125)
        boxtop    = boxView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        boxView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        boxHeight.isActive = true
        boxWidth.isActive  = true
        boxtop.isActive    = true
    
        boxView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animateBox)))
    }
    
    @objc fileprivate func animateBox() {
        boxHeight.constant = boxHeight.constant == 125 ? 200 : 125
        boxWidth.constant  = boxWidth.constant == 125 ? 200 : 125
        
        boxtop.isActive = false
        boxtop = boxHeight.constant == 125 ? boxView.topAnchor.constraint(equalTo: view.centerYAnchor)
            : boxView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        boxtop.isActive = true

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

