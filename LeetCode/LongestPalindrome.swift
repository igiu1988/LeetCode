//
//  LongestPalindrome.swift
//  LeetCode
//
//  Created by wangyang on 2018/4/5.
//  Copyright © 2018年 北京更美互动信息科技有限公司. All rights reserved.
//

import Foundation

func longestPalindrome(s: String) -> String {
    var start = 0, end = 0
    for i in 0..<s.count {
        // len1 是 aba 模式
        let len1 = expandAroundCenter(s: s, left: i, right: i)
        // len2 是 abba模式
        let len2 = expandAroundCenter(s: s, left: i, right: i+1)
        let len = max(len1, len2)
        if len > end - start {
            start = i - (len - 1) / 2
            end = i + len / 2
        }
    }

    let result = s.substringInRange(start...end)
    return result
}

func expandAroundCenter(s: String, left: Int, right: Int) -> Int {
    var L = left, R = right
    while L >= 0 && R < s.count && s.charAt(L) == s.charAt(R) {
        L -= 1
        R += 1
    }
    return R - L - 1
}
