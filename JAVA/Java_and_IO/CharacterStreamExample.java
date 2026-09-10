import java.io.*;

public class CharacterStreamExample {
    public static void main(String[] args) throws IOException {
        // Writing characters
        FileWriter fw = new FileWriter("hello.txt");
        fw.write("Hello, World! નમસ્તે");   // handles Unicode safely
        fw.close();

        // Reading characters
        FileReader fr = new FileReader("hello.txt");
        int ch;
        while ((ch = fr.read()) != -1) {
            System.out.print((char) ch);    // Output: Hello, World! નમસ્તે
        }
        fr.close();
    }
}