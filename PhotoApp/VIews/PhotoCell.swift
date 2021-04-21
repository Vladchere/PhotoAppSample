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

	func configure(with photo: Photo) {
		if let regularUrlPhoto = photo.urls?.regular {
			photoView.fetchImage(from: regularUrlPhoto)
			print(photoView.image)
		}
	}
}
