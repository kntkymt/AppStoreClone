//
//  ContentView.swift
//  AppStoreClone
//
//  Created by kntk on 2023/06/30.
//

import SwiftUI

struct HelloWorldView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 100, height: 100)

            Text("Hello World!!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct HelloWorldView_Previews: PreviewProvider {
    static var previews: some View {
        HelloWorldView()
    }
}
