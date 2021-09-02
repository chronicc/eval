import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

public class MoodAnalyserTest {
    @Test
    public void testMoodAnalysis() {
        final MoodAnalyser moodanalyser = new MoodAnalyser();

        String mood = moodanalyser.analyseMood("This is a sad message");
        assertThat(mood, is("SAD"));

        mood = moodanalyser.analyseMood("This is a good message");
        assertThat(mood, is("GOOD"));
    }
}
