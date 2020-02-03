//
//  Stack_LL.swift
//  DSA
//
//  Created by Anup Harbade on 1/23/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import Foundation

struct StackLL <T: Equatable> {
    
    private var list: LinkedList<T>?;
    private let sizeOfStack: Int = Int(INT_MAX)
    
    mutating func push(item: T)  {
        
        if list == nil {
            list = LinkedList()
        }
        
        list?.insertAtBeginning(value: item)
    }
    
    mutating func pop() -> T? {
        guard self.isEmpty() == false && list != nil else {
            print("Stack is empty, can not pop an item.")
            return nil
        }
        
        if let head = list?.head {
            if let deletedValue = list?.delete(value: head.value) {
                return deletedValue
            }
        } else {
            print("Stack is empty, can not pop an item.")
        }
        
        return nil
    }
    
    func isEmpty() -> Bool {
        return (list == nil || list?.isEmpty() ?? false) ? true : false
    }
    
    func isFull() -> Bool {
        if let list = list {
            if sizeOfStack >= 0 && list.size == sizeOfStack {
                return true
            }
        }
        
        return false
    }
    
    func top() -> T? {
        if let list = list, let head = list.head {
            return head.value
        }
        
        return nil
    }
    
    func printStack() {
        if let list = list {
            list.printLinkedList()
        }
    }
}
