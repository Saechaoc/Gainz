//
//  TestView.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/16/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Image("heart")
        .resizable()
            .frame(width: 50, height: 50)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
