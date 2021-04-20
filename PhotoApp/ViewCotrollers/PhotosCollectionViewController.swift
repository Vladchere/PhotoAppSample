//
//  CollectionViewController.swift
//  PhotoApp
//
//  Created by Vladislav on 21.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    private var photos: Photo?
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	private let urlString = "https://api.unsplash.com/photos/random?client_id=8J_Nydt1h5gF5ANS5x1eM-VBGTnRk4xFCgCdIU4aGYs&count=30"

    override func viewDidLoad() {
        super.viewDidLoad()

		NetworkManager.shared.fetchData(from: urlString) { photos in
			DispatchQueue.main.async {
				self.photos = photos
				self.collectionView.reloadData()
			}
		}
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return photos?.urls.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell

		if let photoUrl = photos?.urls[indexPath.item] {
        
			DispatchQueue.global().async {
				guard let stringURL = photoUrl.re else { return }
				guard let imageURL = URL(string: stringURL) else { return }
				guard let imageData = try? Data(contentsOf: imageURL) else { return }

				DispatchQueue.main.async {
					cell.imageView.image = UIImage(data: imageData)
				}
			}
		}
    
        return cell
    }
 
    private func fetchImages() {
        let stringURL = "https://api.unsplash.com/photos/random?client_id=8J_Nydt1h5gF5ANS5x1eM-VBGTnRk4xFCgCdIU4aGYs&count=30"
        let url = URL(string: stringURL)
        
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            
            do {
                self.images = try decoder.decode([Photo].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.resume()
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
