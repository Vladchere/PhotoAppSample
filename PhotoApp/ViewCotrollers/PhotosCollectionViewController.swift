//
//  CollectionViewController.swift
//  PhotoApp
//
//  Created by Vladislav on 21.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

	private let urlString = "https://api.unsplash.com/photos/random?client_id=8J_Nydt1h5gF5ANS5x1eM-VBGTnRk4xFCgCdIU4aGYs&count=30"
	private var photos: [Photo?] = []
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
		fetchImages()
	}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell

//		cell.activityIndicator.startAnimating()
//		cell.activityIndicator.hidesWhenStopped = true

		if let photo = photos[indexPath.item] {
			cell.configure(with: photo)
		}

        return cell
    }
 
    private func fetchImages() {
		NetworkManager.shared.fetchData(from: urlString) { photos in
			DispatchQueue.main.async {
				self.photos = photos
				self.collectionView.reloadData()
			}
		}
    }
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) ->UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.right
    }
}
