import java.io.*;

class Student implements Serializable {
    String name;
    int age;
    transient String password;   // this will NOT be saved

    Student(String name, int age, String password) {
        this.name = name;
        this.age = age;
        this.password = password;
    }
}

public class ObjectStreamExample {
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        // Serialization — saving the object to a file
        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("student.ser"));
        oos.writeObject(new Student("Alice", 20, "secret123"));
        oos.close();

        // Deserialization — restoring the object from the file
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream("student.ser"));
        Student s = (Student) ois.readObject();
        System.out.println(s.name);      // Alice
        System.out.println(s.age);       // 20
        System.out.println(s.password);  // null  ← transient was not saved
        ois.close();
    }
}