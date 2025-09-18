import nl.han.APP.Challenge.Challenge;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class ChallengeRunningButAlsoTestsProbablyLol {
    String compressString1 = "AAAAABBBBBCCCDDDDEEEEEEF";
    Challenge challenge;

    @Before
    public void setUp() {
        challenge = new Challenge();
    }

    @Test
    public void test1() {
        Assert.assertEquals("A6B5C3D4E6F1", challenge.simpleCompressNonFunctionally(compressString1));
    }
}
