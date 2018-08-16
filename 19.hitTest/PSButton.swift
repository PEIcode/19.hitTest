//
//  PSButton.swift
//  19.hitTest
//
//  Created by xingshulin on 2018/8/16.
//  Copyright © 2018年 xingshulin. All rights reserved.
//

import UIKit

class PSButton: UIButton {

}
extension UIButton{
    private struct AssociatedKeys {
        static var clickDurationTime = "clickDurationTime"
        static var LastClickTimeKey = "LastClickTimeKey"
    }
    /// 按钮不能被重复点击的时间间隔（默认两秒）
    private var clickDurationTime: TimeInterval {
        get{
            if let interval = objc_getAssociatedObject(self, &AssociatedKeys.clickDurationTime){
                return interval as! TimeInterval
            }
            return 2
        }
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.clickDurationTime, newValue as TimeInterval, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /// 存储上次点击的时间
    private var lastClickDate: Date{
        get{
            if let lastDate = objc_getAssociatedObject(self, &AssociatedKeys.LastClickTimeKey){
                return lastDate as! Date
            }
            return Date.init(timeIntervalSince1970: 0)
        }
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.LastClickTimeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    override open func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        if Date().timeIntervalSince(lastClickDate)<self.clickDurationTime{
            return
        }
        lastClickDate = Date()
        super.sendAction(action, to: target, for: event)
    }
    
}
