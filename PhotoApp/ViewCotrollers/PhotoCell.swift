//
//  CollectionViewCell.swift
//  PhotoApp
//
//  Created by Vladislav on 21.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!

	private var imageDataTask: URLSessionDataTask?
	private static var cache: URLCache = {
		let memoryCapacity = 50 * 1024 * 1024
		let diskCapacity = 100 * 1024 * 1024
		let diskPath = "unsplash"

		return URLCache(
			memoryCapacity: memoryCapacity,
			diskCapacity: diskCapacity,
			directory: URL(fileURLWithPath: diskPath, isDirectory: true)
		)
	}()

	private func downloadRandomPhoto(_ photo: Photo) {
//		let stringURL ="https://api.unsplash.com/photos/random?client_id=8J_Nydt1h5gF5ANS5x1eM-VBGTnRk4xFCgCdIU4aGYs&count=30"

		guard let url = photo.urls[.regular] else { return }

		if let cachedResponse = PhotoCell.cache.cachedResponse(for: URLRequest(url: url)),
			let image = UIImage(data: cachedResponse.data) {
			imageView.image = image
			return
		}

		URLSession.shared.dataTask(with: url) { (data, _, _) in
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
