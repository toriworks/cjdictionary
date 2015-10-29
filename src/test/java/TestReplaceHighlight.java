import junit.framework.Assert;
import org.junit.Test;

/**
 * Created by kimhyoseok on 2015-10-28.
 */
public class TestReplaceHighlight {

    @Test
    public void testReplaceHightlight() {
        String ori = "<$엽상채#001.jpg^엽상채$>";

        // 첫번째 문자열 매칭 - ^<\$  => <a href="showLayer('
        // 두번째 문자열 매칭 - #  => ','
        // 세번째 문자열 매칭 - ^  => ’);>
        // 네번째 문자열 매칭 - (\$>)  => </a>

        ori = ori.replaceAll("^<\\$", "<a href=\"showLayer('");
        ori = ori.replaceAll("#", "','");
        ori = ori.replaceAll("\\^", "\");");
        ori = ori.replaceAll("(\\$>)", "</a>");

        System.out.println(ori);
//        Assert.assertEquals(ori, "<a href=”showLayer(‘엽상채’,’001.jpg’);>엽상채</a>");
    }
}
