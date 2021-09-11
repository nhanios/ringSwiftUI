//
//  testView.swift
//  ringSwiftUI
//
//  Created by dak on 11/09/2021.
//

import SwiftUI

struct testView: View {
    @State var stateTop = CGSize.zero
    @State var stateBottom = CGSize.zero
    var body: some View {
        ZStack {
            toneView()
                .frame(width: 50, height: 50)
                .offset(x: stateTop.width, y: 0)
                .zIndex(2)
                
                .gesture(
                    DragGesture().onChanged { value in
                        stateTop.width = value.translation.width
                        
                    }
                    .onEnded({ value in
                        stateTop.width = value.translation.width
                    })
                )

            Rectangle()
                .fill(Color.red)
                .position(x: 100, y: 50)
                .frame(width: 200, height: 100)
                .offset(x: stateBottom.width, y: 0)
                .zIndex(3)
                .blendMode(.hardLight)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 50, y: 50)
                .allowsHitTesting(false)


                .gesture(
                    DragGesture().onChanged { value in
                        stateBottom.width = value.translation.width
                        
                    }
                    .onEnded({ value in
                        stateBottom.width = value.translation.width
                    })
                )
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
