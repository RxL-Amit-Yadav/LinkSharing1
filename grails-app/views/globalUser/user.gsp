<html>
<title>Ls_HomePage</title>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'user.css')}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
<header>
    <g:if test="${flash.message}">
        <div class="container">
            <!-- Trigger the modal with a button -->
            %{--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#himodal">Open Modal</button>--}%
            <!-- Modal -->
            <div class="modal fade" data-toggle="modal" id="himodal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="background-color:lightgrey">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Hi</h4>
                        </div>
                        <div class="modal-body">
                            <h2>${flash.message}</h2>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </g:if>
    %{--<h2>Home Page</h2>--}%
    %{--<h2>Home Page</h2>--}%
    <div class=header>
        <div class="link">
            <a href="#">Link Sharing</a>
        </div>
        %{--<div id ="search_bar">--}%
            %{--<div class="col-4">--}%
                %{--<g:form class="form-inline my-2 my-lg-0" controller="search" action="search">--}%

                    %{--<input class="form-control mr-sm-2" id="sea" type="search" placeholder="Search" aria-label="Search" name="search" style="border-radius: 60px !important">--}%

                    %{--<button id="btt" type="submit" style="display:none;">Submit</button>--}%
                %{--</g:form>--}%
            %{--</div>--}%
        %{--</div>--}%

    </div>
    <br>
</header>
<main>
    <div id="main">
        <div style="display: flex; flex-direction: column; justify-content:flex-start;width: 80%">
        <div class="first-half" style="height: max-content">
            <div class="recent-share">
                <div style="background-color: lightgrey;height: 20px">
                <h4>Recent Share</h4>
                </div>
                <g:each in="${linksharing.GlobalResource.listOrderByDateCreated(max: 3,order: "desc")}" var="res">
                    <g:if test="${res.topics.visibility!=linksharing.Topic.Visibility.PRIVATE}">
                <div class="recent-1">
                    <div class="image">
                        <asset:image src="${res.globalUser.photo}"/>
                    </div>
                    <div class="write">
                        <p>${res.globalUser.firstname}</p><br>
                        <p>${res.globalUser.username}</p>
                        <p style="float: right">${res.topics.topicname}</p>
                        <br>
                        <br>
                        <div style="text-align: center;margin:0%;">
                        <p>${res.descrip}</p>
                        </div>
                        <div>
                            <i class="fa fa-google" style="font-size: larger;"></i>
                            <i class="fa fa-twitter" style="font-size: larger;"></i>
                            <i class="fa fa-facebook" style="font-size: larger;"></i>
                            %{--<p>View post</p>--}%

                        </div>

                        %{--<g:link>View Post</g:link>--}%
                    </div>

                </div>
                    </g:if>

                </g:each>
            </div>
        </div>
        <br><br><br><br><br><br>
        <div class="first-half" style="height: max-content">

            <div class="recent-share" >
                <div style="background-color: lightgrey; height: 20px">
                <h4>Top Post</h4>
                </div>
                <g:each in="${top}" var="res">
                    <div class="recent-1">
                        <div class="image">
                            <asset:image src="${res.globalUser.photo}"/>
                        </div>
                        <div class="write">
                            <p>${res.globalUser.firstname}</p><br>
                            <p>${res.globalUser.username}</p>
                            <p style="float:right">${res.topics.topicname}</p>
                            <br>
                            <br>
                            <div style="text-align: center;margin:0%">
                                <p>${res.descrip}</p>
                            </div>
                            %{--<p>View post</g:link>--}%

                        </div>

                    </div>

                </g:each>
            </div>
        </div>
        </div>


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
                                    <a data-toggle="modal" data-target="#myModal">Forgot password?</a>
                                </div>



                                <div class="field btn">
                                    <div class="btn-layer">
                                    </div>
                                    <input type="submit" value="Login">
                                </div>
                                <div class="signup-link">
                                    Not a member? <a href="">Signup now</a></div>
                            </g:form>
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Forgot password</h4>
                                        </div>
                                        <div class="modal-body">
                                            <g:form controller="login" action="forgotPassword">
                                                <g:if test="${flash.message}">
                                                    %{--<div class="message" role="alert">--}%
                                                        %{--${flash.message}--}%
                                                    %{--</div>--}%
                                                </g:if>
                                                <div class="field">
                                                    <input type="text" name="email" placeholder="Enter Your Email" required>
                                                </div>
                                                <div class="field">
                                                    <input type="text" name="email2" placeholder="Enter the mail to send the password" required>
                                                </div>
                                                %{--<div class="field">--}%
                                                    %{--<textarea name="body" placeholder="Please type the body"></textarea>--}%
                                                %{--</div>--}%
                                                <div class="field btn">
                                                    <div class="btn-layer">
                                                    </div>
                                                    <input type="submit" value="Update">
                                                </div>
                                            </g:form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <g:uploadForm controller="globalUser" action="draw" class="signup">
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
                                    <input type="password" name="password" id="pas1" placeholder="Password" required>
                                </div>
                                <div class="field">
                                    <input type="password" name="cpassword" id="pas2" placeholder="Confirm password" required>
                                </div>
                                <div class="field">
                                    <input type="file" name="photo" placeholder="attach">
                                </div>

                                <div class="field btn">
                                    <div class="btn-layer">
                                    </div>
                                    <input type="submit" value="Signup" id="Si1">
                                </div>
                            </g:uploadForm>
                        </div>
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
                const SignupButton = document.getElementById('Si1')
                const pas1 = document.getElementById('pas1')
                const pas2 = document.getElementById('pas2');


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
                $("#himodal").modal("show");




            </script>
</body>


</html>