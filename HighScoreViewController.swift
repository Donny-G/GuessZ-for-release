//
//  HighScoreViewController.swift
//  GuessZ
//
//  Created by DeNNiO   G on 08/07/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {

    var scoreLabel: UILabel!
    var highscore = 0
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        
        let winImage = UIImageView()
        winImage.translatesAutoresizingMaskIntoConstraints = false
        winImage.image = UIImage(named: "highscore7")
        view.addSubview(winImage)
        
       let recordImageView = UIImageView()
        recordImageView.translatesAutoresizingMaskIntoConstraints = false
        recordImageView.image = UIImage(named: "hslabel10")
        view.addSubview(recordImageView)
        
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "\(highscore)"
        scoreLabel.textColor = .green
        scoreLabel.shadowColor = .red
        scoreLabel.font = .boldSystemFont(ofSize: 100)
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            winImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            winImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            winImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            winImage.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.5),

            recordImageView.topAnchor.constraint(equalTo: winImage.bottomAnchor),
            recordImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recordImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: recordImageView.bottomAnchor),
            scoreLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor, constant: -10)

            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
    }

    @objc func share (){
        let scoreToShare = "My new record is \(highscore)"
        let vc = UIActivityViewController(activityItems: [scoreToShare], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
