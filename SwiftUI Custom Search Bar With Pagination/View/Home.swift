//
//  Home.swift
//  SwiftUI Custom Search Bar With Pagination
//
//  Created by elhajjaji on 10/17/20.
//

import SwiftUI

struct Home: View {
    @StateObject var searchData = SearchUsers()
    var body: some View {
        VStack{
            CustomSearchBar(searchData: searchData)
            Spacer()
        }
        .onChange(of:searchData.query){(newData) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if newData == searchData.query{
                    print("search \(newData)")
                    
                    if searchData.query != "" {
                        searchData.page = 1
                        searchData.find()
                    }
                    else {
                        //removing all searched data...
                        searchData.searchedUser.removeAll()
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
