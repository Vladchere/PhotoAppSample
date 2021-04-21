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

	func fetchData(from urlString: String, with completion: @escaping ([Photo]) -> Void) {

		guard let url = URL(string: urlString) else { return }

		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error { print(error); return }
			guard let data = data else { return }

			do {
				let photo = try JSONDecoder().decode([Photo].self, from: data)
				completion(photo)
			} catch let error {
				print(error.localizedDescription)
			}
		}.resume()
	}
}
