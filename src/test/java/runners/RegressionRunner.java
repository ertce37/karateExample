package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class RegressionRunner {


    @Test
    void regressionRunner(){
        Results results = Runner.path("classpath:featuresApi")
                .tags("~@ignore")
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }
}
