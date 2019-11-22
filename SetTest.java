
import org.junit.Test;


import static org.junit.Assert.assertEquals;

public class SetTest {




    @Test

    public void insertSCAndBCTest(){
        //Arrange
        Set set = new Set();
        set.insert(10);
        set.insert(1);
        set.insert(10);
        set.insert(11);
        int[] a = set.toArray();

        //expected
        int expectedValue1=1;
        int expectedValue2=10;

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
      boolean realValue2= set.member(11);
      boolean realValue3 = set.member(9);

        //expected

        boolean expectedValue= true;
        boolean expectedValue2 =false;
        boolean expectedValue3 = false;

        //Test
        assertEquals(expectedValue,realValue);
        assertEquals(expectedValue2,realValue2);
        assertEquals(expectedValue3,realValue3);



    }
}
