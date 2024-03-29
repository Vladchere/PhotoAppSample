//
//  ImageView.swift
//  PhotoApp
//
//  Created by Vladislav on 21.04.2021.
//  Copyright © 2021 Vladislav Cheremisov. All rights reserved.
//

import UIKit

extension UIImageView {

//	func fetchImage(from url: String) {
//
//		let url_nil = "nil"
//
//		guard let url = URL(string: url_nil) else {
//			image = #imageLiteral(resourceName: "nophoto")
//			return
//		}
//
//		// Eсли изображение есть в кеше, то используем его
//		if let cachedImage = getCachedImage(url: url) {
//			image = cachedImage
//			return
//		}
//
//		// Если изображения в кеше нет, то грузим его из сети
//		ImageManager.shared.getImage(from: url) { (data, response) in
//			DispatchQueue.main.async {
//				self.image = UIImage(data: data)
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
//	}


//	func fetchImage(from url: String) {
//		var imageCache = NSMutableDictionary()
//
//		if let img = imageCache.value(forKey: "key") as? UIImage {
//			image = img
//		} else {
//			let session = URLSession.shared
//			let task = session.dataTaskWithURL(NSURL(string: imgURL!)!, completionHandler: { (data, response, error) -> Void in
//
//				if(error == nil){
//
//					let img = UIImage(data: data!)
//					imageCache.setValue(img, forKey: "key")    // Image saved for cache
//
//					dispatch_async(dispatch_get_main_queue(), { () -> Void in
//						//Update your image view
//					})
//				}
//			}) task.resume()
//		}
//	}
}
