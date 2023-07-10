//
//  MainScreen.swift
//  AppStoreClone
//
//  Created by kntk on 2023/06/30.
//

import SwiftUI

struct MainScreen: View {

    @Namespace var namespace

    @State var showDetail = false

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                TodayHeaderView()
                    .padding(.horizontal, 16)

                Button {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                        showDetail = true
                    }
                } label: {
                    TodayListAppsItemView(caption: "GOOD SCENARY", title: "美しい景色を見よう", backgroundImageName: "night", appImageNames: ["sky", "grass", "mountain"])
                        .matchedGeometryEffect(id: "night", in: namespace, isSource: true)
                        .padding(.horizontal, 16)
                        .shadow(radius: 6)
                }
                .buttonStyle(ScaleButtonStyle())

                TodayListImageItemView(caption: "C0de", title: "iOSライブコーディング", description: "iOS開発を始めよう", imageName: "genba")
                    .padding(.horizontal, 16)
                    .shadow(radius: 6)

                TodayListAppsItemView(caption: "ヨシ！", title: "", backgroundImageName: "genba", appImageNames: ["genba", "genba", "genba"])
                    .padding(.horizontal, 16)
                    .shadow(radius: 6)
            }
        }
        .overlay {
            if showDetail {
                TodayDetailView(
                    showDetail: $showDetail,
                    caption: "GOOD SCENARY",
                    title: "美しい景色を見よう",
                    backgroundImageName: "night",
                    appImageNames: ["sky", "grass", "mountain"],
                    namespace: namespace
                )
                .ignoresSafeArea(.container, edges: .top)
            }
        }
    }

    struct ScaleButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.94 : 1)
                .animation(.easeInOut, value: configuration.isPressed)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
