package com.sndevops.eng;


import org.junit.Assert;
import org.junit.Test;

public class AppTest {

    private String INPUT = "123456";
    private String INPUT1 = "1234567";
    private String INPUT2 = "1113";
    private boolean isPassed = true;
    // Add more tests
    @Test
    public void testLength() {
        // Add few more details. More details to be added 
        Assert.assertEquals(INPUT,"123456");
        Assert.assertEquals(INPUT2,"1113");
    }
    
    @Test
    public void testPassed() {
        // Add test cases 
        // Add few lines
        Assert.assertEquals(isPassed,true);
        Assert.assertEquals(isPassed,true);
    }
}
