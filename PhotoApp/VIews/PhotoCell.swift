//
//  CollectionViewCell.swift
//  PhotoApp
//
//  Created by Vladislav on 21.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
	
	@IBOutlet weak var photoView: UIImageView!
//	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	func configure(with photo: Photo) {
		if let regularUrlPhoto = photo.urls?.regular {
			print(regularUrlPhoto)
//			photoView.fetchImage(from: regularUrlPhoto)
//			activityIndicator.stopAnimating()
		}
	}
}
