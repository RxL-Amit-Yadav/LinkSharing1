<html>
<title>Ls_HomePage</title>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'user.css')}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

</head>

<body>
<header>
    <g:if test="${flash.message}">${flash.message}</g:if>
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
                    <div class="write">
                        <a href="#" class="sname">Amit Yadav</a>
                        <a href="#">grails</a>
                        <br>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown </p>
                        <a href="#">view_post</a>
                    </div>

                </div>
                <br>
                <div class="recent-1">
                    <div class="image">

                    </div>
                    <div class="write">
                        <a href="#" class="sname">Uday Pratab Singh</a>
                        <a href="#">grails</a>
                        <br>
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
                    <div class="image1">

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
        <div>
            <div id="second-half">
                <div class="wrapper">
                    <div class="title-text">
                        <div class="title login">
                            Login Form</div>
                        <div class="title signup">
                            Signup Form</div>
                    </div>
                    <div class="form-container">
                        <div class="slide-controls">
                            <input type="radio" name="slide" id="login" checked>
                            <input type="radio" name="slide" id="signup">
                            <label for="login" class="slide login">Login</label>
                            <label for="signup" class="slide signup">Signup</label>
                            <div class="slider-tab">
                            </div>
                        </div>
                        <div class="form-inner">
                            <g:form controller="login" action="action1" class="login">
                                <div class="field">
                                    <input type="text" name="email" placeholder="Email Address" required>
                                </div>
                                <div class="field">
                                    <input type="password" name="password" placeholder="Password" required>
                                </div>
                                <div class="pass-link">
                                    <a href="#">Forgot password?</a></div>
                                <div class="field btn">
                                    <div class="btn-layer">
                                    </div>
                                    <input type="submit" value="Login">
                                </div>
                                <div class="signup-link">
                                    Not a member? <a href="">Signup now</a></div>
                            </g:form>
                            <g:form controller="globalUser" action="draw" class="signup">
                                <div class="field">
                                    <input type="text" name="firstname" placeholder="firstName" required>
                                </div>
                                <div class="field">
                                    <input type="text" name="lastname" placeholder="lastname" required>
                                </div>
                                <div class="field">
                                    <input type="text" name="email" placeholder="Email Address" required>
                                </div>
                                <div class="field">
                                    <input type="text" name="username" placeholder="Username" required>
                                </div>
                                <div class="field">
                                    <input type="password" name="password" placeholder="Password" required>
                                </div>
                                <div class="field">
                                    <input type="password" name="cpassword" placeholder="Confirm password" required>
                                </div>
                                <div class="field">
                                    <input type="file" name="photo" placeholder="attach">
                                </div>

                                <div class="field btn">
                                    <div class="btn-layer">
                                    </div>
                                    <input type="submit" value="Signup">
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                const loginText = document.querySelector(".title-text .login");
                const loginForm = document.querySelector("form.login");
                const loginBtn = document.querySelector("label.login");
                const signupBtn = document.querySelector("label.signup");
                const signupLink = document.querySelector("form .signup-link a");
                signupBtn.onclick = (()=>{
                    loginForm.style.marginLeft = "-50%";
                loginText.style.marginLeft = "-50%";
                });
                loginBtn.onclick = (()=>{
                    loginForm.style.marginLeft = "0%";
                loginText.style.marginLeft = "0%";
                });
                signupLink.onclick = (()=>{
                    signupBtn.click();
                return false;
                });
            </script>
</body>


</html>