//
//  BinaryTree.swift
//  DSA
//
//  Created by Anup Harbade on 2/22/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import Foundation


class BinaryTreeNode<T: Equatable> {
    
    var leftNode: BinaryTreeNode?
    var item: T
    var rightNode: BinaryTreeNode?
    
    init(with item: T, left: BinaryTreeNode? = nil, right: BinaryTreeNode? = nil) {
        self.item = item
        self.leftNode = left
        self.rightNode = right
    }
    
    var hasChildren: Bool {
        (leftNode != nil || rightNode != nil) ? true : false
    }
}


class BinaryTree<T: Equatable> {
    var rootNode: BinaryTreeNode<T>?
    
    var isEmpty: Bool {
        rootNode == nil ? true : false
    }
    
     func insert(item: T) {
        
        let node = BinaryTreeNode(with: item)
        if let root = rootNode {
            // Create a Queue
            var queue: [BinaryTreeNode<T>] = []
            // Enqueue Root node
            queue.append(root)
            while !queue.isEmpty {
                if let parent = queue.first {
                    if parent.leftNode == nil {
                        parent.leftNode = node
                        break
                    } else if (parent.rightNode == nil) {
                        parent.rightNode = node
                        break
                    }
                    
                    if let left = queue.first?.leftNode {
                        queue.append(left)
                    }
                    if let right = queue.first?.rightNode {
                        queue.append(right)
                    }
                }
                
                // Remove the parent node and go ahead with the rest of the tree.
                queue.removeFirst()
            }
        } else {
            // This is the very first node in the tree
            rootNode = node
        }
    }
    
     func delete(item: T) {
        if let root = rootNode {
            var queue:[BinaryTreeNode<T>] = []
            queue.append(root)
            var nodeToBeDeleted: BinaryTreeNode<T>?
            while !queue.isEmpty {
                if item == queue.first!.item {
                    // This is the leaf element and is safe to be deleted.
                    nodeToBeDeleted = queue.removeFirst()
                    break
                }
                
                if let left = queue.first?.leftNode {
                    queue.append(left)
                }
                
                if let right = queue.first?.rightNode {
                    queue.append(right)
                }
                
                queue.removeFirst()
            }
            
            if let node = nodeToBeDeleted {
                if !node.hasChildren {
                    // This is the item to delete
                    nodeToBeDeleted = nil
                } else {
                    var nodeToBeReplaced = deepestRightMostNode(root: rootNode)
                    if nodeToBeReplaced != nil {
                        nodeToBeDeleted?.item = nodeToBeReplaced!.item
                        nodeToBeReplaced = nil
                    }
                }
            }
            
        } else {
            print("Tree is empty, can not delete the item.")
        }
    }
    
    private func deepestRightMostNode(root: BinaryTreeNode<T>?) -> BinaryTreeNode<T>? {
        
        if let root = root {
            var queue: [BinaryTreeNode<T>] = []
            queue.append(root)
            
            while !queue.isEmpty {
                
                if let left = queue.first?.leftNode {
                    queue.append(left)
                }
                
                if let right = queue.first?.rightNode {
                    queue.append(right)
                }
                
                queue.removeFirst()
                
                if queue.count == 1 {
                    var nodeToBeDeleted = queue.first
                    queue.removeFirst()
                    return nodeToBeDeleted
                }
            }
        }
        
        return nil
    }
    
    func search(item: T) -> BinaryTreeNode<T>? {
        if let root = rootNode {
            var queue: [BinaryTreeNode<T>] = []
            queue.append(root)
            while !queue.isEmpty {
                if queue[0].item == item {
                    return queue[0]
                } else {
                    if let left = queue.first?.leftNode {
                        queue.append(left)
                    }
                    
                    if let right = queue.first?.rightNode {
                        queue.append(right)
                    }
                    
                    queue.removeFirst()
                }
            }
        }
        
        return nil
    }
    
    func inOrderTraversal(root: BinaryTreeNode<T>?) {
        if let root = root {
            inOrderTraversal(root: root.leftNode)
            print("\(root.item), ", terminator: "")
            inOrderTraversal(root: root.rightNode)
        } else {
            return
        }
    }
    
    func preOrderTraversal(root: BinaryTreeNode<T>?) {
        if let root = root {
            print("\(root.item), ", terminator: "")
            preOrderTraversal(root: root.leftNode)
            preOrderTraversal(root: root.rightNode)
        } else {
            return
        }
    }
    
    func postOrderTraversal(root: BinaryTreeNode<T>?) {
        if let root = root {
            postOrderTraversal(root: root.leftNode)
            postOrderTraversal(root: root.rightNode)
            print("\(root.item), ", terminator: "")
        } else {
            return
        }
    }
    
    
    // Use Queue for the level order traversal of the Tree.
    func levelOrderTraversal() {
        
        if let root = rootNode {
            // Create a Queue
            var queue: [BinaryTreeNode<T>] = []
            // Enqueue Root node
            queue.append(root)
            while !queue.isEmpty {
                if queue.first?.hasChildren ?? false {
                    if let left = queue.first?.leftNode {
                        queue.append(left)
                    }
                    if let right = queue.first?.rightNode {
                        queue.append(right)
                    }
                }
                // Dequeue the item and print
                print("\(queue.first!.item as Any), ", terminator: "")
                queue.removeFirst()
            }
        } else {
            print("Tree is empty.")
        }
    }
}


