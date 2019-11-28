//
//  ContentView.swift
//  SwiftUI-ProgressBar
//
//  Created by Robin on 2019/11/28.
//  Copyright © 2019 RobinChao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Text("Simple ProgressBar")
            ProgressBar(progress: self.$progress, width: UIScreen.main.bounds.size.width - 40, height: 10, progressColor: .blue, staticColor: .gray)
            
            Spacer()
                .frame(height: 50.0)
            
            Text("Circle ProgressBar")
            CircleProgressBar(circleProgress: self.$progress, widthAndHeight: 200, labelSize: 30, progressColor: .pink, staticColor: .gray)
            
            Spacer()
                .frame(height: 50.0)
            
            Button(action: {
                self.progress = CGFloat.random(in: 0 ... 100)
            }, label: {
                Text("Random Progress")
            })
            
            Spacer()
                .frame(height: 50.0)
            
            Text("Custom Circle ProgressBar")
            CircularActivityIndicatory(widthAndHeight: CGFloat(200.0), indicatorColor: .pink, staticColor: .gray, lineWidth: CGFloat(12.0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
