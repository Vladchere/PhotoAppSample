//
//  ImageView.swift
//  PhotoApp
//
//  Created by Vladislav on 21.04.2021.
//  Copyright © 2021 Vladislav Cheremisov. All rights reserved.
//

import UIKit

extension UIImageView {

	func fetchImage(from url: String) {

		image = UIImage(systemName: "square.and.arrow.up")

//		guard let url = URL(string: url) else {
//			image = UIImage(systemName: "square.and.arrow.up")
//			return
//		}
//
//		// Eсли изображение есть в кеше, то используем его
//		if let cachedImage = getCachedImage(url: url) {
////			image = cachedImage
//			image = UIImage(systemName: "square.and.arrow.up")
//			return
//		}
//
//		// Если изображения в кеше нет, то грузим его из сети
//		ImageManager.shared.getImage(from: url) { (data, response) in
//			DispatchQueue.main.async {
////				self.image = UIImage(data: data)
//				self.image = UIImage(systemName: "square.and.arrow.up")
//			}
//
//			// Сохраняем изображение в кеш
//			self.saveDataToCach(with: data, and: response)
//		}
//
//	}
//
//	private func getCachedImage(url: URL) -> UIImage? {
//		let urlRequest = URLRequest(url: url)
//		if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
//			return UIImage(data: cachedResponse.data)
//		}
//		return nil
//	}
//
//	private func saveDataToCach(with data: Data, and response: URLResponse) {
//		guard let urlResponse = response.url else { return }
//		let cachedResponse = CachedURLResponse(response: response, data: data)
//		let urlRequest = URLRequest(url: urlResponse)
//		URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
	}
}
