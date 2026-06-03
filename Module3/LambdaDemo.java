import java.util.*;

public class LambdaDemo {

    public static void main(String[] args) {

        List<String> names =
            Arrays.asList(
                "Ravi",
                "Anil",
                "Suresh",
                "Kiran"
            );

        Collections.sort(
            names,
            (a,b) -> a.compareTo(b)
        );

        System.out.println(
            names
        );
    }
}