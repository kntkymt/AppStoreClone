import SwiftUI

// base: https://github.com/quangfnv-1159/AppStoreAnimation

struct TodayDetailView: View {

    @Binding var showDetail: Bool

    @State var animateView = false
    @State var animateContent = false

    let caption: String
    let title: String
    let backgroundImageName: String
    let appImageNames: [String]
    let namespace: Namespace.ID

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
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
                    .padding(.horizontal, 16)
                    .padding(.top, 59)
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
                .matchedGeometryEffect(id: "night", in: namespace, isSource: true)

                Text(dummyText)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(10)
                    .padding(16)
                    .background(Color(.systemBackground))
                    .opacity(animateContent ? 1 : 0)
                    .scaleEffect(animateView ? 1 : 0, anchor: .top)
            }
        }
        .overlay(alignment: .topTrailing, content: {
            Button {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    animateView = false
                    animateContent = false
                }

                Task {
                    try? await Task.sleep(nanoseconds: UInt64(0.1 * 1_000_000_000))
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                        showDetail = false
                    }
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.top, 59)
        })
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                animateView = true
            }

            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)) {
                animateContent = true
            }
        }
        .transition(.identity)
    }
}

let dummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui id ornare arcu odio ut sem nulla pharetra diam. Risus viverra adipiscing at in. Augue lacus viverra vitae congue eu consequat ac felis donec. Volutpat sed cras ornare arcu dui. Vitae nunc sed velit dignissim sodales ut eu sem integer. Faucibus in ornare quam viverra orci. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Nulla facilisi nullam vehi Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui id ornare arcu odio ut sem nulla pharetra diam. Risus viverra adipiscing at in. Augue lacus viverra vitae congue eu consequat ac felis donec. Volutpat sed cras ornare arcu dui. Vitae nunc sed velit dignissim sodales ut eu sem integer. Faucibus in ornare quam viverra orci. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Nulla facilisi nullam vehi Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui id ornare arcu odio ut sem nulla pharetra diam. Risus viverra adipiscing at in. Augue lacus viverra vitae congue eu consequat ac felis donec. Volutpat sed cras ornare arcu dui. Vitae nunc sed velit dignissim sodales ut eu sem integer. Faucibus in ornare quam viverra orci. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Nulla facilisi nullam vehi"
