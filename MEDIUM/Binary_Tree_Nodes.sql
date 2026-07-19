/*
Question: Binary Tree Nodes

Table: BST
-------------------------
N -> Node Value
P -> Parent Node

Task:
Write a query to determine the type of each node in the binary tree.
Display the result ordered by the value of the node (N).

Node Types:
1. Root  : If the node has no parent (P IS NULL).
2. Leaf  : If the node has no children (its N does not appear in the P column).
3. Inner : If the node is neither Root nor Leaf.

Logic:
- Check if P IS NULL      -> Root
- Else, check if N is NOT present in the Parent (P) column -> Leaf
- Otherwise              -> Inner

Output:
+----+--------+
| N  | Type   |
+----+--------+
| 1  | Leaf   |
| 2  | Inner  |
| 5  | Root   |
| 8  | Inner  |
| 9  | Leaf   |
+----+--------+

Order:
Sort the output by N in ascending order.
*/



SELECT 
N,
CASE 
    WHEN P is NULL THEN 'Root'
    WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P is not NULL) THEN 'Leaf'
    ELSE 'Inner'
END
FROM BST
ORDER BY N;
