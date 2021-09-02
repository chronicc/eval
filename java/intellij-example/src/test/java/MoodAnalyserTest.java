import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

public class MoodAnalyserTest {
    @Test
    public void testMoodAnalysis() {
        final MoodAnalyser moodanalyser = new MoodAnalyser();
        final String mood = moodanalyser.analyseMood("This is a sad message");
        assertThat(mood, is("SAD"));
    }
}
