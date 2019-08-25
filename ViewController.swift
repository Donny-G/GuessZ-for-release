//
//  ViewController.swift
//  GuessZ
//
//  Created by Donny G on 04/05/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

extension Date {
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return dateFormatter.string(from: Date())
    }
}

class ViewController: UIViewController {
    
    var scoreLabel: UILabel!
    var tmpScore = 0
    var score = 0 {
        didSet {
            scoreLabel.text = "Score:\(score)"
        }
    }
    
    var scoresDictionary = [String: Int]()
    
    var tmpHighscore = 0
    
    var levelLabel: UILabel!
    var level = 1{
        didSet{
            levelLabel.text = "Level:\(level)"
        }
    }
    
    var cluesLabel: UILabel!
    var cluesArray = [String]()
    var clue: String!
    
    var mysteryWordLabel: UILabel!
    var mysteryWords = [String]()
    var mysteryWord: String!
    
    var letterButtons = [UIButton]()
    var usedLetters = [String]()
    var tappedLetters: String!
    
    var livesStagesImagesArray: [UIImage] = [
        UIImage(named: "stage0")!,
        UIImage(named: "stage1")!,
        UIImage(named: "stage2")!,
        UIImage(named: "stage3")!,
        UIImage(named: "stage4")!,
        UIImage(named: "stage5")!,
        UIImage(named: "stage6")!,
        UIImage(named: "stage7")!,
    ]
    var newGameImage = UIImage(named: "stage0")
    var livesStageImageView: UIImageView!
    
    var livesLabel: UILabel!
    var index = 0
    var lives = 7 {
        didSet {
            livesLabel.text = "Lives:\(lives)"
            livesStageImageView.image = livesStagesImagesArray[index + 1]
        }
    }
    var usedLives: Int!
    
    override func loadView() {
        view = UIView()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        //background!
        backgroundImage.image = UIImage(named: "background3")
        backgroundImage.contentMode = UIImageView.ContentMode.scaleAspectFill
        view.addSubview(backgroundImage)
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
        scoreLabel.text = "Score:\(score)"
        scoreLabel.textColor = .yellow
        scoreLabel.shadowColor = .green
        scoreLabel.textAlignment = .right
        view.addSubview(scoreLabel)
        
        levelLabel = UILabel()
        levelLabel.textColor = .yellow
        levelLabel.shadowColor = .green
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.text = "Level:1"
        levelLabel.textAlignment = .center
        levelLabel.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
        view.addSubview(levelLabel)
        
        livesLabel = UILabel()
        livesLabel.textColor = .yellow
        livesLabel.shadowColor = .green
        livesLabel.translatesAutoresizingMaskIntoConstraints = false
        livesLabel.text = "Lives:\(lives)"
        livesLabel.textAlignment = .right
        view.addSubview(livesLabel)
    
        let hintLabel = UILabel()
        hintLabel.textColor = .yellow
        hintLabel.shadowColor = .green
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        hintLabel.text = "HINT:"
        hintLabel.textAlignment = .left
        view.addSubview(hintLabel)
        
        livesStageImageView = UIImageView()
        livesStageImageView.image = livesStagesImagesArray[0]
        livesStageImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(livesStageImageView)
        
        cluesLabel = UILabel()
        cluesLabel.textColor = .yellow
        cluesLabel.shadowColor = .green
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
        cluesLabel.text = ""
        cluesLabel.textAlignment = .left
        view.addSubview(cluesLabel)
        
        let lettersView = UIView()
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lettersView)
        mysteryWordLabel = UILabel()
        mysteryWordLabel.textColor = .green
        mysteryWordLabel.shadowColor = .yellow
        mysteryWordLabel.backgroundColor = .black
        mysteryWordLabel.layer.borderWidth = 3
        mysteryWordLabel.layer.borderColor = UIColor.yellow.cgColor
        mysteryWordLabel.font = UIFont.systemFont(ofSize: 30)
        mysteryWordLabel.translatesAutoresizingMaskIntoConstraints = false
        mysteryWordLabel.textAlignment = .center
        mysteryWordLabel.text = ""
        view.addSubview(mysteryWordLabel)
        NSLayoutConstraint.activate([
            hintLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            hintLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            cluesLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            cluesLabel.leadingAnchor.constraint(lessThanOrEqualTo: hintLabel.leadingAnchor, constant: 45),
            
            levelLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            levelLabel.leadingAnchor.constraint(equalTo: cluesLabel.trailingAnchor, constant: 5),
            
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(lessThanOrEqualTo: livesLabel.leadingAnchor, constant: -5),
            
            livesLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            livesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            mysteryWordLabel.widthAnchor.constraint(equalToConstant: 300),
            mysteryWordLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            mysteryWordLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            mysteryWordLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 5),
        
            livesStageImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            livesStageImageView.topAnchor.constraint(lessThanOrEqualTo: mysteryWordLabel.bottomAnchor, constant: 5),

            livesStageImageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.5),
            
            livesStageImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            livesStageImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            lettersView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lettersView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lettersView.topAnchor.constraint(lessThanOrEqualTo: livesStageImageView.bottomAnchor, constant: 5),
            lettersView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -5)
            ])
    
        let letterWidth = 35
        let letterHeight = 36
        for row in 0..<3 {
            for col in 0..<9 {
            let letterButton = UIButton(type: .system)
                letterButton.setTitle("X", for: .normal)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            let frame = CGRect(x: col * letterWidth, y: row * letterHeight, width: letterWidth, height: letterHeight)
            letterButton.frame = frame
            lettersView.addSubview(letterButton)
                letterButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            letterButtons.append(letterButton)
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "NEW GAME", style: .plain, target: self, action: #selector(newGame))
        
        let scoreboardButton = UIBarButtonItem(title: "SCOREBOARD", style: .plain, target: self, action: #selector(scoreBoard))
        
        let infoButton = UIBarButtonItem(title: "INFO", style: .plain, target: self, action: #selector(info))
        navigationItem.rightBarButtonItems = [infoButton, scoreboardButton]
        
        navigationController?.navigationBar.tintColor = .green
        navigationController?.navigationBar.barStyle = .blackTranslucent
        let backItem = UIBarButtonItem()
        backItem.title = "NEW GAME"
        navigationItem.backBarButtonItem = backItem
        let image: UIImage = UIImage(named: "logo2")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            self?.loadLevel()
            self?.loadButtons()
            self?.loadData()
        }
    }
    
    @objc  func loadLevel() {
        if let urlForLevel = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
            if let contentsOfLevel = try? String(contentsOf: urlForLevel){
                 mysteryWords = contentsOfLevel.components(separatedBy: "\n")
                cluesArray = contentsOfLevel.components(separatedBy: "\n")
            }
        }
        DispatchQueue.main.async {
            [weak self] in
    
            self?.mysteryWords.removeFirst()
            self?.mysteryWords.shuffle()
            self?.mysteryWord = self?.mysteryWords.randomElement()
            self?.clue = self?.cluesArray.first
            self?.cluesLabel.text = self?.clue
            self?.mysteryWordLabel.text = "Guess the word"
            self?.usedLetters.removeAll()
            self?.usedLives = 0
            self?.lives = self!.mysteryWord.count
            self?.livesStageImageView.image = self?.newGameImage
            for button in self!.letterButtons {
            button.isHidden = false
            }
        }
    }

    func loadButtons() {
        var buttonTitles = [String]()
        if let urlForAlphabet = Bundle.main.url(forResource: "alphabet", withExtension: "txt"){
            if let contentsOfAlphabet = try? String(contentsOf: urlForAlphabet){
                buttonTitles = contentsOfAlphabet.components(separatedBy: "\n")
           }
        }
        DispatchQueue.main.async {
            [weak self] in
        
            if buttonTitles.count == self?.letterButtons.count {
            for i in 0 ..< self!.letterButtons.count {
                self?.letterButtons[i].setTitle(buttonTitles[i], for: .normal)
                self?.letterButtons[i].setTitleColor(UIColor.green, for: .normal)
                //hiding unused buttons
                self?.letterButtons[26].isHidden = true
                for button in self!.letterButtons{
                    button.backgroundColor = .black
                    button.layer.borderColor = UIColor.yellow.cgColor
                    button.layer.borderWidth = 5
                    button.layer.cornerRadius = button.frame.size.height/2
                    }
                }
            }
        }
    }
    
    @objc func info(){
        let ac = UIAlertController(title: "Info", message: "Hello, dear friend! This a hangman type game, you have 7 lives for each level to guess the word of 7 letters using hint. In Scoreboard you can find all your high scores. Good luck in escape from zombies", preferredStyle: .alert)
       let imageView = UIImageView(frame: CGRect(x: 0, y: -164, width: 270, height: 190))
        imageView.image = UIImage(named: "logo1")
        ac.view.addSubview(imageView)
        ac.addAction(UIAlertAction(title: "OK", style: .destructive))
        ac.view.backgroundColor = .green
        present(ac, animated: true)
    }
    
    @objc func tapButton(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {return}
        tappedLetters = ""
        usedLetters.append(buttonTitle)
            for letter in mysteryWord {
                let strLetter = String(letter)
                if usedLetters.contains(strLetter) {
                    tappedLetters += strLetter
                } else {
                    tappedLetters += "?"
                }
            }
        
        if tappedLetters == mysteryWord  {
            score = (mysteryWord.count - usedLives) + tmpScore
            tmpScore = score
            if level == 13 {
                win()
            } else {
                let ac = UIAlertController(title: "WIN", message: "Are you ready for the next level", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "NEXT", style: .default, handler: nextLevel))
                present(ac,animated: true)
                ac.view.backgroundColor = .green
                }
            }
        
        if !mysteryWord.contains(buttonTitle){
            lives -= 1
            usedLives += 1
            index += 1
            }
        
        if lives == 0 {
            gameOver()
            }
        
        mysteryWordLabel.text = tappedLetters
        sender.isHidden = true
    }
    
    func win() {
        if score > tmpHighscore {
            let date = Date.getCurrentDate()
            scoresDictionary[date] = score
            tmpHighscore = score
            saveData()
    
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let highViewController = mainStoryboard.instantiateViewController(withIdentifier: "HighScore") as? HighScoreViewController {
            highViewController.highscore = tmpHighscore
            navigationController?.pushViewController(highViewController, animated: true)}
            } else {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                if let winViewController = mainStoryboard.instantiateViewController(withIdentifier: "Win") as? WinViewController {
                    winViewController.currentScore = score
                    navigationController?.pushViewController(winViewController, animated: true)}
                }
        newGame()
    }
    
    func gameOver() {
        if score > tmpHighscore {
            let date = Date.getCurrentDate()
            scoresDictionary[date] = score
            tmpHighscore = score
            saveData()
        }
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let gameOverViewController = mainStoryboard.instantiateViewController(withIdentifier: "GameOver") as? GameOverViewController {
            gameOverViewController.word = mysteryWord
            gameOverViewController.score = score
            navigationController?.pushViewController(gameOverViewController, animated: true)}
        newGame()
    }
    
    @objc func newGame() {
        level = 1
        index = 0
        loadLevel()
        loadButtons()
        score = 0
        tmpScore = 0
    }
    
    @objc func nextLevel(action: UIAlertAction) {
        level += 1
        index = 0
    loadLevel()
    loadButtons()
        score = tmpScore
    }
    
    @objc func scoreBoard(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let scoreboardViewController = mainStoryboard.instantiateViewController(withIdentifier: "ScoreBoard") as? ScoresViewControllerTableViewController {
            scoreboardViewController.scoreboardDict = scoresDictionary
            navigationController?.pushViewController(scoreboardViewController, animated: true)}
    }
    
    func saveData () {
            let defaults = UserDefaults.standard
            defaults.set(scoresDictionary, forKey: "scoresDictionary")
            defaults.set(tmpHighscore, forKey: "tmpHighscore")
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        if let savedDict = defaults.object(forKey: "scoresDictionary") as? [String: Int] {
            scoresDictionary = savedDict
        }
        if let savedHighscore = defaults.object(forKey: "tmpHighscore") as? Int {
            tmpHighscore = savedHighscore
        }
    }
    
}













