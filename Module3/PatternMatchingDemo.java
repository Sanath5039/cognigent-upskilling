public class PatternMatchingDemo {

    static void checkType(
            Object obj) {

        String result =
            switch(obj) {

                case Integer i ->
                    "Integer : " + i;

                case String s ->
                    "String : " + s;

                case Double d ->
                    "Double : " + d;

                case null ->
                    "Null value";

                default ->
                    "Unknown Type";
            };

        System.out.println(
            result
        );
    }

    public static void main(
            String[] args) {

        checkType(100);

        checkType(
            "Hello"
        );

        checkType(
            12.5
        );
    }
}