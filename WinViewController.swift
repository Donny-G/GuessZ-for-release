//
//  WinViewController.swift
//  GuessZ
//
//  Created by Donny G on 09/05/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    
    var scoreLabel: UILabel!
    var textlabel: UILabel!
    var currentScore = 0
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        
        let winImage = UIImageView()
        winImage.translatesAutoresizingMaskIntoConstraints = false
        winImage.image = UIImage(named: "win")
        view.addSubview(winImage)
        
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "YOUR SCORE: \(currentScore)"
        scoreLabel.textColor = .green
        scoreLabel.shadowColor = .yellow
        scoreLabel.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(scoreLabel)
        
        let textlabel = UILabel()
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        textlabel.text = "NOT HIGH SCORE"
        textlabel.textColor = .green
        textlabel.shadowColor = .yellow
        textlabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(textlabel)
        
        NSLayoutConstraint.activate([
            winImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            winImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            winImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            winImage.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 0.6),
            
            scoreLabel.topAnchor.constraint(equalTo: winImage.bottomAnchor, constant: 25),
            scoreLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textlabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 5),
            textlabel.widthAnchor.constraint(equalToConstant: 200),
            textlabel.heightAnchor.constraint(equalToConstant: 50),
            textlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textlabel.bottomAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor, constant: -10)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
