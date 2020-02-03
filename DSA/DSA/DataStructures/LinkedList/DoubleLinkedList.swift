//
//  DoubleLinkedList.swift
//  DSA
//
//  Created by Anup Harbade on 1/23/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import Foundation

class DoublyNode <T: Equatable> {
    var value: T
    var next: DoublyNode?
    var previous: DoublyNode?
    
    init(value: T, next:DoublyNode? = nil, previous:DoublyNode? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}


struct DoublyLinkedList<T: Equatable> {
    
    var head: DoublyNode<T>?
    var tail: DoublyNode<T>?
    
    /**
     This method inserts the node at the end of the linked list.
     */
    mutating func insert(value: T) {
        
        let newNode = DoublyNode(value: value)
        if head == nil {
            // Doubly linked list is empty
            head = newNode
            tail = head
        } else {
            // Linked list is not empty
            // Let's add an item at the end
            if var node = head {
                while node.next != nil {
                    node = node.next!
                }
                node.next = newNode
                newNode.previous = node
                tail = newNode
            }
        }
     }
    
    /**
     As its name suggests, this method inserts the node at the start of the Linked List
     */
    mutating func insertAtHead(value: T) {
        
        let newNode = DoublyNode(value: value)
        
        if head == nil {
            // Linked list is empty, insert eh first node.
            head = newNode
            tail = head
        } else {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        }
    }
    
    /**
     This method inserts the node after the particular value
     */
    mutating func insert(value: T, after: T) {
        let newNode = DoublyNode(value: value)
        
        guard head != nil else {
            print("Linked List is empty, can not add node after.")
            return
        }
        
        var node = head
        while node != nil {
            if node?.value == after {
                // Node matched, add the new node right after this node.
                newNode.next = node?.next
                node?.next?.previous = newNode
                
                node?.next = newNode
                newNode.previous = node
                break;
            }
            node = node?.next
        }
        
        if node == nil {
            print("Node to add after is not found. Can not add the new node.")
        }
    }
    
    /**
     This node inserts the node after the particular index
     */
    mutating func insert(value: T, afterIndex index: Int) {
        let newNode = DoublyNode(value: value)
        
        guard head != nil else {
            print("Linked List is empty, can not add node after.")
            return
        }
        
        var node = head
        var nodeIndex: Int? = nil
        
        while node != nil {
            nodeIndex = (nodeIndex == nil) ? 0 : (nodeIndex! + 1)
            if index == nodeIndex {
                // Found the node index, add a node after this node
                newNode.next = node?.next
                node?.next?.previous = newNode
                
                node?.next = newNode
                newNode.previous = node
                break;
            }
            node = node?.next
        }
        
        if node == nil {
            print("Node index to add after is not found, can not add the new node.")
        }
    }
    
    // TODO: Need to handle the deleting the nodes in the doubly linked list
    
    
    func printDoublyLinkedList() {
        var node  = head
        while node != nil {
            print("\(String(describing: node!.value)) -> ", terminator: "")
            node = node?.next
        }
    }
    
}
