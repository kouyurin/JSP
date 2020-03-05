<%@ page contentType="text/html;charset=UTF-8" %>
<%
  //player name
  String pn = request.getParameter("pn");
  if(pn == null) { pn = ""; }

  //games input
  int p;
  String pStr = request.getParameter("p");
  if(pStr == null) {p = -1;}
  else { p = Integer.parseInt(pStr);}

  int hp;
  String hpStr = request.getParameter("hp");
  if(hpStr == null){hp = 20;}
  else {hp = Integer.parseInt(hpStr);if(hp < 0){hp = 0;}}

  int win;
  String wStr = request.getParameter("win");
  if(wStr == null) {win = 0;}
  else { win = Integer.parseInt(wStr);}

  int lose;
  String loseStr = request.getParameter("lose");
  if(loseStr == null) {lose = 0;}
  else { lose = Integer.parseInt(loseStr);}

  int draw;
  String drawStr = request.getParameter("draw");
  if(drawStr == null) {draw = 0;}
  else { draw = Integer.parseInt(drawStr);}

  int op;
  String opStr = request.getParameter("op");
  if(opStr == null) {op = 0;}
  else { op = Integer.parseInt(opStr);}

  //game data
  String[] c = {"https://pbs.twimg.com/media/DEIIzUgU0AAzUj9.jpg",
  "https://i.ytimg.com/vi/zlmKbmUyI2Q/maxresdefault.jpg",
  "https://firstview.heteml.jp/kg/wp-content/uploads/2014/12/padennen.jpg"};
  int com = (int)(Math.random() * 3);
  String cp = c[com];
  
  String[] cn = {"グー","チョキ","パー"};
  String ci = cn[com];
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>じゃんけんゲーム</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      text-decoration: none;
      font-family: motserrat;
      box-sizing: border-box;
    }
    body{
      min-height: 100vh;
      background-image: linear-gradient(120deg,#3498db,#8e44ad);
    }
    .hes1 {
      color: #3498db;
      font-size: 50px;
      margin: 0 0 20px 0;
    }
    .hes2 {
      font-size: 60px;
      text-align: center;
    }
    .login-form {
      width: 660px;
      background: #f1f1f1;
      height: 580px;
      padding: 50px 40px;
      border-radius: 10px;
      position:absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%,-50%);
    }
    .login-form h1 {
      text-align: center;
    }
    .txtb {
      border-bottom: 2px solid #adadad;
      position: relative;
      margin: 30px 0;
    }
    .t1 {
      color:#8e44ad;
      font-weight: 600;
    }
    .in1 {
      font-size: 15px;
      color: #333;
      border: none;
      width: 100%;
      outline: none;
      background: none;
      padding: 0 5px;
      height: 30px;
    }
    .logbtn {
      display: block;
      width: 100%;
      height: 50px;
      font-size: 20px;
      font-weight: 600;
      border: none;
      background: linear-gradient(120deg,#3498db,#8e44ad,#3498db);
      background-size: 200%;
      color: #fff;
      outline: pointer;
      transition: .5s;
    }
    .img1 {
      width: 580px;
      height: 360px;
    }
    .p1 {
      text-align: center;
      font-size: 30px;
      font-weight: 600;
      color: #0099FF;
    }
    .p2 {
      font-size: 30px;
      font-weight: 600;
      color: #32CD32;
    }
    .p3 {
      text-align: center;
      font-size: 30px;
      font-weight: 600;
      color: #FF69B4;
    }
    .p4 {
      text-align: center;
      font-size: 30px;
      font-weight: 600;
      color: #FF8C00;
    }
    .p5 {
      text-align: center;
      font-size: 30px;
      font-weight: 600;
      color: #2E8B57;
    }
    .p6 {
        color:#136FFF;
    }
    .se1 {
      appearance: none;
      outline: none;
      box-shadow: none;
      background: #FFFF99;
      border: 0 !important;
      width: 100%;
      height: 100%;
      margin: 0;
      padding: 0 0 0 .5em;
      color: #333333;
      font-size: 20px;
      font-weight: 700;
      letter-spacing: .8px;
      cursor: pointer;
    }
    .se2 {
      position: relative;
      display: block;
      width: 100%;
      height: 3em;
      background: #FFFF99;
      overflow: hidden;
      line-height: 3;
      border-radius: .25em;
    }
    .tx1 {
      font-weight: 700;
    }
    .bu1 {
      margin: 5px 0 5px 150px;
      background: #FFFF99;
      width: 290px;
      color: #1670f0;
      padding: 30px 60px;
      font-size: 30px;
      font-weight: 700;
      letter-spacing: 2px;
    }
    .bu2 {
      margin: 0 0 0 535px;
      font-size: 20px;
      font-weight: 600;
      background: #4689FF;
      padding: 1;
    }
    .txc1 {
      font-size: 40px;
      font-weight: 600;
      color: #FFD700;
      text-align: center;
    }
    .txc2 {
      font-size: 35px;
      font-weight: 600;
      color: #FF8C00;
    }
    .txc3 {
      font-size: 30px;
      font-weight: 600;
      color: #2E8B57;
    }
    .txc4 {
      font-size: 25px;
      font-weight: 600;
      color: #111111;
    }
    .txr {
      font-size: 20px;
      font-weight: 600;
      color: #005FFF;
      margin: 0 0 0 300px;
    }
    .txc5 {
      font-size: 40px;
      font-weight: 700;
      color: #FFD700;
      text-align: center;
      margin: 100px 0;
    }
    .txc6 {
      font-size: 40px;
      font-weight: 700;
      color: #FF8C00;
      text-align: center;
      margin: 100px 0;
    }
    .a1 {
      text-decoration: none;
      position: relative;
      font-size: 30px;
      font-weight: 700;
      display: block;
      overflow: hidden;
      transition: 0.7s all;
      margin: 120px 0 0 460px;
    }
    .a1 a::before {
      content: '';
      width: 60px;
      color: #313131;
      position: absolute;
      border-bottom: 4px solid #313131;
      bottom: 0;
      left: 70px;
      transition: 0.5s all;
    }
    .a1 a:hover:before {
      left: 0;
    }
    .tse1 {
      font-size: 35px;
      font-weight: 700;
      color: #FF77FF;
      text-align: center;
    }
    .tse2 {
      font-size: 30px;
      font-weight: 700;
      color: #5507FF;
      margin: 0 0 0 370px;
    }
    </style>
</head>
<body>
  <form action="./" method="GET">
    <div class="login-form">
    <% if(pn.isEmpty()) { %>
      <%-- ゲームの準備 --%>
      <h1 class="hes1">じゃんけんゲーム</h1>
      <p class="hes2">👊　✌🏽　🖐</p>
      <div class="txtb">
        <nobr class="t1">プレイヤー名：<input type="text" name="pn" class="in1"></nobr>
      </div>
      <div>
      <button type="submit" value="start" class="logbtn">スタート</button>
      </div>
      <div class="se2">
        <select name="op" class="se1">
          <option value="3" class="tx1">3回勝ち勝負</option>
          <option value="5" class="tx1">5回勝ち勝負</option>
          <option value="8" class="tx1">8回勝ち勝負</option>
          <option value="10" class="tx1">10回勝ち勝負</option>
        </select>
      </div>
    </div>
    <% } else if(win < op && lose < op && hp > 0){ %>
      <input type="hidden" name="op" value="<%= op %>">
      <input type="hidden" name="pn" value="<%= pn %>">
      <% if(p < 0 ) {%>
        <div>
          <p class="p1"><%= pn %>さんの手を選びください。</p>
          <p class="txr"><%= pn %>さんのHP：<%= hp %></p>
          <button type="submit" name="p" value="0" class="bu1">
            👊グー👊
          </button><br>
          <button type="submit" name="p" value="1" class="bu1">
            ✌🏽チョキ✌🏽
          </button><br>
          <button type="submit" name="p" value="2" class="bu1">
            🖐パー🖐
          </button>
        </div>
      <% } else { %>
        <div class="p2"><%= win + lose +draw+1 %>回目　　　　　　　　　　　　　<nobr class="p6"><%= ci %></nobr></div>
        <div>
          <img src="<%= cp %>" class="img1">
          </img>
        </div>
        <div>
          <% if(p == 0 && com == 1 || p == 1 && com == 2 || p == 2 && com == 0) {
            win++;%>
            <p class="p3">😄あなたの勝ち😄</p>
          <%}  else if (p == 0 && com == 2 || p == 1 && com == 0 || p == 2 && com == 1) {
            lose++;%>
            <p class="p4">😭あなたの負け😭</p>
            <%if(p == 0 && com == 2) {
              hp -=5;
            } else {
              hp -=2;
            }%>
          <%} else{
              hp -=1;
             draw++;%>
             <p class="p3">😑あいこ😑</p>
      <%}%>
        </div>
        <input type="submit" value="次へ" class="bu2">
        <% } %>
    <% } else { %>
      <div>
        <p class="tse1">🌸🌸<%= pn %>さんの成績🌸🌸</p>
        <p class="tse2"><%= op %>回勝ち勝負</p>
        <p class="txc1">勝：<%= win %>　<nobr class="txc2">敗：<%= lose %></nobr>　<nobr class="txc3">相：<%= draw %></nobr>　<nobr class="txc4">総：<%= win+lose+draw %>回</nobr></p>
        <p class="txr"><%= pn %>さんのHP：<%= hp %></p>
        <%
        if(win > lose){%>
          <p class="txc5">😄あなたの勝ちです。😄</p>
        <%}else{%>
          <p class="txc6">😭あなたの負けです。😭</p>
        <%}%>
      </div>
      <div class="a1"><a href="./">最初から</a></div>
    <% } %>
    <input type="hidden" name="win" value="<%= win %>">
    <input type="hidden" name="lose" value="<%= lose %>">
    <input type="hidden" name="draw" value="<%= draw %>">
    <input type="hidden" name="hp" value="<%= hp %>">
  </form>
</body>
</html>