//
//  CircleProgressBar.swift
//  SwiftUI-ProgressBar
//
//  Created by Robin on 2019/11/28.
//  Copyright © 2019 RobinChao. All rights reserved.
//

import SwiftUI

struct CircleProgressBar: View {
    @Binding var circleProgress: CGFloat

    var widthAndHeight: CGFloat
    var labelSize: CGFloat?
    var progressColor: Color
    var staticColor: Color?
    var showLabel: Bool?
    var lineWidth: CGFloat?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(self.staticColor ?? Color.gray, lineWidth: self.lineWidth ?? 15)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                Circle()
                    .trim(from: 0.0, to: self.circleProgress / 100)
                    .stroke(self.progressColor, lineWidth: self.lineWidth ?? 15)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.linear(duration: 0.6))
                if self.showLabel ?? true {
                    Text("\(Int(self.circleProgress))%")
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .font(.custom("HelveticaNeue", size: self.labelSize ?? 20.0))
                }
            }
        }
            .frame(width: widthAndHeight, height: widthAndHeight)
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(circleProgress: .constant(45.0), widthAndHeight: 200, labelSize: 30, progressColor: .blue)
    }
}
