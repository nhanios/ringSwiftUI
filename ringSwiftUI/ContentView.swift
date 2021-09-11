//
//  ContentView.swift
//  ringSwiftUI
//
//  Created by dak on 11/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectLeftState = CGSize.zero
    @State var currentLeftState = CGSize.zero
    @State var selectRightState = CGSize.zero
    @State var currentRightState = CGSize.zero
    @State var selectWidth:CGFloat = 10
    
    var body: some View {
        
        ZStack {
            
            toneView()
            Text("\(selectLeftState.width)")
                .offset(x: 0, y: -350)
            Text("\(currentLeftState.width)")
                .offset(x: 0, y: -300)
            selectToneView()
                .frame(width: selectWidth, height: 150)
                .background(Color("card1"))
                

                .position(x: 10,y: 370)
                .offset(x: selectLeftState.width)
                .gesture(
                    DragGesture().onChanged { value in
                        selectLeftState.width = value.translation.width + currentLeftState.width
                        
                    }
                    .onEnded({ value in
                        currentLeftState.width = value.translation.width + currentLeftState.width
                    })
                )
            selectToneView()
                .frame(width: selectWidth, height: 150)
                .background(Color("card2"))
                .position(x: 50,y: 370)
                .offset(x: selectRightState.width)
                .gesture(
                    DragGesture().onChanged { value in
                        selectRightState.width = value.translation.width + currentRightState.width
                    }
                    .onEnded({ value in
                        currentRightState.width = value.translation.width + currentRightState.width
                    })
                )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct toneView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(0..<100) {_ in
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 10, height: 100)
                    }
                }
            }
            .frame(width: 350, height: 100, alignment: .center)
        }
    }
}

struct selectToneView: View {
    var body: some View {
        Text("")
    }
}
