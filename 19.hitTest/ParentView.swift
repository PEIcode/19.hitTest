//
//  ParentView.swift
//  19.hitTest
//
//  Created by xingshulin on 2018/8/16.
//  Copyright © 2018年 xingshulin. All rights reserved.
//

import UIKit

class ParentView: UIView {
    
    /// 重写hitTest方法
    /// 该方法通过调用每个子视图的point(inside:with:)方法遍历视图层次结构，以确定哪个子视图应该接收一个触摸事件。如果point(inside:with:)返回true，那么子视图的层次结构将被类似地遍历，直到找到包含指定点的最前端视图为止。如果视图不包含该点，则忽略其视图层次结构的分支。您很少需要自己调用这个方法，但是您可能会覆盖它，以从子视图中隐藏触摸事件。
    /// 这个方法忽略隐藏的视图对象、禁用用户交互的视图对象或alpha级别小于0.01的视图对象。此方法在确定命中时不考虑视图的内容。因此，即使指定的点位于视图内容的透明部分，也仍然可以返回视图。
    /// 位于接收者边界之外的点永远不会被报告为命中，即使它们实际上位于接收者的子视图中。如果当前视图的clipsToBounds属性被设置为false，并且受影响的子视图超出了视图的范围，就会发生这种情况。
    /// - Parameters:
    ///   - point: A point specified in the receiver’s local coordinate system (bounds).
    ///   - event: The event that warranted a call to this method. If you are calling this method from outside your event-handling code, you may specify nil.
    /// - Returns: 返回 包含这个点击事件的子视图
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        var view = super.hitTest(point, with: event)
//        guard view != nil else {
//            for subView in self.subviews {
//                if subView.isKind(of: PSButton.self){
//                    let rect = subView.frame
//                    print(rect)
//                    let tp = subView.convert(point, from: subView)
//                    if  rect.contains(tp){
//                        view = subView
//
//                    }
//                }
//
//            }
//            return view
//        }
//        return view
//    }
    
    /// Returns a Boolean value indicating whether the receiver contains the specified point.
    /// 返回一个bool值，指示接收者是否包含指定的点
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        let rect = self.frame
        var rect2: CGRect?
        for btn in subviews {
            if btn.isKind(of: PSButton.self){
                rect2 = btn.frame
            }
        }
        print(rect2?.contains(point) as Any)
        print(rect.contains(point))
        if (rect.contains(point) || (rect2?.contains(point))!){
            return true
        }else{
            return false
        }

    }
}
