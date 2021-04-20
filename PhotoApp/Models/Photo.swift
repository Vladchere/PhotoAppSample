//
//  SearchResults.swift
//  PhotoApp
//
//  Created by Vladislav on 22.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import Foundation

enum URLType: String, Decodable, CaseIterable {
	case full
	case raw
	case regular
	case small
	case thumb
}

struct Photo: Decodable {
	let urls: [URLType.AllCases]
}
