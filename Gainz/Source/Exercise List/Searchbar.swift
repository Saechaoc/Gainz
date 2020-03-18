//
//  Searchbar.swift
//  Gainz
//
//  Created by Chris on 3/17/20.
//  Copyright © 2020 Chris Saechao. All rights reserved.
//

import SwiftUI

struct Searchbar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("Search Exercises", text: $searchText)
        }
    }
}

struct Searchbar_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar()
    }
}
