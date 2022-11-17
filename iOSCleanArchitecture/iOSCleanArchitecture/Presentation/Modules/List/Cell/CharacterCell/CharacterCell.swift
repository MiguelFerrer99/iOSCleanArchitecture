//
//  UserCell.swift
//  RudoApp
//
//  Created by Ramón Puchades on 17/6/22.
//  Copyright © 2022 Rudo. All rights reserved.
//

import UIKit
class CharacterCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    // MARK: - Life Cycle
    var character: CharacterDTO! {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: - Functions
    func setupUI() {
        characterName.text = character.name
        characterImage.layer.borderWidth = 1
        characterImage.layer.masksToBounds = false
        characterImage.layer.borderColor = UIColor.gray.cgColor
        characterImage.layer.cornerRadius = self.characterImage.frame.height / 2
        characterImage.clipsToBounds = true
        characterImage.backgroundColor = .gray

        if let url = URL(string: character.image) {
            characterImage.load(url: url)
        }
    }
}
