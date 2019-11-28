//
//  CircularActivityIndicatory.swift
//  SwiftUI-ProgressBar
//
//  Created by Robin on 2019/11/28.
//  Copyright © 2019 RobinChao. All rights reserved.
//

import SwiftUI

struct CircularActivityIndicatory: View {
     static private let _animation = Animation
           .linear(duration: 2)
           .repeatForever(autoreverses: false)
     
    @State var active: Bool = false
    
    var widthAndHeight: CGFloat
    var indicatorColor: Color?
    var staticColor: Color?
    var lineWidth: CGFloat?
       
       var body: some View {
           ZStack(alignment: .leading) {
               Circle()
               .stroke(self.staticColor ?? Color.gray, lineWidth: self.lineWidth ?? 15)
               Circle()
                   .fill(self.indicatorColor ?? Color.blue)
                   .scaleEffect(0.1)
                   .offset(y: -self.widthAndHeight/2)
                   .rotationEffect(.degrees(active ? 0 : -360.0))
                   .animation(CircularActivityIndicatory._animation)
           }
           .frame(height: self.widthAndHeight)
           .onAppear {
               self.active.toggle()
           }
       }
}

struct CircularActivityIndicatory_Previews: PreviewProvider {
    static var previews: some View {
        CircularActivityIndicatory(widthAndHeight: 200, indicatorColor: .red)
    }
}
