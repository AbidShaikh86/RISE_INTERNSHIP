import java.nio.file.*;

public class PathExample {
    public static void main(String[] args) {
        Path p = Path.of("/home/user/documents/report.txt");

        // Extracting parts of the path
        System.out.println(p.getFileName());    // report.txt
        System.out.println(p.getParent());      // /home/user/documents
        System.out.println(p.getRoot());        // /
        System.out.println(p.getNameCount());   // 4

        // Joining two paths together
        Path base = Path.of("/home/user");
        Path full = base.resolve("documents/report.txt");
        System.out.println(full);               // /home/user/documents/report.txt

        // Finding relative path between two locations
        Path from = Path.of("/home/user/documents");
        Path to   = Path.of("/home/user/photos");
        System.out.println(from.relativize(to)); // ../photos
    }
}