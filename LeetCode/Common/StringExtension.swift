//
//  StringExtension.swift
//  LeetCode
//
//  Created by wangyang on 2018/4/5.
//  Copyright © 2018年 北京更美互动信息科技有限公司. All rights reserved.
//

import Foundation

extension String {
    // 字符串的第一个字符
    var first: String {
        return self.substringTo(0)
    }
    // 字符串的最后一个字符
    var last: String {
        return self.substringFrom(self.count - 1)
    }

    func charAt(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }

    // 字符串开始到第index
    func substringTo(_ index: Int) -> String {
        guard index < self.count else {
            assertionFailure("index beyound the length of the string")
            return ""
        }
        let theIndex = self.index(self.startIndex, offsetBy: index + 1)

        return String(self[startIndex..<theIndex])
    }
    // 从第index个开始到结尾的字符
    func substringFrom(_ index: Int) -> String {
        guard index < self.count else {
            assertionFailure("index beyound the length of the string")
            return ""
        }
        guard index >= 0 else {
            assertionFailure("index can't be lower than 0")
            return ""
        }
        let theIndex = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[theIndex..<endIndex])
    }
    // 某个闭区间内的字符
    func substringInRange(_ range: CountableClosedRange<Int>) -> String {
        guard range.lowerBound >= 0 else {
            assertionFailure("lowerBound of the Range can't be lower than 0")
            return ""
        }
        guard range.upperBound < self.count else {
            assertionFailure("upperBound of the Range beyound the length of the string")
            return ""
        }
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound + 1)
        return String(self[start..<end])
    }
}

