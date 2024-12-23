let array = [1, 2, 3]
if array.indices.contains(3) {
    let element = array[3] 
    print(element) //This will not be executed 
} else {
    print("Index out of range")
}

// Or use optional binding
let element = array[safe: 3]
print(element ?? "Index out of range")

//extension to safely access array elements
public extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}