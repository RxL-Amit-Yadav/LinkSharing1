<%@ page import="linksharing.LinkResource; linksharing.ReadingItem; linksharing.GlobalUser; linksharing.GlobalResource; linksharing.Subscription; linksharing.Topic" %>
%{--<%@ page import="linksharing.Visibility; linksharing.Seriousness;linksharing.DocumentResource; linksharing.LinkResource; linksharing.Resource; linksharing.Topic ; linksharing.Subscription ;linksharing.User" %>--}%
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>dash_page</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'Dashboard.css')}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<header>
    <h2>Dashboard</h2>
    <div class=header>
        <div class="link">
            <g:link url="[action: 'index', controller: 'globalUser']">Link Sharing</g:link>
        </div>

        <div id ="search_bar">
            <div class="col-4">
                <g:form class="form-inline my-2 my-lg-0" controller="search" action="search">

                    <input class="form-control mr-sm-2" id="sea" type="search" placeholder="Search" aria-label="Search" name="search" style="border-radius: 60px !important">

                    <button id="btt" type="submit" style="display:none;">Submit</button>
                </g:form>
            </div>
        </div>
        <div id="modals-boot">
            <div>

                <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#createTopics"><i class="fa fa-comment-o" style="font-size: medium; height:20px;"></i></button>

                <!-- Modal -->
                <div class="modal fade" id="createTopics" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create Topic</h4>
                            </div>
                            <div class="modal-body">

                                <g:form controller="topic" action="createTopic">
                                    <div class="field">
                                        <input type="text" name="topicname" placeholder="Enter Name of Topic" required>
                                    </div>
                                    <div class="field">
                                        <select id="visibility" name="visible" style="width: 100%;height: 70%">
                                            <option value="public">Public</option>
                                            <option value="private">Private</option>
                                        </select>
                                    </div>

                                        <div class="field btn">
                                            <div class="btn-layer">
                                            </div>
                                            <input type="submit" value="Save">
                                        </div>
                                </g:form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                %{--<button type="button" class="btn btn-primary" data-target="mode">Save</button>--}%
                            </div>


                        </div> <!--model contnt-->

                    </div>
                </div>
            %{--</g:form>--}%

            </div>

            <div>
                <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#sendInvitations"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

                <!-- Modal -->
                <div class="modal fade" id="sendInvitations" role="dialog">
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

            <div class="col-2" >
                <div class="dropdown drop">
                    <button class="btn btn-secondary dropdown-toggle btnn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color: #5bc0de;;border-radius: 10px">
                        ${user.firstname.toUpperCase()} ${user.lastname.toUpperCase()}
                    </button>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">

                        <g:if test="${user.admin}">
                            <div class="col-5">
                                <g:link controller="user" action="edit">Profile</g:link>
                            </div>

                            <div class="col-5">
                                <g:link controller="admin" action="adminView">Users</g:link>
                            </div>
                            <div class="col-5">
                                <a href="#">Topics</a>
                            </div>
                            <div class="col-5">
                                <a href="#">Posts</a>
                            </div>

                            <div class="col-5">
                                <g:link controller="login" action="logout" href="#">Logout</g:link>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-5">
                                <g:link controller="user" action="edit">Profile</g:link>
                            </div>
                            <div class="col-5">
                                <g:link controller="login" action="logout" href="#">Logout</g:link>
                            </div>
                        </g:else>


                    </div>

                </div>
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
                <strong>​ ${user.firstname}${user.lastname}</strong><br>
                <a>@${user.username}</a>
                <br>
                <Span>Subscription</Span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <span>Topics</span>
                <br>
                <span>${linksharing.Subscription.countByGlobalUser(user)}</span>
                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <span>${linksharing.Topic.countByGlobalUser(user)}</span>

            </div>
        </div>
        <div class="first-div">
            <div class=header-section>
                <h4>Subscription</h4>
                <g:link controller="subscription">View All</g:link>
            </div>
            <g:if test="${linksharing.Subscription.findAllByGlobalUser(user)== null}">

            </g:if>
            <g:else>
            <g:each in="${linksharing.Subscription.findAllByGlobalUser(user)}" var="num">
            <g:if test="${num.globalUser == num.topics.globalUser}">
                 <div class="recent-1">
                    <div class="image" style="border: 1px solid black">
                        <img src="./profilepictire.png" alt="">
                    </div>

                     <div class="write">
                         <g:link controller="topic" action="topicsShow" params="[id:num.topics.id]">${num.topics.topicname}</g:link>
                            <br>
                         @${user.username}&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;

                        <Span>Subscription</Span>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <span>Posts</span>
                        <br>
                        %{--<a href="#">Unsubscribe</a>--}%
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${Subscription.countByTopics(Topic.findByGlobalUser(user))}
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <span>${GlobalResource.countByTopics(num.topics)}</span>
                        <div class="one-footer">
                            <g:form controller="subscription" action="changeSeriousness" params="[id: num.topics.id]">

                            <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                            <g:if test="${num.seriousness== Subscription.Seriousness.SERIOUS}">
                            <option value="casual">Casual</option>
                            <option value="serious" selected>Serious</option>
                            <option value="very serious">Very serious</option>
                            </g:if>

                            <g:elseif test="${num.seriousness== Subscription.Seriousness.CASUAL}">
                            <option value="casual" selected>Casual</option>
                            <option value="serious">Serious</option>
                            <option value="very serious">Very serious</option>
                            </g:elseif>

                            <g:else>
                            <option value="casual">Casual</option>
                            <option value="serious">Serious</option>
                            <option value="very serious" selected>Very serious</option>
                            </g:else>

                            </select>

                            </g:form>
                            %{--<select id="serious" name="serious">--}%
                                %{--<option value="serious">Serious</option>--}%
                                %{--<option value="veryserious">Very Serious</option>--}%
                                %{--<option value="casual">Casual</option>--}%

                            %{--</select>--}%
                        <g:form controller="topic" action="changePrivacy"  params="[id: num.topics.id]">
                        <g:if test="${num.topics.visibility== Topic.Visibility.PRIVATE}">
                        <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">

                        <option value="private" selected>Private</option>
                        <option value="public">Public</option>

                        </select>
                        </g:if>
                        <g:else>
                        <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">

                        <option value="private">Private</option>
                        <option value="public" selected>Public</option>

                        </select>
                        </g:else>

                        </g:form>
                            <div>


                                <a href="#" data-toggle="modal" data-target="#sendInvitations" data-val="${num.topics.topicname}"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>

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
                            <g:link controller="topic" action="delete" params="[id:num.topics.id]">
                                <button type="button" class="btn btn-info btn-md"><i class="fa fa-trash" style="font-size: medium; height:20px;"></i></button>
                            </g:link>

                            </div>

                        </div>
                    </div>

                </div>
            </g:if>
                <g:else>
                    <div class="recent-1">
                        <div class="image">
                            <img src="./profilepictire.png" alt="">
                        </div>
                        <div class="write">
                            <g:link controller="topic" action="topicsShow" params="[id:num.topics.id]">${num.topics.topicname}</g:link>
                            @${num.topics.globalUser.username}&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <Span>Subscription</Span>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <span>Topics</span>
                            <br>
                            <g:link controller="subscription" action="unsubscribe" params="[id:num.topics.id]" style=" text-decoration: underline;">Unsubscribe</g:link>
                            %{--<a href="#">Unsubscribe</a>--}%
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ${Subscription.countByTopics(num.topics)}
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                            <span>${GlobalResource.countByTopics(num.topics)}</span>
                            <div class="one-footer">
                                <g:form controller="subscription" action="changeSeriousness" params="[id: num.topics.id]">

                                    <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                                        <g:if test="${num.seriousness== Subscription.Seriousness.SERIOUS}">
                                            <option value="casual">Casual</option>
                                            <option value="serious" selected>Serious</option>
                                            <option value="very serious">Very serious</option>
                                        </g:if>

                                        <g:elseif test="${num.seriousness== Subscription.Seriousness.CASUAL}">
                                            <option value="casual" selected>Casual</option>
                                            <option value="serious">Serious</option>
                                            <option value="very serious">Very serious</option>
                                        </g:elseif>

                                        <g:else>
                                            <option value="casual">Casual</option>
                                            <option value="serious">Serious</option>
                                            <option value="very serious" selected>Very serious</option>
                                        </g:else>

                                    </select>

                                </g:form>

                            <!-- first pop -->
                                <div>


                                    <a href="#" data-toggle="modal" data-target="#sendInvitations" data-val="${num.topics.topicname}"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>

                                    <!-- Modal -->
                                    <div class="modal fade" id="#sendInvitations" role="dialog">
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
                            </div>
                        </div>

                    </div>

                </g:else>
            </g:each>

            </g:else>

        </div>
        <hr>

        %{--trending Tropics to be done lately--}%
        <div class="first-div">
        %{--<h1>Hello everyone</h1>--}%
            <div class=header-section>
                <h5>Trending Topics</h5>
            </div>
        <g:if test="${Topic.findAllByGlobalUser(user)==null}">

        </g:if>
        <g:else>
            <g:each in="${Topic.list()}" var="num">
            <g:if test="${num.globalUser.id == user.id}">
            <div class="recent-1">
                <div class="image">
                    <img src="./profilepictire.png" alt="">
                </div>
                <div class="write">
                <g:link controller="topic" action="topicsShow" params="[id: num.id]"><span><a href="#">${num.topicname}</a></span><br></g:link>
                <a href="#">@${num.globalUser.username}</a>&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <Span>Subscription</Span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span>Topics</span>
                    <br>
                    <a href="#">Unsubscribe</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>${linksharing.Subscription.countByTopics(num)}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <span>${linksharing.GlobalResource.countByTopics(num)}</span>

                           %{--Doing from hereeeee--}%
                           <div class="one-footer1">
                               <g:form controller="subscription" action="changeSeriousness" params="[id: num.id]">

                                   %{--<select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">--}%
                                       %{--<g:if test="${Subscription.findByTopics(num).seriousness == linksharing.Subscription.Seriousness.SERIOUS}">--}%
                                           %{--<option value="casual">Casual</option>--}%
                                           %{--<option value="serious" selected>Serious</option>--}%
                                           %{--<option value="very serious">Very serious</option>--}%
                                       %{--</g:if>--}%

                                       %{--<g:elseif test="${Subscription.findByTopics(num).seriousness == linksharing.Subscription.Seriousness.CASUAL}">--}%
                                           %{--<option value="casual" selected>Casual</option>--}%
                                           %{--<option value="serious">Serious</option>--}%
                                           %{--<option value="very serious">Very serious</option>--}%
                                       %{--</g:elseif>--}%

                                       %{--<g:else>--}%
                                           %{--<option value="casual">Casual</option>--}%
                                           %{--<option value="serious">Serious</option>--}%
                                           %{--<option value="very serious" selected>Very serious</option>--}%
                                       %{--</g:else>--}%

                                   %{--</select>--}%

                               </g:form>
                               <div class="col-2 ">
                                   <g:form controller="topic" action="changePrivacy"  params="[id: num.id]">
                                       <g:if test="${num.visibility== Topic.Visibility.PRIVATE}">
                                           <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">

                                               <option value="private" selected>Private</option>
                                               <option value="public">Public</option>

                                           </select>
                                       </g:if>
                                       <g:else>
                                           <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">

                                               <option value="private">Private</option>
                                               <option value="public" selected>Public</option>

                                           </select>
                                       </g:else>

                                   </g:form>
                               </div>
                               <!-- first pop -->
                               <div>
                                   <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal8" data-val="${num.topicname}"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

                                   <!-- Modal -->
                                   <div class="modal fade" id="myModal8" role="dialog">
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
                            %{--Second Pop-up--}%
                               <div>
                                   <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal9" data-val="${num.topicname}"><i class="fa fa-edit" style="font-size: medium; height:20px;"></i></button>

                                   <!-- Modal -->
                                   <div class="modal fade" id="myModal9" role="dialog">
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
                               %{--third pop-up--}%
                               <div>
                           <g:link controller="topic" action="delete" params="[id:num.id]">
                                   <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-val="${num.topicname}"><i class="fa fa-trash-o" style="font-size: medium; height:20px;"></i></button>
                           </g:link>

                               </div>
                </div>
                           </div>
                        </div>
                       </g:if>
                       <g:else>
                           <div class="recent-1">
                               <div class="image">
                                   <img src="./profilepictire.png" alt="">
                               </div>
                                <div class="write">
                           <g:link controller="topic" action="topicsShow" params="[id: num.id]"><span><a href="#">${num.topicname}</a></span><br></g:link>
                           <a href="#">@${num.globalUser.username}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                           &nbsp;&nbsp;&nbsp;&nbsp;

                           <Span>Subscription</Span>
                           &nbsp;&nbsp;&nbsp;&nbsp;
                           <span>Topics</span>
                           <br>
                           <div style="display: flex; flex-direction: row; justify-content: flex-start">
                           <g:if test="${num.globalUser.username == user.username}">
                               <div class="col-4">

                               </div>
                           </g:if>
                           <g:elseif test="${Subscription.findByTopicsAndGlobalUser(num,user)}">
                               <div class="col-4">
                                   <g:link controller="subscription" action="unsubscribe" params="[id:num.id]" style=" text-decoration: underline;">Unsubscribe</g:link>
                               </div>
                           </g:elseif>

                           <g:else>
                               <div class="col-4">
                                   <g:link controller="subscription" action="subscribe" params="[id:num.id]" style=" text-decoration: underline;">Subscribe</g:link>
                               </div>
                           </g:else>

                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <span>${linksharing.Subscription.countByTopics(num)}</span>
                           &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                           <span>${linksharing.GlobalResource.countByTopics(num)}</span>
                           </div>
                                </div>
                           </div>
                       </g:else>
                       </g:each>
                   </g:else>
    </div>
    </div>
    %{--<div id="recent-share">--}%
        <div class="col-6 mt-3 mb-2  ml-5 rightColInbox">
            <div class="col-12 ">
                <nav class="navbar">
                    <h4><strong>INBOX</strong></h4>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
                    </form>
                </nav>
            </div>

            <div class="row">
                <div class="col-12">

                    <table class="table mb-0">
                        <tbody>
                        <g:each in="${linksharing.GlobalResource.list()}" var="res">
                            <g:if test="${linksharing.ReadingItem.findByGlobalUserAndGlobalResource(user,res) && !ReadingItem.findByGlobalUserAndGlobalResource(user,res).isRead}">
                                <tr>
                                    <td>
                                        <div class="col-12 ">

                                            <div class="row" >

                                                <div class="col-3">

                                                    <svg width="8em" height="8em" viewBox="0 0 16 16" class="bi bi-person-square my-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                        <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                    </svg>

                                                </div>

                                                <div class="col-9">
                                                    <div class="col-12 mt-1 name">
                                                        ${res.globalUser.firstname} ${res.globalUser.lastname}
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="row">
                                                            <div class="col-4">
                                                                @${res.globalUser.username}
                                                            </div>
                                                            <div class="col-4">

                                                            </div>
                                                            <div class="col-4" style="font-size: larger; text-decoration: underline blue;">
                                                                <g:link controller="topic" action="topicsShow" params="[id:res.topic.id]">${res.topic.name}</g:link>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 mt-2">
                                                        ${res.getDescrip()}
                                                    </div>

                                                    <div class="col-12  mt-4">
                                                        <div class="row">

                                                            <div class="col-3">

                                                                <a> <i class="fa fa-facebook-official fa-1x" aria-hidden="true"></i></a>
                                                                <a> <i class="fa fa-twitter fa-1x" aria-hidden="true"></i></a>
                                                                <a> <i class="fa fa-google-plus fa-1x" aria-hidden="true"></i></a>

                                                            </div>

                                                            <div class="col-9 links">

                                                                <a class="links1">

                                                                </a>
                                                                <g:if test="${res.class == linksharing.DocumentResource}">
                                                                    <g:link controller="resource" action="downloadPost" params="[id: res.id]" class="links1">Download</g:link>
                                                                </g:if>

                                                                <g:else>
                                                                    <a href="${linksharing.LinkResource.findById(res.id).url}" class="links1">View Full Site</a>
                                                                </g:else>

                                                                <g:link controller="readingItem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>
                                                                <a href="#" class="links1">View post</a>
                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </td>
                                </tr>

                            </g:if>

                        </g:each>

                        </tbody>
                    </table>
                </div>

            </div>
        %{--</div>--}%
        %{--<div>--}%
            %{--<h4>Inbox</h4>--}%
            %{--<input type="text" id="search-box2" placeholder="Search..">--}%
        %{--</div>--}%
        %{--<div class="recent-11">--}%
            %{--<div class="image11">--}%

            %{--</div>--}%
            %{--<div class="write11">--}%
                %{--<a href="#" class="sname">Amit Yadav</a>--}%
                %{--<a href="#">grails</a>--}%
                %{--<br>--}%
                %{--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown </p>--}%
                %{--<div class="link-chain">--}%
                    %{--<div>--}%
                        %{--<i class="fa fa-google" style="font-size: larger;"></i>--}%
                        %{--<i class="fa fa-twitter" style="font-size: larger;"></i>--}%
                        %{--<i class="fa fa-facebook" style="font-size: larger;"></i>--}%
                    %{--</div>--}%

                    %{--<div class="linklelo">--}%
                        %{--<a href="#">Download</a>--}%
                        %{--<a href="#">View Full Size</a>--}%
                        %{--<a href="#">Mark as Read</a>--}%
                        %{--<a href="#">View Post</a>--}%
                    %{--</div>--}%

                %{--</div>--}%

            %{--</div>--}%


        %{--</div>--}%
        %{--<div class="recent-11">--}%
            %{--<div class="image11">--}%

            %{--</div>--}%
            %{--<div class="write11">--}%
                %{--<a href="#" class="sname">Amit Yadav</a>--}%
                %{--<a href="#">grails</a>--}%
                %{--<br>--}%
                %{--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown </p>--}%
                %{--<div class="link-chain">--}%
                    %{--<div>--}%
                        %{--<i class="fa fa-google" style="font-size: larger;"></i>--}%
                        %{--<i class="fa fa-twitter" style="font-size: larger;"></i>--}%
                        %{--<i class="fa fa-facebook" style="font-size: larger;"></i>--}%
                    %{--</div>--}%

                    %{--<div class="linklelo">--}%
                        %{--<a href="#">Download</a>--}%
                        %{--<a href="#">View Full Size</a>--}%
                        %{--<a href="#">Mark as Read</a>--}%
                        %{--<a href="#">View Post</a>--}%
                    %{--</div>--}%

                %{--</div>--}%

            %{--</div>--}%


        %{--</div>--}%


    </div>






</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>


</html>