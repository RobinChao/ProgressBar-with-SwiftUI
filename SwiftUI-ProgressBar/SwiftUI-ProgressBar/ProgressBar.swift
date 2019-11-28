//
//  ProgressBar.swift
//  CardListDemo
//
//  Created by Robin on 2019/11/28.
//  Copyright © 2019 RobinChao. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: CGFloat
    
    var width: CGFloat
    var height: CGFloat
    var labelSize: CGFloat?
    var progressColor: Color?
    var staticColor: Color?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(self.staticColor ?? .gray)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(self.progressColor ?? .blue)
                    .frame(width: (self.progress / 100) * geometry.size.width, height: geometry.size.height)
                    .animation(.linear(duration: 0.6))
            }
        }
        .frame(width: width, height: height)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: .constant(100.0), width: 400, height: 10, progressColor: .blue, staticColor: .red)
    }
}
