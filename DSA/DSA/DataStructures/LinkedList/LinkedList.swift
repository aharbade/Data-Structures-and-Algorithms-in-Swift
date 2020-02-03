//
//  LinkedList.swift
//  DSA
//
//  Created by Anup Harbade on 1/22/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import Foundation

class Node <T: Equatable> {
    var value: T
    var next: Node?
    
    init(value: T, next:Node?) {
        self.value = value
        self.next = next
    }
}


struct LinkedList <T: Equatable> {
    
    private(set) var head: Node<T>?
    private(set) var size: Int = 0
    
    mutating func insert(value: T) {
        
        let newNode = Node(value: value, next: nil)
        
        if head == nil {
            // Linked list is empty, add the first element and make it as a head node.
            self.head = newNode
        } else {
            if var node = head {
                while node.next != nil {
                    node = node.next!
                }
                
                node.next = newNode
            }
        }
        
        size += 1
    }
    
    mutating func insertAtBeginning(value: T) {
        
        let newNode = Node(value: value, next: head)
        head = newNode        
        size += 1
    }
    
    mutating func delete(value: T) -> T? {
        
        var prevNode: Node<T>? = nil
        var nextNode: Node<T>? = nil
        var found = false
        
        guard head != nil else {
            print("You're trying to delete from the empty list")
            return nil
        }
        
        var node = head
        
        while node != nil {
            if node!.value == value {
                found = true
                break
            } else {
                prevNode = node
                node = node?.next!
            }
        }
        
        if found {
            nextNode = node?.next
            
            if prevNode == nil {
                // This means, the deleted node is the very first node.
                // We need to make the nextNode as the head of the Linked list
                head = nextNode
            } else {
                prevNode?.next = nextNode
            }
            size -= 1
            return node?.value
        }
        
        return nil
    }
    
    mutating func deleteAtBeginning() -> T? {
        if let node = head {
            // Linked list ain't empty.
            head = node.next
            return node.value
        }
        
        return nil
    }
    
    func isEmpty() -> Bool {
        return head == nil ? true : false
    }
    
    func printLinkedList() {
        
        if var node = head {
            while node.next != nil {
                print("\(node.value) -> ", terminator: "")
                node = node.next!
            }
            print(node.value)
        } else {
            print("List is empty.")
        }
    }
    
}
