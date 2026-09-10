
import java.util.ArrayList;
import java.util.List;

public class arrayListEx {
    public static void main(String[] args){
        List<String> arraylist = new ArrayList<>();
        arraylist.add("Apple");
        arraylist.add("Banana");
        arraylist.add("Mango");
        System.out.println(arraylist);

        System.out.println(arraylist.contains("Mango")); //bool true 
        // System.out.println(arraylist.equals("Mango"));
        System.out.println(arraylist.get(2));
        System.out.println(arraylist.getClass());
        System.out.println(arraylist.getFirst());
        System.out.println(arraylist.getLast());
        System.out.println(arraylist.indexOf("Mango")); // why this is showing -1
        System.out.println(arraylist.isEmpty());
        System.out.println(arraylist.iterator()); // What is this? -> java.util.ArrayList$Itr@2b2fa4f7 
        System.out.println(arraylist.remove(2));
        System.out.println(arraylist.removeAll(arraylist));

        List<String> arraylist1 = new ArrayList<>();
        arraylist1.add("Watermalon");
        arraylist1.add("Avacado");
        System.out.println(arraylist.containsAll(arraylist1));
        arraylist.addAll(arraylist1);
        System.out.println(arraylist);
        List<MyClass> newList = new ArrayList<>();
        MyClass newObj = new MyClass("piyush");
        newList.add(newObj);
        System.out.println(newList.getFirst().getName());
        System.out.println(newList.getClass());
    }
}

class MyClass{
 String name;

    public MyClass(String name) {
        this.name = name;
    }

    String getName(){
        return name;
    }

 
}