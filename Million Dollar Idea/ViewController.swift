//
//  ViewController.swift
//  Million Dollar Idea
//
//  Created by Ky on 12/5/17.
//  Copyright © 2017 Ky. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    var player = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "sample", ofType: "mp3")
    var isPlaying = false
    
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var bigButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor .black
        bigImage.image = UIImage(named:"1.jpg")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        } catch {
            print("Could not load file")
        }
    }
    
    @IBAction func bigButtonPressed(_ sender: Any) {
        if isPlaying == false {
            player.play()
            isPlaying = true
            bigButton.setTitle("Press Again!", for: .normal)
            let toImage = UIImage(named:"2.jpg")
            UIView.transition(with: self.bigImage,
                              duration:3,
                              options: .transitionFlipFromTop,
                              animations: { self.bigImage.image = toImage },
                              completion: nil)
        } else {
            player.play()
            isPlaying = false
            bigButton.setTitle("Woo!!!", for: .normal)
            let toImage = UIImage(named:"3.jpg")
            UIView.transition(with: self.bigImage,
                              duration:2,
                              options: .transitionFlipFromBottom,
                              animations: { self.bigImage.image = toImage },
                              completion: nil)
            
            
        }
        
    }
}
