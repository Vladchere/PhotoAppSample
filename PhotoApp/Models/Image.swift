//
//  SearchResults.swift
//  PhotoApp
//
//  Created by Vladislav on 22.06.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import Foundation

struct Image: Decodable {
    let urls: [URLType.RawValue: String]
    
    enum URLType: String {
        case full
        case raw
        case regular
        case small
        case thumb
    }
}
