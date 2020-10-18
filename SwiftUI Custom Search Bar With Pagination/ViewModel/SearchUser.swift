//
//  SerarchUser.swift
//  SwiftUI Custom Search Bar With Pagination
//
//  Created by elhajjaji on 10/17/20.
//

import SwiftUI



class SearchUsers: ObservableObject {
    @Published var score = 0
    @Published var searchedUser :[User] = []
    @Published var query = ""
    @Published var page = 1
    
    func find(){
        //removing spaces..
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
            let url = "https://api.github.com/search/users?q=\(query)&page=\(page)&per_page=10"
        let session = URLSession(configuration:.default)
        session.dataTask(with: URL(string:url)!) { (data, _,err) in
            guard let jsonData = data else{return}
            do {
                let users = try JSONDecoder().decode(Results.self, from: jsonData)
                //appending to search Users....
                
                DispatchQueue.main.async{
                    //removing data if its new request...
                    if self.page == 1 {
                        self.searchedUser.removeAll()
                    }
                    //checking if any already loaded is again loaded..
                    //ignores already loaded...
                    self.searchedUser = Array(Set(self.searchedUser).union(Set(users.items)))
                }
                
            }
            catch{
                print(error.localizedDescription)
            }
    }
        .resume()
}
}
