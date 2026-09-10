import java.io.*;

public class BufferedStreamExample {
    public static void main(String[] args) throws IOException {
        // Buffered Writing — collects in memory, writes to disk at once
        BufferedWriter bw = new BufferedWriter(new FileWriter("buffered.txt"));
        bw.write("Line 1");
        bw.newLine();
        bw.write("Line 2");
        bw.newLine();
        bw.write("Line 3");
        bw.close();

        // Buffered Reading — reads full chunk, serves line by line from memory
        BufferedReader br = new BufferedReader(new FileReader("buffered.txt"));
        String line;
        while ((line = br.readLine()) != null) {  // readLine() is the key advantage
            System.out.println(line);
        }
        // Output:
        // Line 1
        // Line 2
        // Line 3
        br.close();
    }
}