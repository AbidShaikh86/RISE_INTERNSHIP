import java.io.*;

public class ByteStreamExample {
    public static void main(String[] args) throws IOException {
        // Writing bytes to a file
        FileOutputStream fos = new FileOutputStream("data.bin");
        fos.write(65);                        // writes 'A'
        fos.write(new byte[]{66, 67, 68});    // writes 'B', 'C', 'D'
        fos.close();

        // Reading bytes from a file
        FileInputStream fis = new FileInputStream("data.bin");
        int b;
        while ((b = fis.read()) != -1) {
            System.out.print((char) b);       // Output: ABCD
        }
        fis.close();
    }
}