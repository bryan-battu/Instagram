//
//  ViewController.swift
//  Instagram
//
//  Created by Bryan Battu on 22/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var imageLikes: [UIImageView]!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet var littleHeart: [UIButton]!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    
    var isPressed = false
    var isTapped = false
    var baseLikes = 153035
    
    @objc func mainImageDoubleTapped () {
        let image = UIImage(systemName: "heart.fill")
        heartButton.setImage(image, for: .normal)
        heartButton.tintColor = .systemRed
    }
    
    func setupImage (iv: UIView) {
        iv.layer.cornerRadius = iv.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLikeLabel()
        doubleTap()
        setupImage(iv: profileImage)
        imageLikes.forEach { (image) in
            setupImage(iv: image)
        }
    }
    
    func addOrRemoveLike() {
        isTapped.toggle()
        let imageString = isTapped ? "heart.fill" : "heart"
        heartButton.setImage(UIImage(systemName: imageString), for: .normal)
        heartButton.tintColor = .systemRed
        updateLikeLabel()
    }
    
    func updateLikeLabel() {
        baseLikes = isTapped ? 153036 : 153035
        let likesString = "aimé par andrevillasboasoff et \(baseLikes) autres personnes"
        likesLabel.text = likesString
    }
    
    func addOrRemoveBookmark() {
        isTapped.toggle()
        let imageString = isTapped ? "bookmark.fill" : "bookmark"
        bookmarkButton.setImage(UIImage(systemName: imageString), for: .normal)
    }

    func doubleTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(mainImageDoubleTapped))
        tap.numberOfTapsRequired = 2
        mainImage.addGestureRecognizer(tap)
    }
     
    @IBAction func bigHeart(_ sender: UIButton) {
        addOrRemoveLike()
    }
    
    @IBAction func bookMark(_ sender: Any) {
        addOrRemoveBookmark()
    }
    
    @IBAction func littleHeartPressed(_ sender: UIButton) {
            isTapped.toggle()
            let imageString = isTapped ? "heart.fill" : "heart"
            littleHeart[sender.tag].setImage(UIImage(systemName: imageString), for: .normal)
            littleHeart[sender.tag].tintColor = .systemRed
        }
    }


