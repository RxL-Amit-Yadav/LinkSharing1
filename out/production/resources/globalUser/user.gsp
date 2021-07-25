<html>
<title>Ls_HomePage</title>
<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    body{
        background-image: linear-gradient(lightblue,white);
    }
    /* header section */
    .header{
        border: 2px solid black;
        width: auto;
        height:40px;
        padding: 2px;
        border-radius: 20px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    .link{
        height: 100%;
        /* border:2px solid black; */
        padding-top: 9px;
    }
    .link a{
        text-align: center;
        font-size: 25px;
        margin-top: 30px;

    }
    .link a:hover{
        transition: 0.5s;
        color: grey;
    }
    #search_bar{
        /* border: 2px solid black; */
        padding-top: 9px;
        border-radius: 20px;
        padding-bottom: 2px;
        position: relative;
    }
    #search_bar i{
        position: absolute;
        right: 5px;
        font-size: 25px;

    }
    #search_bar input{
        font-size: 20px;
        border-radius: 20px;
        margin: auto;

    }
    /* Main page */
    #main{
        display: flex;
        justify-content: space-around;
        width: auto;
        height:80%;
        /* border: 2px solid black; */
    }
    #first-half{
        height: 100%;
        width: 40%;
        display: flex;
        flex-direction: column;
        /* border: 2px solid black; */
        justify-content:space-between;
        position: relative;
    }
    #recent-share{
        height:50%;
        width: 100%;
        border: 1px solid black;
        left: 0%;
    }
    #recent-share h4{
        margin-top: 0%;
        padding: 0%;
        border: 1px solid black;
    }
    #top-post{
        height: 40%;
        width: 100%;
        margin-top: 0%;
        border: 1px solid black;
        left: 0%;
    }
    #top-post h4{
        margin-top: 0%;
        border: 1px solid black;
    }
    #top-post h4 select{
        float: right;
        background-color: lightgrey;
    }


    #second-half{
        height: 100%;
        width: 40%;
        display: flex;
        flex-direction: column;
        /* border: 2px solid black; */
        justify-content:space-between;
        position: relative;
    }
    /* Login page */
    #login{
        width: 70%;
        height: 150px;
        margin-left: 15%;
        border: 2px solid black
    }
    #login h4{
        margin: 0%;
        padding: 0%;
        border: 1px solid black;
    }
    #login #email{
        margin-left: 5%;
    }
    #login #password{
        margin-left: 18%;
        margin-top: 5%;
    }
    #login a:hover{
        transition: 0.5s;
        color: black;
    }
    #register{
        width: 70%;
        height: 350px;
        margin-left: 15%;
        border: 2px solid black;
        box-sizing: border-box;
    }
    #register h4{
        padding: 0%;
        margin: 0%;
        border: 1px solid black;
    }

    #register label{
        padding:10px;
    }
    #register #fname{
        margin-left: 15%;

    }
    #register #lname{
        margin-left: 15%;
        margin-top: 5%;
    }
    #register #cpassword{
        margin-left: 35%;
        margin-top: 5%;
    }

    #register #uname{
        margin-left: 16.5%;
        margin-top: 5%;
    }
    #register #password{
        margin-left: 17%;
        margin-top: 5%;
    }
    #email1l{
        margin-top: 10%;
    }
    #register #email{
        margin-left: 24%;
        margin-top: 5%;
    }
    #register #password1{
        margin-left: 1%;
        margin-top: 5%;
    }
    #myfile{
        margin-left: 24%;
        margin-top: 5%;
    }
    .login{
        float: right;
        width: 90px;
        background-color: lightgrey;
    }
    /* recent share */
    .recent-1{
        /* border: 1px solid black; */
        padding: 2px;
        height: 40%;
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-self: start;
    }
    .recent-1 .image{
        /* border: 1px solid black; */
        height: 100%;
        width: 20%;
        background-image:url("/home/rxlogix/Downloads/profilepictire.png");
        background-size:cover;
        background-position: center;
        margin: 0%;
        padding: 0%;

    }
    .recent-1 #write{
        padding: 0%;
        width: 90%;
        margin-top: 0%;
        /* display: inline-block; */
        /* border: 1px solid green; */
        text-align: center;
    }
    .recent-1 a{
        float: right;
        padding-right: 3%;
    }
    .recent-1 .sname{
        float: left;
    }
    .recent-1 a:hover{
        transition: 0.5s;
        color: black;
    }
    .first-div{

    }

    </style>
</head>
<body>
<header>
    <h2>Home Page</h2>
    <div class=header>
        <div class="link">
            <a href="_blank">Link Sharing</a>
        </div>
        <div id ="search_bar">
            <input type="text" placeholder="Search..">
            <i class="fa fa-close"></i>
        </div>

    </div>
    <br>
</header>
<main>
    <div id="main">
        <div id="first-half">
            <div id="recent-share">
                <h4>Recent Share</h4>
                <div class="recent-1">
                    <div class="image">

                    </div>
                    <div id="write">
                        <a href="#" class="sname">Amit Yadav</a>
                        <a href="#">grails</a>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown </p>
                        <a href="#">view_post</a>
                    </div>

                </div>
                <div class="recent-1">
                    <div class="image">

                    </div>
                    <div id="write">
                        <a href="#" class="sname">Uday Pratab Singh</a>
                        <a href="#">grails</a>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown</p>
                        <a href="#">view_post</a>
                    </div>
                </div>
            </div>
            <div id="top-post">
                <h4>Top Post
                    <select id="day" name="days">
                        <option value="today">Today</option>
                        <option value="week">1 Week</option>
                        <option value="year">1 Year</option>

                    </select>
                </h4>

                <div class="recent-1">
                    <div class="image">

                    </div>
                    <div id="write">
                        <a href="#" class="sname">Shivam</a>
                        <a href="#">grails</a>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown </p>
                        <a href="#">view_post</a>
                    </div>
                </div>
            </div>
        </div>
        <div id=second-half>
            <div id="login">
                <h4>Login</h4>
                <label for="email">Email/UserName *</label>
                <input type="email" id="email" required>
                <label for="password">Password *</label>
                <input type="password" id="password" required>
                <br><br><br>
                <a href="#">Forget Password</a>
                <button class="login">login</button>

            </div>
            <br>
            <div id="register">
                <h4>Register</h4>
                <br>
                <g:form  controller="globalUser" action="draw">
                <label for="fname">First Name</label>
                <input type="text"name="firstname" id="fname" required>

                <label for="lname">Last Name</label>
                <input type="text" name="lastname" id="lname" required>

                <label for="email">Email</label>
                <input type="email" name="email" id = "email" required>

                <label for="uname">Username</label>
                <input type="text" name="username" id="uname" requred>

                <label for="password">Password</label>
                <input type="password" name="password" id="password" required>

                <label for="password">Confirm Password</label>
                <input type="password" id="password1" required>

                <label for="file">Photo</label>
                <input type="text" id="myfile">
                <input type="file" id="file" name="myfile">
                <br>
                <button class="login">Register</button>
                </g:form>




            </div>
        </div>

    </div>
</main>


</body>

</html>