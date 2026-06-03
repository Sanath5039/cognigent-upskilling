import java.util.HashMap;
import java.util.Scanner;

public class HashMapDemo {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        HashMap<Integer, String> map =
            new HashMap<>();

        System.out.print(
            "Enter number of students: "
        );

        int n = sc.nextInt();
        sc.nextLine();

        for(int i=0; i<n; i++) {

            System.out.print("ID: ");
            int id = sc.nextInt();
            sc.nextLine();

            System.out.print("Name: ");
            String name = sc.nextLine();

            map.put(id, name);
        }

        System.out.print(
            "\nEnter ID to search: "
        );

        int id = sc.nextInt();

        System.out.println(
            "Student Name: " +
            map.get(id)
        );

        sc.close();
    }
}