<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>dash_page</title>
    <link rel="stylesheet" href="./EditProfile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<header>
    <h2>Edit Profile</h2>
    <div class="header">
        <div class="link">
            <a href="_blank">Link Sharing</a>
        </div>


        <div id="modals-boot">
            <div id ="search_bar">
                <input type="text" placeholder="Search..">

            </div>
            <div id="pro-file">
                <i class="fa fa-user" style="font-size: 30px;"></i>
                <select id="mypro" name="myPro">
                    <option value="profile">Profile</option>
                    <option value="users">Users</option>
                    <option value="topic">Topic</option>
                    <option value="post">Post</option>
                    <option value="logout">Logout</option>
                </select>
            </div>
        </div>

    </div>
    <br>
</header>
<main id="main-section">
    <div id="first-half">
        <div id="pro-div">
            <div id="start-img">
                <img src="./profilepictire.png" alt="">
            </div>
            <div id="second-start-img">
                <h3>Name of User</h3>
                <a href="#">@Name</a>
                <br>
                <Span>Subscription</Span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <span>Topics</span>
                <br>
                <span>30</span>
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <span>40</span>

            </div>
        </div>
        <br>
        <div class="first-div">
            <div class="header-section">
                <h4>Subscription</h4>
                <a href="#">Viewall</a>
            </div>
            <div class="recent-1">
                <div class="image">
                    <img src="./profilepictire.png" alt="">
                </div>
                <div class="write">
                    <span><a href="#">Grails</a></span><br>
                    <a href="#">@uday</a>&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <Span>Subscription</Span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span>Topics</span>
                    <br>
                    <a href="#">Unsubscribe</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>30</span>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <span>40</span>
                    <div class="one-footer">
                        <select id="serious" name="serious">
                            <option value="serious">Serious</option>
                            <option value="veryserious">Very Serious</option>
                            <option value="casual">Casual</option>

                        </select>
                        <select id="visible" name="visible">
                            <option value="private">private</option>
                            <option value="public">public</option>

                        </select>

                        <!-- first pop -->
                        <div>
                            <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal5" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Send Invitation</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Email</label>
                                                    <input type="text" class="form-control" id="recipient-link" style="width: 60%;">
                                                </div>
                                                <div class="form-group">
                                                    <label for="message-text" class="col-form-label">Description</label>
                                                    <textarea class="form-control" id="message-text"></textarea>
                                                </div>
                                                <label for="cars">Topics</label><br>
                                                <select id="cars" name="cars" style="width: 60%;height: 5%;">
                                                    <option value="volvo">first</option>
                                                    <option value="saab">second</option>
                                                    <option value="fiat">third</option>
                                                    <option value="audi">fourth</option>
                                                </select>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default">Invite</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div> <!--model contnt-->

                                </div>
                            </div>

                        </div>
                        <!-- second popup -->
                        <div>
                            <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit" style="font-size: medium; height:20px;"></i></button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Modal Header</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Some text in the modal.</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div> <!--model contnt-->

                                </div>
                            </div>

                        </div>
                        <!-- third popup -->
                        <div>
                            <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal"><i class="fa fa-trash" style="font-size: medium; height:20px;"></i></button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Modal Header</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Some text in the modal.</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div> <!--model contnt-->

                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!-- <hr> -->
    </div>




    <div id="recent-share">
        <div class="recent-11">
            <div class="wrapper">
                <div class="title-text">
                    <div class="title login">
                        Change Password</div>
                    <div class="title signup">
                        Profile</div>
                </div>
                <div class="form-container">
                    <div class="slide-controls">
                        <input type="radio" name="slide" id="login" checked>
                        <input type="radio" name="slide" id="signup">
                        <label for="login" class="slide login">Password</label>
                        <label for="signup" class="slide signup">Profile</label>
                        <div class="slider-tab">
                        </div>
                    </div>
                    <div class="form-inner">
                        <form action="#" class="login">
                            <div class="field">
                                <input type="text" name="password" placeholder="Password" required>
                            </div>
                            <div class="field">
                                <input type="password" name="C_password" placeholder="ConfirmPassword" required>
                            </div>
                            <div class="field btn">
                                <div class="btn-layer">
                                </div>
                                <input type="submit" value="Update">
                            </div>
                            <div class="signup-link">
                            </div>
                            <br>
                        </form>
                        <form action="#" class="signup">
                            <div class="field">
                                <input type="text" name="firstname" placeholder="firstName" required>
                            </div>
                            <div class="field">
                                <input type="text" name="lastname" placeholder="lastname" required>
                            </div>

                            <div class="field">
                                <input type="text" name="username" placeholder="Username" required>
                            </div>
                            <div class="field">
                                <input type="file" name="photo" placeholder="Photo" >
                            </div>

                            <div class="field btn">
                                <div class="btn-layer">
                                </div>
                                <input type="submit" value="Update">
                            </div>
                        </form>
                    </div>
                </div>
            </div>




        </div>

    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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