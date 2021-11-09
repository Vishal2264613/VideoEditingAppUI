//
//  CustomShape.swift
//  XProject
//
//  Created by vishal pawar on 2021-10-28.
//

import SwiftUI

struct Wave: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY * 0.55), control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY * 1.20))
        path.closeSubpath()
        return path
    }
}
