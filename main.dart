void main() {
  List<num> nums = [2, 8, 5, 3, 9, 4, 1];
  selectionSort(nums);
  print(nums);
}

void bubbleSort<E extends Comparable<E>>(List<E> list) {
  if (list.length < 2) return;
  
  bubbleLowestToFront(list);
  E lowestItem = list.removeAt(0);
  bubbleSort(list);
  list.insert(0, lowestItem);
}

void bubbleLowestToFront<E extends Comparable<E>>(List<E> list) {
  if (list.length < 2) return;
  E lastItem = list.removeLast();
  E secondLastItem = list.removeLast();
  
  void Function(E, E) addInOrder = (first, second) {
    list.add(first);
    bubbleLowestToFront(list);
    list.add(second);
  };
  
  if (lastItem.compareTo(secondLastItem) < 0)
    addInOrder(lastItem, secondLastItem);
  else
    addInOrder(secondLastItem, lastItem);
}

void insertionSort<E extends Comparable<E>>(List<E> list) {
  if (list.length < 2) return;
  
  E lastItem = list.removeLast(); 
  insertionSort(list); 
  insertAtSortedPosition(lastItem, list); 
}

void selectionSort<E extends Comparable<E>>(List<E> list) {
  if (list.length < 2) return; // sort is done if length is 1 or 0
  
  int largestIndex =  getLargestIndex(list);
  
  E largestItem = list.removeAt(largestIndex); 
  selectionSort(list); 
  list.add(largestItem); 
}

void insertAtSortedPosition<E extends Comparable<E>>(E newItem, List<E> list) {
  if (list.length == 0) {
    list.add(newItem);
    return;
  }
  
  E lastItem = list.removeLast();
  
  if (newItem.compareTo(lastItem) >= 0) {
    list.add(lastItem);
    list.add(newItem);
    return;
  }
  
  insertAtSortedPosition(newItem, list);
  list.add(lastItem);
}

int getLargestIndex<E extends Comparable<E>>(List<E> list) {
  if (list.length == 0) return -1;
  if (list.length == 1) return 0;
  
  int lastIndex = list.length - 1;
  
  List<E> sublist = list.sublist(0, lastIndex);
  int subLargestIndex = getLargestIndex(sublist);
  
  E lastItem = list[lastIndex];
  E subLargestItem = sublist[subLargestIndex];
  
  return lastItem.compareTo(subLargestItem) > 0 ? lastIndex : subLargestIndex;
}
