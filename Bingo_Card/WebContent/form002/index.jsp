<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="utf-8">
    <% String title = "ビンゴカード"; %>
    <title><%= title %></title>
    <style>
    body {
        background-image : url(https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero-00e10b1f.jpg);
        background-size : auto;
    }
    h1{
        color : #3399FF;
        font-size : 60px;
        margin : 70px 0 20px;
        text-align : center;
    }
    table {
        color : #3cb371;
        margin-left : auto;
        margin-right : auto;
        text-align : center;
        font-weight : 900;
        font-size : 45px;
    }
    table td {
        padding: 25px;
        background: #fff5e5;
    }
    .t {
        color : #000000;
    }
    </style>
</head>
<body>
    <h1><%= title %></h1>
    <% List<Integer> a = new ArrayList<Integer>();
        for(int d = 1; d <= 99; d++){
            a.add(d);%>
        <%}%>
    <table border="1">
    <% for(int i = 0; i < 2; i++) {%>
        <tr>
        <% for(int b = 0; b < 5; b++) {
            int c = (int)(Math.random() * a.size());%>
            <td>
            <%= a.remove(c) %>
            </td>
        <%}%>
        </tr>
    <% }%>
        <tr>
        <% for(int e = 0; e < 2; e++) {
            int f = (int)(Math.random() * a.size());%>
            <td>
            <%= a.remove(f) %>
            </td>
        <%}%>
            <td class="t">*</td>
        <% for(int e = 0; e < 2; e++) {
            int f = (int)(Math.random() * a.size());%>
            <td>
            <%= a.remove(f) %>
            </td>
        <%}%>
        </tr>
    <% for(int i = 0; i < 2; i++) {%>
        <tr>
        <% for(int b = 0; b < 5; b++) {
            int c = (int)(Math.random() * a.size());%>
            <td>
            <%= a.remove(c) %>
            </td>
        <%}%>
        </tr>
    <% }%>
    </table>
</body>
</html>