<%@ page import="ecs189.querying.github.GithubQuerier" %><%--
  Created by IntelliJ IDEA.
  User: Vincent
  Date: 7/3/2017
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
    <link rel='stylesheet' href='main.css'>
      <style type = "text/css">
          body#body {

              background: #68757f;

          }
          .img1logo{
              padding-top: 10px;
              transform:   translateX(530px) ;

          }

          .h2class{
              color: white;
              text-align: center;
          }
          .h4class{
              color: #c0c2c0;
              text-align: center;
          }

          .form-control{
              -webkit-box-sizing: content-box;
              -moz-box-sizing: content-box;
              box-sizing: content-box;
              top: 0;
              right: 0;
              border: 1px solid #b7b7b7;
              border-top-width: 0;
              -webkit-border-radius: 50px;
              border-radius: 50px;
              font: normal 16px/normal "Times New Roman", Times, serif;
              color: rgba(0,142,198,1);
              -o-text-overflow: clip;
              text-overflow: clip;
              background: rgba(204,208,209,1);
              -webkit-box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.2) inset;
              box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.2) inset;
              text-shadow: 1px 1px 0 rgba(255,255,255,0.66) ;
              -webkit-transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1);
              -moz-transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1);
              -o-transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1);
              transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1);
              transform:   translateX(520px) ;
          }

          .btn{
              display: inline-block;
              -webkit-box-sizing: content-box;
              -moz-box-sizing: content-box;
              box-sizing: content-box;
              width: 76px;
              height: 13px;
              cursor: pointer;
              padding: 10px 20px;
              border: 1px solid #018dc4;
              -webkit-border-radius: 51px;
              border-radius: 51px;
              font: normal 16px/normal "Times New Roman", Times, serif;
              color: rgba(255,255,255,0.9);
              -o-text-overflow: clip;
              text-overflow: clip;
              background: rgba(204,208,209,1);
              -webkit-box-shadow: 2px 2px 2px 0 rgba(50,87,96,1) ;
              box-shadow: 2px 2px 2px 0 rgba(50,87,96,1) ;
              text-shadow: -1px -1px 0 rgba(15,73,168,0.66) ;
              -webkit-transition: all 300ms cubic-bezier(0.42, 0, 0.58, 1);
              -moz-transition: all 300ms cubic-bezier(0.42, 0, 0.58, 1);
              -o-transition: all 300ms cubic-bezier(0.42, 0, 0.58, 1);
              transition: all 300ms cubic-bezier(0.42, 0, 0.58, 1);
              transform:   translateX(620px) ;
          }
          /*https://codepen.io/loktar00/pen/FmkAd    */
          #hitarea{
              position: inherit;
              padding-bottom: inherit;
              width:500px;
              height:500px;
              transform:   translateX(430px) ;
          }

          .hitbox{
              width:70px;
              height:70px;
              float:left;
          }

          /* eyes */
          .eye{
              position:absolute;
              width:100px;
              height:100px;
              background: #fff;
              border-radius:50px;
              left:25%;
              top: 40%;
              pointer-events: none;
          }

          .eye+.eye{
              left: 55%;
          }

          .pupil{
              position:relative;
              width:25px;
              height:25px;
              background:#68757f; /*#000*/
              border-radius:12px;
              left:50%;
              top:50%;
              margin:-12px 0 0 -12px;
              -webkit-transition: all .5s ease;
          }

          .eyelid{
              width:150px;
              height: 100px;
              position:absolute;
              left:20%;
              top: 25%;
              pointer-events: none;
              background: #68757f;
              -webkit-animation-name:             blink;
              -webkit-animation-duration:         4.5s;
              -webkit-animation-iteration-count:  infinite;
              -webkit-animation-timing-function:  linear;
              -webkit-animation-direction:        alternate;
              -webkit-animation-delay: 1s;
              -webkit-transition: all .5s ease;

          }

          .eyelid+.eyelid{
              left: 50%;
          }

          /* Blinking eyes */
          @-webkit-keyframes blink{
              0%{
                  top:25%;
              }
              95%{
                  top:25%;
              }
              100%{
                  top:40%;
              }
          }

          /* hover events */

          /* eye lids */
          .hitbox:hover ~ .eyelid{
              -webkit-transform: rotate(-10deg);
          }
          .hitbox:hover ~ .eyelid:nth-of-type(2n+1){
              -webkit-transform: rotate(10deg);
          }
          #c-3:hover ~ .eyelid{
              -webkit-transform: rotate(15deg);
          }
          #c-3:hover ~ .eyelid:nth-of-type(2n+1) {
              -webkit-transform: rotate(-15deg);
          }

          /* pupils */

          #a-1:hover ~ .eye > .pupil{
              -webkit-transform: rotate(60deg) translate(-30px);
          }

          #a-2:hover ~ .eye > .pupil{
              -webkit-transform: rotate(80deg) translate(-30px);
          }

          #a-3:hover ~ .eye > .pupil{
              -webkit-transform: rotate(90deg) translate(-30px);
          }

          #a-4:hover ~ .eye > .pupil{
              -webkit-transform: rotate(100deg) translate(-30px);
          }

          #a-5:hover ~ .eye > .pupil{
              -webkit-transform: rotate(120deg) translate(-30px);
          }

          #b-1:hover ~ .eye > .pupil{
              -webkit-transform: rotate(50deg) translate(-25px);
          }

          #b-2:hover ~ .eye > .pupil{
              -webkit-transform: rotate(70deg) translate(-25px);
          }

          #b-3:hover ~ .eye > .pupil{
              -webkit-transform: rotate(100deg) translate(-25px);
          }

          #b-3:hover ~ .eye:nth-of-type(2n+1) > .pupil {
              -webkit-transform: rotate(80deg) translate(-25px);
          }

          #b-4:hover ~ .eye > .pupil{
              -webkit-transform: rotate(110deg) translate(-25px);
          }

          #b-5:hover ~ .eye > .pupil{
              -webkit-transform: rotate(130deg) translate(-25px);
          }

          #c-1:hover ~ .eye > .pupil{
              -webkit-transform: rotate(0deg) translate(-25px);
          }

          #c-2:hover ~ .eye > .pupil{
              -webkit-transform: rotate(0deg) translate(-10px);
          }

          #c-3:hover ~ .eye > .pupil{
              background: #8badb7;
              -webkit-transform: rotate(180deg) translate(-25px);
          }

          #c-3:hover ~ .eye:nth-of-type(2n+1) > .pupil {
              -webkit-transform: rotate(0deg) translate(-25px);
          }

          #c-4:hover ~ .eye > .pupil{
              -webkit-transform: rotate(180deg) translate(-10px);
          }

          #c-5:hover ~ .eye > .pupil{
              -webkit-transform: rotate(180deg) translate(-25px);
          }

          #d-1:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-40deg) translate(-25px);
          }

          #d-2:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-60deg) translate(-25px);
          }

          #d-3:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-120deg) translate(-25px);
          }

          #d-3:hover ~ .eye:nth-of-type(2n+1) > .pupil {
              -webkit-transform: rotate(-60deg) translate(-25px);
          }

          #d-4:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-130deg) translate(-25px);
          }

          #d-4:hover ~ .eye:nth-of-type(2n+1) > .pupil{
              -webkit-transform: rotate(-100deg) translate(-25px);
          }

          #d-5:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-140deg) translate(-25px);
          }

          #e-1:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-40deg) translate(-30px);
          }

          #e-2:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-60deg) translate(-30px);
          }

          #e-3:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-120deg) translate(-30px);
          }

          #e-3:hover ~ .eye:nth-of-type(2n+1) > .pupil {
              -webkit-transform: rotate(-60deg) translate(-30px);
          }

          #e-4:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-130deg) translate(-30px);
          }

          #e-4:hover ~ .eye:nth-of-type(2n+1) > .pupil{
              -webkit-transform: rotate(-100deg) translate(-30px);
          }

          #e-5:hover ~ .eye > .pupil{
              -webkit-transform: rotate(-140deg) translate(-30px);
          }
      </style>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Github Stalker</title>
  </head>
  <body id="body">
  <div id="core">
    <img class="img1logo" src="Logo.png" alt="Logo">
    <h2 class = "h2class">Github Stalking Made Easy</h2>
      <h4 class = "h4class">This is a Github Stalker that tracks a person's latest 10 push events</h4>
      <h4 class = "h4class">All you have to do is enter the Github Username of the person </h4>
    <form action="index.jsp" method="GET">
      <div class="form-group">
        <label for="user"><h3 class = "h3class"><!-Github username:-></h3></label>
        <input type="user" name="user_name" class="form-control" id="user"
               value="<%= request.getParameter("user_name") == null ? "" : request.getParameter("user_name")%>">
      </div>
      <%String user=request.getParameter("user_name"); %>
      <button type="submit" class="btn btn-default">
        <c:choose>
          <c:when test="${empty user}">
            Submit
          </c:when>
          <c:otherwise>
            Refresh
          </c:otherwise>
        </c:choose>
      </button>
    </form>
    <div id="activity">
      <%if (user != null && !user.isEmpty()){%>
          <%=GithubQuerier.eventsAsHTML(user)%>
        <% } else { %>
        <div id="mymy">  </div>
        <% }%>
    </div>
  </div>





  <!-https://codepen.io/loktar00/pen/FmkAd->
<!-Tell me who you are, and I will tell you what you did last ... week? Month? Summer? Not sure yet.>
  <div id="hitarea">
      <div id="a-1" class="hitbox"></div>
      <div id="a-2" class="hitbox"></div>
      <div id="a-3" class="hitbox"></div>
      <div id="a-4" class="hitbox"></div>
      <div id="a-5" class="hitbox"></div>
      <div id="b-1" class="hitbox"></div>
      <div id="b-2" class="hitbox"></div>
      <div id="b-3" class="hitbox"></div>
      <div id="b-4" class="hitbox"></div>
      <div id="b-5" class="hitbox"></div>
      <div id="c-1" class="hitbox"></div>
      <div id="c-2" class="hitbox"></div>
      <div id="c-3" class="hitbox"></div>
      <div id="c-4" class="hitbox"></div>
      <div id="c-5" class="hitbox"></div>
      <div id="d-1" class="hitbox"></div>
      <div id="d-2" class="hitbox"></div>
      <div id="d-3" class="hitbox"></div>
      <div id="d-4" class="hitbox"></div>
      <div id="d-5" class="hitbox"></div>
      <div id="e-1" class="hitbox"></div>
      <div id="e-2" class="hitbox"></div>
      <div id="e-3" class="hitbox"></div>
      <div id="e-4" class="hitbox"></div>
      <div id="e-5" class="hitbox"></div>
      <div class="eye">
          <div class="pupil"></div>
      </div>
      <div class="eye">
          <div class="pupil"></div>
      </div>
      <div class="eyelid"></div>
      <div class="eyelid"></div>
  </div>


  <!-- YOUR CODE HERE -->
  <script type="text/javascript" src="move.js"></script>
  <script type="text/javascript" src="webjars/jquery/2.1.3/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>
