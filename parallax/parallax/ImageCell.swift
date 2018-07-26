//
//  ImageCell.swift
//  parallax
//
//  Created by nic on 13/10/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var parallaxImage: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!

    @IBOutlet weak var parallaxTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var parallaxImageHeight: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        parallaxImage.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, image: UIImage){
        self.imageTitle.text = title
        self.parallaxImage.image = image
    }

}
