//
//  Stack.swift
//  DSA
//
//  Created by Anup Harbade on 1/19/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import Foundation


struct Stack <T> {
    
    private(set) var topOfStack = -1
    var items: Array<T> = Array()
    private(set) var sizeOfStack = INT_MAX
    
    /**
     Method to push an item to the Stack
     Returns the updated top of stack.
     */
    mutating func push(item: T) {
        if topOfStack < sizeOfStack {
            items.append(item)
            topOfStack += 1
        } else {
            print("Stack is full, can not add more elements.")
        }
    }
    
    /**
     Method to remove an item at the top of stack
     Returns the updated top of stack.
     */
    mutating func pop() -> T? {
        
        var item: T? = nil
        if topOfStack >= 0 {
            item = items.removeLast()
            topOfStack -= 1
        } else {
            print("Stack is empty, can not pop the element.")
        }
        
        return item
    }
    
    /**
     Method to know whether the Stack is empty or not.
     */
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    /**
     Method to know if the Stack is full
     */
    func isFull () -> Bool {
        return (items.count == sizeOfStack) ? true : false
    }
    
    func top() -> Int? {
        if topOfStack >= 0 {
            return items.index(after: topOfStack)
        }
        
        return nil
    }
    
    func printStack() {
        if self.isEmpty() == false {
            print(items)
        } else {
            print("Stack is empty right now.")
        }
        
    }
}
