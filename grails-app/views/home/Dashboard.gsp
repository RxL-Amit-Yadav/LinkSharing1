<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>dash_page</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'Dashboard.css')}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<header>
    <h2>Dashboard</h2>
    <div class=header>
        <div class="link">
            <a href="_blank">Link Sharing</a>
        </div>
        <div id ="search_bar">
            <input type="text" placeholder="Search..">

        </div>

        <div id="modals-boot">
            <div>
                <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal"><i class="fa fa-comment-o" style="font-size: medium; height:20px;"></i></button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create Topic</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Name</label>
                                        <input type="text" class="form-control" id="recipient-name" style="width: 60%;">
                                    </div>
                                    <label for="cars">Visibility</label><br>
                                    <select id="visibility" name="visibility" style="width: 60%;height: 5%;">
                                        <option value="public">public</option>
                                        <option value="private">private</option>
                                        <!-- <option value="fiat">third</option> -->
                                        <!-- <option value="audi">fourth</option> -->
                                    </select>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save</button>
                            </div>
                        </div> <!--model contnt-->

                    </div>
                </div>

            </div>

            <!-- second popup -->
            <!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Send Invitation</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="recipient-name" class="col-form-label">Email</label>
                  <input type="text" class="form-control" id="recipient-name" style="width: 60%;">
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
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Invite</button>
            </div>
          </div>
        </div>
      </div> -->

            <div>
                <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal2"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

                <!-- Modal -->
                <div class="modal fade" id="myModal2" role="dialog">
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
                                    %{--<div class="form-group">--}%
                                        %{--<label for="message-text" class="col-form-label">Description</label>--}%
                                        %{--<textarea class="form-control" id="message-text"></textarea>--}%
                                    %{--</div>--}%
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


            <!-- third popup -->
            <div>
                <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal3"><i class="fa fa-paperclip" style="font-size: medium; height:20px;"></i></button>

                <!-- Modal -->
                <div class="modal fade" id="myModal3" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Share Link</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="recipient-link" class="col-form-label">link</label>
                                        <input type="text" class="form-control" id="recipient-link" style="width: 60%;">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-descr" class="col-form-label">Description</label>
                                        <input type="textarea" class="form-control" id="recipient-descr" style="width: 60%;">

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

            <!-- fourth popup -->
            <div>
                <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal4"><i class="fa fa-file-archive-o" style="font-size: medium; height:20px;"></i></button>

                <!-- Modal -->
                <div class="modal fade" id="myModal4" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Share Document</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="recipient-link" class="col-form-label">Document</label>
                                        <input type="file" class="form-control" id="recipient-file" style="width: 60%;">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-descr" class="col-form-label">Description</label>
                                        <input type="textarea" class="form-control" id="recipient-descr" style="width: 60%;">

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

            <!-- <div>
                        <button><c</i></button>

                         </div>
                         <div>
                        <button><i class="fa fa-paperclip" style="font-size: 25px;"></i></button>
                         </div>
                         <div>
                        <button><i class="fa fa-file-archive-o" style="font-size: 25px;"></i></button>

                        </div> -->

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
                %{--<g:h3></g:h3>--}%
                <a href="#">@name</a>
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
            <div class=header-section>
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
                    <div class="one-footer1">
                        <select id="serious" name="serious">
                            <option value="serious">Serious</option>
                            <option value="veryserious">Very Serious</option>
                            <option value="casual">Casual</option>

                        </select>
                        <!-- first pop -->
                        <div>
                            <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal6"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal6" role="dialog">
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
                                                <select id="car" name="cars" style="width: 60%;height: 5%;">
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

                    </div>
                </div>

            </div>
        </div>
        <hr>
        <div class="first-div">
            <div class=header-section>
                <h5>Trending Topics</h5>
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
                </div>
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
                    <div class="one-footer1">
                        <select id="serious" name="serious">
                            <option value="serious">Serious</option>
                            <option value="veryserious">Very Serious</option>
                            <option value="casual">Casual</option>

                        </select>
                        <!-- first pop -->
                        <div>
                            <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

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
    </div>

    <div id="recent-share">
        <div>
            <h4>Inbox</h4>
            <input type="text" id="search-box2" placeholder="Search..">
        </div>
        <div class="recent-11">
            <div class="image11">

            </div>
            <div class="write11">
                <a href="#" class="sname">Amit Yadav</a>
                <a href="#">grails</a>
                <br>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown </p>
                <div class="link-chain">
                    <div>
                        <i class="fa fa-google" style="font-size: larger;"></i>
                        <i class="fa fa-twitter" style="font-size: larger;"></i>
                        <i class="fa fa-facebook" style="font-size: larger;"></i>
                    </div>

                    <div class="linklelo">
                        <a href="#">Download</a>
                        <a href="#">View Full Size</a>
                        <a href="#">Mark as Read</a>
                        <a href="#">View Post</a>
                    </div>

                </div>

            </div>


        </div>
        <div class="recent-11">
            <div class="image11">

            </div>
            <div class="write11">
                <a href="#" class="sname">Amit Yadav</a>
                <a href="#">grails</a>
                <br>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown </p>
                <div class="link-chain">
                    <div>
                        <i class="fa fa-google" style="font-size: larger;"></i>
                        <i class="fa fa-twitter" style="font-size: larger;"></i>
                        <i class="fa fa-facebook" style="font-size: larger;"></i>
                    </div>

                    <div class="linklelo">
                        <a href="#">Download</a>
                        <a href="#">View Full Size</a>
                        <a href="#">Mark as Read</a>
                        <a href="#">View Post</a>
                    </div>

                </div>

            </div>


        </div>


    </div>









</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>


</html>