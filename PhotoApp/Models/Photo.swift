//
//  SearchResults.swift
//  PhotoApp
//
//  Created by Vladislav on 22.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import Foundation

struct Photo: Codable {

	public let urls: [URLType: URL]

	enum URLType: String, Codable {
		case full
		case raw
		case regular
		case small
		case thumb
	}
}
