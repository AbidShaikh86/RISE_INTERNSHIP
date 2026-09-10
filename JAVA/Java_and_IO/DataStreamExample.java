import java.io.*;

public class DataStreamExample {
    public static void main(String[] args) throws IOException {
        DataOutputStream dos = new DataOutputStream(new FileOutputStream("data.dat"));
        dos.writeInt(42);
        dos.writeDouble(3.14);
        dos.writeBoolean(true);
        dos.writeUTF("Java");
        dos.close();

        DataInputStream dis = new DataInputStream(new FileInputStream("data.dat"));
        System.out.println(dis.readInt());      // 42
        System.out.println(dis.readDouble());   // 3.14
        System.out.println(dis.readBoolean());  // true
        System.out.println(dis.readUTF());      // Java
        dis.close();
    }
}