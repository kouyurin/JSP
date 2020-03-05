import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FortuneTellingServlet extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 運勢をランダムで決定
    String[] luckArray = { "卯", "辰", "巳","午","未","申","酉","戌","亥","子","丑","寅" };
    int d = (int) (Math.random() * 12);
    String luck = luckArray[d];
    //運勢の文書を作成
    String[] M = {
      "社交的で人に甘えるのが上手です。人間関係は良好ですが、浮気に走りやすい傾向があるので気を付けましょう。",
      "人と違うことを好む傾向にあります。人の輪の中心にいることも多いでしょう。恋人を自分の思い通りにしたいという危ない一面も。",
      "我慢強いのが特徴です。プライドが高く感受性が強いので、小さい事でも恋人に何かを指摘されると、すぐにすねてしまうようです。",
      "情熱的でありながら、一人で行動するのを好む傾向にあります。恋愛では無計画にアタックするので、迷惑がられることも。",
      "見た目はおとなしそうですが、心に芯を持っているのが特徴です。一途な性格なので、恋人とは良いパートナーになれるでしょう。",
      "人とたわむれるのが好きな傾向にあります。遊び好きな性格なので、浮気を疑われないように注意が必要でしょう。 ",
      "頭脳派の人が多いようです。オタク気質があるので、趣味が合う異性をパートナーにすると上手くいきそう。 ",
      "真面目で誠実なのが特徴。愛情深いですが、恥ずかしがり屋が多いようです。時には積極的になりましょう！ ",
      "正義感が強くて頑固な人が多いようです。恋人に対して意見を無理に通そうとすると、嫌われるので注意しましょう。 ",
      "社交的でワイワイ楽しむことが好きなのが特徴です。子孫繁栄の意味も持ち、恋愛に積極的な人が多そうです。",
      "物事に取り組むときは、必ず計画を立てるという特徴があります。結婚生活も上手くいきやすいでしょう。",
      "行動力があるのが特徴で、異性からモテやすいです。しかし、あまり考えずに動く傾向にあるので、注意が必要です。 "
    };
    String Me = M[d];
    // 実行日を取得
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年");
    String today = sdf.format(date);
    // HTMLを出力
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<html>");
    out.println("<head>");
    out.println("<title>うらない の やかた</title>");
    out.println("<style>");
    out.println(".p1 {font-size : 30px; font-weight : 700; margin-left : 70px; color : #FF3399; text-align:center;}");
    out.println(".p2 {font-size : 20px; font-weight : 700; margin-left : 100px; color : #FFD700;}");
    out.println(".p3 {font-size : 20px; font-weight : 800; margin-left : 120px; color : #0000FF;}");
    out.println(".d1 {margin : 50px 0 0 0;}");
    out.println("</style>");
    out.println("</head>");
    out.println("<body>");
    out.println("<div class=\"d1\">");
    out.println("<p class=\"p1\">十二支で占う" + today + "の運勢！</p>");
    out.println("<p class=\"p2\">" + luck + "年生まれ</p>");
    out.println("<p class=\"p3\">" + Me + "</p>");
    out.println("</div>");
    out.println("</body>");
    out.println("</html>");
  }
}