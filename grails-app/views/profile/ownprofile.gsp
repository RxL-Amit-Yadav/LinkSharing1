<%@ page import="linksharing.ReadingItem; linksharing.LinkResource; linksharing.Topic; linksharing.GlobalResource; linksharing.GlobalUser; linksharing.Subscription" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User_Profile</title>
    <link rel="stylesheet"  href="${resource(dir: 'css', file: 'profile.css')}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<header>
    <h2>Topic Show</h2>
    <div class=header>
        <div class="link">
            <g:link url="[action: 'index', controller: 'home']">Link Sharing</g:link>

        </div>
        <div id="modals-boot">
            <div id ="search_bar">
                <div class="col-4">
                    <g:form class="form-inline my-2 my-lg-0" controller="search" action="search">

                        <input class="form-control mr-sm-2" id="sea" type="search" placeholder="Search" aria-label="Search" name="search" style="border-radius: 60px !important">

                        <button id="btt" type="submit" style="display:none;">Submit</button>
                    </g:form>
                </div>
            </div>



            <div id="pro-file">
                <div class="col-2" >
                    <div class="dropdown drop">
                        <button class="btn btn-secondary dropdown-toggle btnn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color: #5bc0de;;border-radius: 10px">
                            ${u.firstname.toUpperCase()} ${u.lastname.toUpperCase()}
                        </button>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">

                            <g:if test="${u.admin}">
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

    </div>
    <br>
</header>
<main id="main-section">
    <div id="first-half">
        <div id="pro-div">
            <div id="start-img">
                <asset:image src="${u.photo}" alt="user_image"/>
            </div>
            <div id="second-start-img">
                %{--<g:h3></g:h3>--}%
                <strong>​ ${u.firstname}${u.lastname}</strong><br>
                <span>@${u.username}</span>
                <br>
                <Span>Subscription</Span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <span>Topics</span>
                <br>
                <span>${linksharing.Subscription.countByTopics(Topic.findByGlobalUser(u))}</span>
                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <span>${linksharing.Topic.countByGlobalUser(u)}</span>

            </div>
        </div>
        <br>




        %{--This is for Subscriptions--}%
        <div class="first-div">
            <div class=header-section>
                <h4>Subscription</h4>
                %{--<g:link controller="subscription" action="viewAll">View All</g:link>--}%
            </div>
            <g:if test="${linksharing.Subscription.findAllByGlobalUser(u)== null}">

            </g:if>
            <g:else>
                <g:each in="${linksharing.Subscription.findAllByGlobalUser(u)}" var="num">
                    <g:if test="${num.globalUser == num.topics.globalUser}">
                        <div class="recent-1">
                            <div class="image" style="border: 1px solid black">
                                <asset:image src="${u.photo}" alt="user_image"/>
                            </div>

                            <div class="write">
                                <g:link controller="topic" action="topicsShow" params="[id:num.topics.id]">${num.topics.topicname}</g:link>
                                <br>
                                @${u.username}&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;

                                <Span>Subscription</Span>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <span>Post</span>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${Subscription.countByTopics(Topic.findByGlobalUser(u))}
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                <span>${linksharing.GlobalResource.countByTopics(num.topics)}</span>
                                <div class="one-footer">
                                    <g:form controller="subscription" action="changeSeriousness" params="[id: num.topics.id]">

                                        <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                                            <g:if test="${num.seriousness ==  Subscription.Seriousness.SERIOUS}">
                                                <option value="casual">Casual</option>
                                                <option value="serious" selected>Serious</option>
                                                <option value="very serious">Very serious</option>
                                            </g:if>

                                            <g:elseif test="${num.seriousness ==  Subscription.Seriousness.CASUAL}">
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

                                </select>
                                    %{--<g:form controller="topic" action="changePrivacy"  params="[id: num.topics.id]">--}%
                                    %{--<g:if test="${num.topics.visibility ==  Topic.Visibility.PUBLIC}">--}%
                                    %{--<select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">--}%

                                    %{--<option value="private" >Private</option>--}%
                                    %{--<option value="public" selected>Public</option>--}%

                                    %{--</select>--}%
                                    %{--</g:if>--}%
                                    %{--<g:else>--}%
                                    %{--<select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">--}%

                                    %{--<option value="private" selected>Private</option>--}%
                                    %{--<option value="public">Public</option>--}%

                                    %{--</select>--}%
                                    %{--</g:else>--}%

                                    %{--</g:form>--}%
                                    <div>


                                        <a href="#" data-toggle="modal" data-target="#sendInvitation" data-val="${num.topics.topicname}"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>
                                        <div class="modal fade" id="sendInvitation" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Invite</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <g:form controller="subscription" action="invite">
                                                        <div class="modal-body">

                                                            <div class="col-12">

                                                                <div class="col-12 mb-1">

                                                                    <div class="row">
                                                                        <div class="col-4">Email* :</div>
                                                                        <div class="col-8">
                                                                            <input class="form-control" name="email" type="email" placeholder="Email">
                                                                        </div>


                                                                    </div>
                                                                </div>

                                                                <div class="col-12 mt-2">
                                                                    <div class="row">
                                                                        <div class="col-4">Topic* :</div>
                                                                        <div class="col-8 sendName"  style="text-align: center;" >


                                                                            <select class="form-control" name="topic">
                                                                                <option id="opt" value=""></option>
                                                                            </select>


                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>



                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Invite</button>
                                                        </div>
                                                    </g:form>




                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal -->

                                    </div>


                                </div>
                            </div>

                        </div>
                    </g:if>
                    <g:else>
                        <div class="recent-1">
                            <div class="image">
                                <asset:image src="${num.topics.globalUser.photo}" alt="user_image"/>
                            </div>
                            <div class="write">
                                <g:link controller="topic" action="topicsShow" params="[id:num.topics.id]">${num.topics.topicname}</g:link>
                                @${num.topics.globalUser.username}&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <Span>Subscription</Span>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <span>Post</span>
                                <br>
                                <g:link controller="subscription" action="unsubscribe" params="[id:num.topics.id]" style=" text-decoration: underline;">Unsubscribe</g:link>
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


                                        <a href="#" data-toggle="modal" data-target="#sendInvitation" data-val="${num.topics.topicname}"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>

                                        <!-- Modal -->
                                        <div class="modal fade" id="#sendInvitation" role="dialog">
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
        <br>

        <div class="first-div">
            <div class=header-section>
                <h5>Topics</h5>
            </div>
            <g:if test="${Topic.findAllByGlobalUser(user)==null }">

            </g:if>
            <g:else>
                <g:each in="${Topic.list()}" var="num">
                    <g:if test="${num.globalUser.id == u.id}">
                        <div class="recent-1">
                            <div class="image">
                                <asset:image src="${u.photo}" alt="user_image"/>
                            </div>
                            <div class="write">
                                <g:link controller="topic" action="topicsShow" params="[id: num.id]">${num.topicname}</g:link><br>
                                <span>@${num.globalUser.username}</span>&nbsp;&nbsp;

                            &nbsp;&nbsp;&nbsp;&nbsp;
                                <Span>Subscription</Span>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <span>Post</span>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>${linksharing.Subscription.countByTopics(num)}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                <span>${linksharing.GlobalResource.countByTopics(num)}</span>

                                %{--Doing from hereeeee--}%
                                <div class="one-footer1">
                                    <g:form controller="subscription" action="changeSeriousness" params="[id: num.id]">

                                        <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                                            <g:if test="${Subscription.findByTopics(num).seriousness == linksharing.Subscription.Seriousness.SERIOUS}">
                                                <option value="casual">Casual</option>
                                                <option value="serious" selected>Serious</option>
                                                <option value="very serious">Very serious</option>
                                            </g:if>

                                            <g:elseif test="${Subscription.findByTopics(num).seriousness == linksharing.Subscription.Seriousness.CASUAL}">
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
                                %{--<div class="col-2 ">--}%
                                %{--<g:form controller="topic" action="changePrivacy"  params="[id: num.id]">--}%
                                %{--<g:if test="${num.visibility == Topic.Visibility.PUBLIC}">--}%
                                %{--<select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">--}%

                                %{--<option value="private" >Private</option>--}%
                                %{--<option value="public" selected>Public</option>--}%

                                %{--</select>--}%
                                %{--</g:if>--}%
                                %{--<g:else>--}%
                                %{--<select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">--}%

                                %{--<option value="private" selected>Private</option>--}%
                                %{--<option value="public">Public</option>--}%

                                %{--</select>--}%
                                %{--</g:else>--}%

                                %{--</g:form>--}%
                                %{--</div>--}%
                                <!-- first pop -->
                                <div>


                                    <a href="#" data-toggle="modal" data-target="#sendInvitation" data-val="${num.topicname}"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>
                                    <div class="modal fade" id="sendInvitation" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Invite</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <g:form controller="subscription" action="invite">
                                                    <div class="modal-body">

                                                        <div class="col-12">

                                                            <div class="col-12 mb-1">

                                                                <div class="row">
                                                                    <div class="col-4">Email* :</div>
                                                                    <div class="col-8">
                                                                        <input class="form-control" name="email" type="email" placeholder="Email">
                                                                    </div>


                                                                </div>
                                                            </div>

                                                            <div class="col-12 mt-2">
                                                                <div class="row">
                                                                    <div class="col-4">Topic* :</div>
                                                                    <div class="col-8 sendName"  style="text-align: center;" >


                                                                        <select class="form-control" name="topic">
                                                                            <option id="opt" value=""></option>
                                                                        </select>


                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>



                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Invite</button>
                                                    </div>
                                                </g:form>




                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal -->

                                </div>
                                    %{--third pop-up--}%
                                    %{--<div>--}%
                                    %{--<g:link controller="topic" action="delete" params="[id:num.id]">--}%
                                    %{--<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-val="${num.topicname}"><i class="fa fa-trash-o" style="font-size: medium; height:20px;"></i></button>--}%
                                    %{--</g:link>--}%

                                    %{--</div>--}%
                                </div>
                            </div>
                        </div>
                    </g:if>
                    <g:else>
                        <g:if test="${num.visibility != linksharing.Topic.Visibility.PRIVATE}">
                            <div class="recent-1">
                                <div class="image">
                                    <asset:image src="${num.globalUser.photo}" alt="user_image"/>
                                </div>
                                <div class="write">
                                    <g:link controller="topic" action="topicsShow" params="[id: num.id]">${num.topicname}</g:link><br>
                                    <span>@${num.globalUser.username}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;

                                    <Span>Subscription</Span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>Post</span>
                                    <br>
                                    <div style="display: flex; flex-direction: row; justify-content: flex-start">
                                        <g:if test="${num.globalUser.username == u.username}">
                                            <div class="col-4">

                                            </div>
                                        </g:if>
                                        <g:elseif test="${linksharing.Subscription.findByTopicsAndGlobalUser(num,u)}">
                                            <div class="col-4">
                                                <g:link controller="subscription" action="unsubscribe" params="[id:num.id]" style=" text-decoration: underline;">Unsubscribe</g:link>
                                            </div>
                                        </g:elseif>

                                        <g:else>
                                            <div class="col-4">
                                                <g:link controller="subscription" action="subscribe" params="[id:num.id]" style=" text-decoration: underline;">Subscribe</g:link>
                                            </div>
                                        </g:else>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>${linksharing.Subscription.countByTopics(num)}</span>
                                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>${linksharing.GlobalResource.countByTopics(num)}</span>
                                    </div>
                                </div>
                            </div>
                        </g:if>
                    </g:else>
                </g:each>
            </g:else>
        </div>
        <br>

    </div>

    <div id="recent-share">
        <div style="background-color: azure;height: 35px">
            <h4>Inbox</h4>
            <div id ="search_bar">
                <div class="col-8">
                    <g:form class="form-inline my-2 my-lg-0" controller="search" action="search">

                        <input class="form-control mr-sm-2" id="sea" type="search" placeholder="Search" aria-label="Search" name="search" style="border-radius: 60px !important">

                        <button id="btt" type="submit" style="display:none;">Submit</button>
                    </g:form>
                </div>
            </div>
        </div>
        <g:each in="${GlobalResource.list()}" var="res">
            <g:if test="${linksharing.ReadingItem.findByGlobalUserAndResources(u,res) && !ReadingItem.findByGlobalUserAndResources(u,res).isRead}">
                <div style="display: flex; flex-direction: column">
                    <div class="recent-11">
                        <div class="image11">
                            <asset:image src="${res.globalUser.photo}" alt="user_image"/>
                        </div>
                        <div class="write11">
                            <div style="display:flex; justify-content: space-between ">
                                <div style="display: flex; justify-content: flex-start">
                                    <p>${res.globalUser.firstname} ${res.globalUser.lastname}</p>
                                    <p>@${res.globalUser.username}</p>
                                </div>
                                <div>
                                    <g:link controller="topic" action="topicsShow" params="[id:res.topics.id]">${res.topics.topicname}</g:link>
                                </div>
                            </div>
                            <br>
                            <p>${res.descrip} </p>
                            <div class="link-chain">
                                <div>
                                    <i class="fa fa-google" style="font-size: larger;"></i>
                                    <i class="fa fa-twitter" style="font-size: larger;"></i>
                                    <i class="fa fa-facebook" style="font-size: larger;"></i>
                                </div>

                                <div class="linklelo">
                                    <g:if test="${res.class == linksharing.DocumentResource}">
                                        <g:link controller="globalresource" action="downloadPost" params="[id: res.id]" class="links1">Download</g:link>
                                    </g:if>

                                    <g:else>
                                        <a target="_blank" href="${LinkResource.findById(res.id).urloc}" class="links1">View Full Site</a>
                                    </g:else>

                                    <g:link controller="readingitem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>
                                    <g:link controller="ratingResource" action="index" params="[id:res.id]">View post</g:link>

                                </div>

                            </div>

                        </div>
                        %{--</g:if>--}%
                    </div>
                </div>
            </g:if>
        </g:each>
    </div>


</main>