//
//  CommunityView_Carousel.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/20.
//

import SwiftUI

struct CommunitySubjectView_Articles: View {
    var body: some View {
        VStack{
            CommunityView.Article()
            Divider()
                .padding(.leading, 20)
                .padding(.trailing, 20)
            CommunityView.Article()
        }
    }
}

struct CommunitySubjectView_Articles_Previews: PreviewProvider {
    static var previews: some View {
        CommunitySubjectView_Articles()
    }
}
