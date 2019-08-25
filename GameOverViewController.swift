//
//  GameOverViewController.swift
//  GuessZ
//
//  Created by Donny G on 09/05/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var wordLabel: UILabel!
    var word = ""
    var scoreLabel: UILabel!
    var score = 0
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        let gameOverImageView1 = UIImageView()
        gameOverImageView1.translatesAutoresizingMaskIntoConstraints = false
        gameOverImageView1.image = UIImage(named: "gameover3")
        view.addSubview(gameOverImageView1)
        
        let wordLabel = UILabel()
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.text = "The word is \(word)"
        wordLabel.textColor = .orange
        wordLabel.shadowColor = .darkGray
        wordLabel.font = .boldSystemFont(ofSize: 20)
        view.addSubview(wordLabel)
        
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "SCORE: \(score)"
        scoreLabel.textColor = .orange
        scoreLabel.shadowColor = .black
        scoreLabel.font = .boldSystemFont(ofSize: 30)
        view.addSubview(scoreLabel)
        
        let tryAgainImageView = UIImageView()
        tryAgainImageView.translatesAutoresizingMaskIntoConstraints = false
        tryAgainImageView.image = UIImage(named: "tryagain2")
        view.addSubview(tryAgainImageView)
    
        NSLayoutConstraint.activate([
            gameOverImageView1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            gameOverImageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameOverImageView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameOverImageView1.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.6),
            
            scoreLabel.topAnchor.constraint(equalTo: gameOverImageView1.bottomAnchor, constant: 5),
            scoreLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            scoreLabel.heightAnchor.constraint(equalToConstant: 30),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            wordLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            wordLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            wordLabel.heightAnchor.constraint(equalToConstant: 30),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tryAgainImageView.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            tryAgainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tryAgainImageView.trailingAnchor.constraint(equalTo: view
            .trailingAnchor),
            tryAgainImageView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -1)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
