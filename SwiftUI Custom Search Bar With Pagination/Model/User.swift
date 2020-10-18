//
//  User.swift
//  SwiftUI Custom Search Bar With Pagination
//
//  Created by elhajjaji on 10/17/20.
//

import SwiftUI

struct User : Decodable, Hashable {
    
    var node_id : String
    var login : String
    var avatar_url : String
    
 
    
}

struct Results : Decodable {
    var items : [User]
}
