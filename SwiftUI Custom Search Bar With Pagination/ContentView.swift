//
//  ContentView.swift
//  SwiftUI Custom Search Bar With Pagination
//
//  Created by elhajjaji on 10/17/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        Home()
            .preferredColorScheme(.dark)
            .navigationTitle("GitHub Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
