
import org.junit.Test;


import static org.junit.Assert.assertEquals;

public class SetTest {




    @Test

    public void insertSCTest(){
        //Arrange
        Set set = new Set();
        set.insert(10);
        set.insert(1);
        int[] a = set.toArray();

        //expected
        int expectedValue1=10;
        int expectedValue2=1;

        //Test
        assertEquals(expectedValue1,a[0]);
        assertEquals(expectedValue2,a[1]);
    }
@Test
    public void insertBCTest(){
        //Arrange
        Set set = new Set();
        set.insert(2);
        set.insert(1);
        set.insert(3);
        int[] a = set.toArray();

        //expected
        int expectedValue1=2;
        int expectedValue2=1;

        //Test
        assertEquals(expectedValue1,a[0]);
        assertEquals(expectedValue2,a[1]);
    }




    @Test
    public void memberSCAndBCTest(){

        //Arrange
        Set set =new Set();
        set.insert(10);
      boolean realValue = set.member(10);

        //expected

        boolean expectedValue= true;

        //Test

        assertEquals(expectedValue,realValue);


    }
}
