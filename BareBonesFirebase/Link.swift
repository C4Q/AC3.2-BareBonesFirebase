//
//  Link.swift
//  BareBonesFirebase
//
//  Created by Jason Gresh on 2/13/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class Link {
    let key: String
    let url: String
    let comment: String
    
    init(key: String, url: String, comment: String) {
        self.key = key
        self.url = url
        self.comment = comment
    }
    
    var asDictionary: [String: String] {
        return ["url": url,
                "comment": comment]
    }
}
