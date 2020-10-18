//
//  CustomSeearchBar.swift
//  SwiftUI Custom Search Bar With Pagination
//
//  Created by elhajjaji on 10/17/20.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @ObservedObject var searchData : SearchUsers

    var body: some View {
        VStack(spacing: 0){
            HStack(spacing : 12) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.white)
                TextField("Search",text:$searchData.query)
                    .autocapitalization(.none)
                
            }
            .padding(.vertical,10)
            .padding(.horizontal)
                if !searchData.searchedUser.isEmpty{
                    ScrollView(.vertical, showsIndicators: true){
                        LazyVStack(alignment:.leading,spacing : 12){
                            ForEach(searchData.searchedUser,id: \.self){ user in
                                VStack(alignment: .leading, spacing: 6){
                                    Text(user.login)
                                    Divider()}
                                .padding(.horizontal)
                                    .onAppear{
                                        
                                        //stopping search until 3rd page
                                        
                                        if user.node_id == searchData.searchedUser.last?.node_id &&
                                            searchData.page <= 3{
                                            searchData.page += 1
                                            searchData.find()
                                            
                                        }
                                    }
                            }
                        }
                        .padding(.top)
                    }
                    .frame(height:240)
            }
    }
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        }
}
        





