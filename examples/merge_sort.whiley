import std::array
import std::ascii
import std::io

/**
 * Perform a merge sort of integer items.
 */
function sort(int[] items) -> int[]:
    //
    if |items| > 1:
        // First, sort left and right sub-lists
        int pivot = |items| / 2
        int[] lhs = sort(array::slice(items,0,pivot))
        int[] rhs = sort(array::slice(items,pivot,|items|))
        // Second, merge left and right sublists into
        // original list.
        int l = 0 // left sublist index
        int r = 0 // right sublist index
        int i = 0 // items index
        while i < |items| && l < |lhs| && r < |rhs|:
            if lhs[l] <= rhs[r]:
                items[i] = lhs[l]
                l=l+1
            else:
                items[i] = rhs[r]
                r=r+1
            i=i+1
        // Tidy up remaining items in left sublist
        while l < |lhs|:
            items[i] = lhs[l]
            i=i+1
            l=l+1
        // Tidy up remaining items in right sublist
        while r < |rhs|:
            items[i] = rhs[r]
            i=i+1
            r=r+1
    // Done
    return items

method printArray(int[] results):
    int i = 0
    //
    io::print("[")
    while i < |results|:
        if i != 0:
            io::print(", ")
        io::print(results[i])
        i = i + 1
    io::println("]")

method main(ascii::string[] args):
    printArray(sort([0;0]))
    printArray(sort([4,3,5,2,1]))
    printArray(sort([3,4,7,1,2]))
    printArray(sort([3,4,7,2]))
    printArray(sort([2,3,4,2]))
    printArray(sort([1,2,3,4]))
    printArray(sort([1,2,3,4,5]))
