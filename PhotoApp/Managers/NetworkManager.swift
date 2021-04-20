//
//  NetworkManager.swift
//  PhotoApp
//
//  Created by Vladislav on 20.04.2021.
//  Copyright © 2021 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class NetworkManager {

	static let shared = NetworkManager()

	private init() {}

	func fetchData(from urlString: String, with completion: @escaping (Photo) -> Void) {

		guard let url = URL(string: urlString) else { return }

		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error { print(error); return }
			guard let data = data else { return }

			do {
				let photo = try JSONDecoder().decode(Photo.self, from: data)
				completion(photo)
			} catch let error {
				print(error.localizedDescription)
			}
		}.resume()
	}
}
//	private static var cache: URLCache = {
//
//		let memoryCapacity = 50 * 1024 * 1024
//		let diskCapacity = 100 * 1024 * 1024
//		let diskPath = "photo"
//
//		return URLCache(
//			memoryCapacity: memoryCapacity,
//			diskCapacity: diskCapacity,
//			directory: URL(fileURLWithPath: diskPath, isDirectory: true)
//		)
//	}()

//		// Check for a cached image.
//		if let cachedPhotos = NetworkManager.cache.cachedResponse(for: URLRequest(url: url)),
//							 let photo = UIImage(data: cachedPhotos.data) {
//			DispatchQueue.main.async {
//				completion(photo)
//			}
//			return
//		}

//// Returns the cached image if available, otherwise asynchronously loads and caches it.
//final func load(url: NSURL, item: Item, completion: @escaping (Item, UIImage?) -> Swift.Void) {
//	// Check for a cached image.
//	if let cachedImage = image(url: url) {
//		DispatchQueue.main.async {
//			completion(item, cachedImage)
//		}
//		return
//	}
//	// In case there are more than one requestor for the image, we append their completion block.
//	if loadingResponses[url] != nil {
//		loadingResponses[url]?.append(completion)
//		return
//	} else {
//		loadingResponses[url] = [completion]
//	}
//	// Go fetch the image.
//	ImageURLProtocol.urlSession().dataTask(with: url as URL) { (data, response, error) in
//		// Check for the error, then data and try to create the image.
//		guard let responseData = data, let image = UIImage(data: responseData),
//			let blocks = self.loadingResponses[url], error == nil else {
//			DispatchQueue.main.async {
//				completion(item, nil)
//			}
//			return
//		}
//		// Cache the image.
//		self.cachedImages.setObject(image, forKey: url, cost: responseData.count)
//		// Iterate over each requestor for the image and pass it back.
//		for block in blocks {
//			DispatchQueue.main.async {
//				block(item, image)
//			}
//			return
//		}
//	}.resume()
//}


