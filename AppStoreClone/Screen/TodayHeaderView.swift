//
//  HeaderView.swift
//  AppStoreClone
//
//  Created by kntk on 2023/06/30.
//

import SwiftUI

struct TodayHeaderView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Text("5月30日 金曜日")
                .font(.footnote)
                .foregroundColor(.secondary)

            HStack {
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 34, height: 34)
            }
        }
    }
}
