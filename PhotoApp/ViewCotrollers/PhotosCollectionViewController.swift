//
//  CollectionViewController.swift
//  PhotoApp
//
//  Created by Vladislav on 21.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    private var images: [Image] = []
    private let itemsPerRow: CGFloat = 1
    private let sectionInserts = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImages()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
        let image = images[indexPath.item]
        
        DispatchQueue.global().async {
            guard let stringURL = image.urls["regular"] else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: imageData)
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
                self.images = try decoder.decode([Image].self, from: data)
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