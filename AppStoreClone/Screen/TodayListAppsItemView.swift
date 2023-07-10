//
//  TodayListItemView.swift
//  AppStoreClone
//
//  Created by kntk on 2023/06/30.
//

import SwiftUI

struct TodayListAppsItemView: View {

    let caption: String
    let title: String
    let backgroundImageName: String
    let appImageNames: [String]

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(caption)
                    .foregroundColor(.gray)
                    .font(.headline)

                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(Image(backgroundImageName).resizable())

            HStack(spacing: 40) {
                ForEach(Array(appImageNames.enumerated()), id: \.offset) { (_, name) in
                    Image(name)
                        .resizable()
                        .frame(width: 66, height: 66)
                        .cornerRadius(16)
                        .shadow(radius: 1)
                }
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemGroupedBackground))
        }
        .cornerRadius(16)
    }
}
