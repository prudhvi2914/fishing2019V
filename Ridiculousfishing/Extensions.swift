//
//  Extensions.swift
//  Ridiculousfishing
//
//  Created by satram prudhvi on 2019-10-22.
//  Copyright © 2019 satram prudhvi. All rights reserved.
//

import Foundation
//--
import CoreGraphics
import SpriteKit

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
   return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func += (left: inout CGPoint, right: CGPoint) {
   left = left + right
}
