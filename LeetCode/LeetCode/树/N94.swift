//
//  N94.swift
//  LeetCode
//
//  Created by liangweidong on 2020/4/17.
//  Copyright © 2020 liangweidong. All rights reserved.
//

import Foundation

public class TreeNode {
    public var value: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}
/**
给定一个二叉树，返回它的中序 遍历。
输入: [1,null,2,3]
   1
    \
     2
    /
   3

输出: [1,3,2]
 先序：1，nil，2，3，nil
 中序：nil，1，3，2，nil
 后序：nil，3， nil， 2，1

进阶: 递归算法很简单，你可以通过迭代算法完成吗？
*/
/**
 先复习一下什么是先序，中序，后序遍历
 先序：考察到一个节点后，即刻输出该节点的值，并继续遍历其左右子树。“(根左右)”
 中序：考察到一个节点后，将其暂存，遍历完左子树后，再输出该节点的值，然后遍历右子树。“(左根右)”
 后序：考察到一个节点后，将其暂存，遍历完左右子树后，再输出该节点的值。“(左右根)”
 */
class N94 {
    static func test() {
        //先构造出来这个二叉树
        let root = TreeNode.init(1);
        
        let r_l: TreeNode? = nil;
        let r_r: TreeNode = TreeNode.init(2);
        root.left = r_l;
        root.right = r_r;
        
        let r_r_l: TreeNode = TreeNode.init(3);
        let r_r_r: TreeNode? = nil;
        r_r.left = r_r_l;
        r_r.right = r_r_r;
        
        preOrder(root);
        centerOrder(root)
        tailOrder(root)
        print("-------------------")
        iteratePreOrder(root)
        iterateCenterOrder(root)
        iterateTailOrder(root)
        
    }
    
    //前序遍历
    static func preOrder(_ node: TreeNode?) {
        if (node == nil) {
            return;
        }
        print(node?.value ?? "-1");
        preOrder(node?.left)
        preOrder(node?.right)
    }
    
    //中序遍历
    static func centerOrder(_ node: TreeNode?) {
        if node == nil {
            return
        }
        centerOrder(node?.left)
        print(node?.value ?? "-1")
        centerOrder(node?.right)
    }
    
    //后序遍历
    static func tailOrder(_ node: TreeNode?) {
        if node == nil {
            return
        }
        centerOrder(node?.left)
        centerOrder(node?.right)
        print(node?.value ?? "-1")
    }
    
    //使用迭代法遍历
    /**
     先序: 先出栈，压右，再压左
     中序，连续压左，左为空，出栈，压右
     后续，出栈，压左，在压右，最后结果逆序
     层序：出队列，压儿子
     */
    //迭代-先序遍历-先出栈，压右，再压左
    static func iteratePreOrder(_ root: TreeNode?) {
        var stackArr = [TreeNode?]();
        var result = [Int]()
        stackArr.append(root)
        while !stackArr.isEmpty {
            let node = stackArr.popLast()!
            result.append(node!.value)
            if node?.right != nil {
                stackArr.append(node?.right)
            }
            if node?.left != nil {
                stackArr.append(node?.left)
            }
        }
        print(result)
    }
    
    //迭代-后序-出栈，压左，在压右，最后结果逆序
    static func iterateTailOrder(_ root: TreeNode?) {
        var stackArr = [TreeNode?]();
        var result = [Int]()
        stackArr.append(root)
        while !stackArr.isEmpty {
            let node = stackArr.popLast()!
            result.append(node!.value)
            if node?.left != nil {
                stackArr.append(node?.left)
            }
            
            if node?.right != nil {
                stackArr.append(node?.right)
            }
        }
        result.reverse()//逆序
        print(result)
    }
/**
     1
      \
       2
      /
     3
*/
    //迭代-中序- 连续压左，左为空，出栈，压右
    static func iterateCenterOrder(_ root: TreeNode?) {
        var stackArr = [TreeNode?]();
        var result = [Int]()
        stackArr.append(root)
        
        
        var temp = root
        
        while !stackArr.isEmpty {
            if temp?.left != nil {
                stackArr.append(temp?.left)
                temp = temp?.left
                continue;
            }
            let node = stackArr.popLast()!
            result.append(node!.value)
            
            if temp?.right != nil {
                stackArr.append(temp?.right)
                temp = temp?.right
            }
        }
        print("")
        
        
        
        
        
//        //1.连续压左
//        var tempLeft = root
//        while tempLeft?.left != nil {
//            stackArr.append(tempLeft?.left)
//            tempLeft = tempLeft?.left
//        }
//        //2.出栈
//        while let node = stackArr.popLast() {
//            result.append(node!.value)
//            //3.连续压右
//            var tempRight = node
//            while tempRight?.right != nil {
//                stackArr.append(tempRight?.right)
//                tempRight = tempRight?.right
//            }
//        }
        print(result)
    }
}
