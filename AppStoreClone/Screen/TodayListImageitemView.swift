//
//  TodayListImageitemView.swift
//  AppStoreClone
//
//  Created by kntk on 2023/06/30.
//

import SwiftUI

struct TodayListImageItemView: View {

    let caption: String
    let title: String
    let description: String
    let imageName: String

    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background(Color.white)

            VStack(alignment: .leading) {
                Text(caption)
                    .foregroundColor(.gray)
                    .font(.headline)

                Text(title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(description)
                    .foregroundColor(.gray)
                    .font(.title3)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(Color(.secondarySystemGroupedBackground))
        }
        .cornerRadius(16)
    }
}
