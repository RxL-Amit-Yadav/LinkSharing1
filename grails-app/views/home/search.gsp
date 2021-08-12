<%@ page import="linksharing.ReadingItem; linksharing.Topic.Visibility ; linksharing.Subscription.Seriousness ;  linksharing.DocumentResource; linksharing.LinkResource ; linksharing.GlobalResource ; linksharing.Topic ; linksharing.Subscription" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>dash_page</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'search.css')}">
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
            <g:link url="[action: 'index', controller: 'home']">Link Sharing</g:link>
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

            %{--<div>--}%
            <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#sendInvitations"><i class="fa fa-envelope" style="font-size: medium; height:25px;"></i></button>

            <!-- Modal -->
            <div class="modal fade" id="sendInvitations" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle2">Send Invitation</h5>
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
                                                <input class="form-control" id="email" name="email" type="email" placeholder="Email">
                                            </div>


                                        </div>
                                    </div>

                                    <div class="col-12 mt-2">
                                        <div class="row">
                                            <div class="col-4">Topic* :</div>
                                            <div class="col-8" id="sendInvitationModalName">


                                                <select class="form-control" name="topic">
                                                    <g:each in="${linksharing.Subscription.findAllByGlobalUser(user).topics}" var="topic">
                                                        <option value="${topic.topicname}">${topic.topicname}</option>
                                                    </g:each>
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


            <!-- third popup -->
            <div>
                <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#shareLink"><i class="fa fa-paperclip" style="font-size: medium; height:20px;"></i></button>
                <div class="modal fade" id="shareLink" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle3">Share Link</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <g:form controller="globalresource" action="createLink">
                                <div class="modal-body">


                                    <div class="col-12">

                                        <div class="col-12 ">

                                            <div class="col-12 ">

                                                <div class="row">
                                                    <div class="col-4">LINK* :</div>
                                                    <div class="col-8">
                                                        <input class="form-control" name="url" type="url" placeholder="Link">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-12 mt-3">
                                                <div class="row">
                                                    <div class="col-4">Description* :</div>
                                                    <div class=" col-8 form-group">
                                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="urlDescription" rows="5" style="resize: none;"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-4">Topic :</div>
                                                    <div class="col-8">
                                                        <select class="form-control" name="urlTopic">
                                                            <g:each in="${Subscription.findAllByGlobalUser(user).toList()}" var="t">
                                                                <option value="${t.topics.topicname}">${t.topics.topicname}</option>
                                                            </g:each>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </div>
                            </g:form>

                        </div>
                    </div>
                </div>


            </div>

            <!-- fourth popup -->
            <div>
                <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#shareDocument"><i class="fa fa-file-archive-o" style="font-size: medium; height:20px;"></i></button>

                <!-- Modal -->
                <div class="modal fade" id="shareDocument" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle4">Share Document</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <g:uploadForm name="upload" method="post" controller="globalresource" action="fileUpload">
                                <div class="modal-body">

                                    <div class="col-12 ">


                                        <div class="col-12 ">

                                            <div class="col-12 mb-3">

                                                <div class="row">
                                                    <div class="col-4">Document* :</div>
                                                    <div class="col-8">
                                                        <div class="custom-file">
                                                            <input type="file" name="documentFile" class="custom-file-input" id="docFile" required>
                                                            <label class="custom-file-label" for="docFile">Choose file</label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-12 ">
                                                <div class="row">
                                                    <div class="col-4">Description* :</div>
                                                    <div class=" col-8 form-group">
                                                        <textarea class="form-control" name="documentDescription" id="exampleFormControlTextarea2" rows="5" style="resize: none;"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-4" >Topic* :</div>
                                                    <div class="col-8">
                                                        <select class="form-control" name="documentTopic">
                                                            <g:each in="${Subscription.findAllByGlobalUser(user).toList()}" var="t">
                                                                <option value="${t.topics.topicname}">${t.topics.topicname}</option>
                                                            </g:each>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Upload</button>
                                </div>
                            </g:uploadForm>


                        </div>
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
    <div class="first-half">
        <div class="first-div">
            <div class=header-section>
                <h5>Trending Topics</h5>
            </div>
            <g:if test="${Topic.findAllByGlobalUser(user)==null }">

            </g:if>
            <g:else>
                <g:each in="${Topic.list(max:5)}" var="num">
                    <g:if test="${num.globalUser.id == user.id && num.visibility != linksharing.Topic.Visibility.PRIVATE}">
                        <div class="recent-1">
                            <div class="image">
                                <asset:image src="${user.photo}" alt="user_image"/>
                            </div>
                            <div class="write">
                                <g:link controller="topic" action="topicsShow" params="[id: num.id]">${num.topicname}</g:link><br>
                                <g:link controller="profile" action="index" params="[id:num.globalUser.id]"><span>@${num.globalUser.username}</span></g:link>&nbsp;&nbsp;

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
                                    <div class="col-2 ">
                                        <g:form controller="topic" action="changePrivacy"  params="[id: num.id]">
                                            <g:if test="${num.visibility == Topic.Visibility.PUBLIC}">
                                                <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">

                                                    <option value="private" >Private</option>
                                                    <option value="public" selected>Public</option>

                                                </select>
                                            </g:if>
                                            <g:else>
                                                <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">
                                                    <option value="private" selected>Private</option>
                                                    <option value="public">Public</option>
                                                </select>
                                            </g:else>

                                        </g:form>
                                    </div>
                                    <!-- first pop -->
                                    <div>
                                        <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#sendInvitation" data-val="${num.topicname}"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

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
                        <g:if test="${num.visibility != linksharing.Topic.Visibility.PRIVATE}">
                            <div class="recent-1">
                                <div class="image">
                                    <asset:image src="${num.globalUser.photo}" alt="user_image"/>
                                </div>
                                <div class="write">
                                    <g:link controller="topic" action="topicsShow" params="[id: num.id]">${num.topicname}</g:link><br>
                                    <g:link controller="profile" action="index" params="[id:num.globalUser.id]"><span>@${num.globalUser.username}</span></g:link>&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;

                                    <Span>Subscription</Span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>Post</span>
                                    <br>
                                    <div style="display: flex; flex-direction: row; justify-content: flex-start">
                                        <g:if test="${num.globalUser.username == user.username}">
                                            <div class="col-4">

                                            </div>
                                        </g:if>
                                        <g:elseif test="${linksharing.Subscription.findByTopicsAndGlobalUser(num,user)}">
                                            <div class="col-4">
                                                <g:link controller="subscription" action="unsubscribe" params="[id:num.id]" style=" text-decoration: underline;">Unsubscribe</g:link>
                                            </div>
                                        </g:elseif>

                                        <g:else>
                                            <div class="col-4">
                                                <g:link controller="subscription" action="subscribe" params="[id:num.id]" style=" text-decoration: underline;">Subscribe</g:link>
                                            </div>
                                        </g:else>
                                    </div>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>${linksharing.Subscription.countByTopics(num)}</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>${linksharing.GlobalResource.countByTopics(num)}</span>

                                </div>
                            </div>
                        </g:if>
                    </g:else>
                </g:each>
            </g:else>
        </div>
    </div>

    %{--Search element here--}%
    <div id="recent-share">
        <div>
            <h4>Search for ${searchElement}</h4>

        </div>
        <g:each in="${linksharing.Topic.findAllByTopicnameIlike("%${searchElement}%")}" var="topicvar">
            <g:each in="${linksharing.GlobalResource.findAllByTopics(topicvar)}" var ="res">
                    <div style="display: flex; flex-direction: column">
                        <g:if test="${res.class == linksharing.DocumentResource}">
                            <div class="recent-11">
                                <div class="image11">
                                    <asset:image src="${res.globalUser.photo}" alt="user_image"/>
                                </div>
                                <div class="write11">
                                    <div style="display:flex; justify-content: space-between ">
                                        <div style="display: flex;flex-direction: column; justify-content: flex-start">
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
                                            <g:link controller="globalresource" action="downloadPost" params="[id: res.id]" class="links1">Download</g:link>

                                            %{--<g:if test="${!ReadingItem.findByGlobalUserAndResources(user,res).isRead}">--}%
                                            <g:link controller="readingitem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>
                                            %{--</g:if>--}%
                                            <a href="#" class="links1">View post</a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="recent-11">
                                <div class="image11">
                                    <asset:image src="${res.globalUser.photo}" alt="user_image"/>
                                </div>
                                <div class="write11">
                                    <div style="display:flex; justify-content: space-between ">
                                        <div style="display: flex;flex-direction: column; justify-content: flex-start">
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

                                            <a target="_blank" href="${LinkResource.findById(res.id).urloc}" class="links1">View Full Site</a>

                                            %{--<g:if test="${!ReadingItem.findByGlobalUserAndResources(user,res).isRead}">--}%
                                            <g:link controller="readingitem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>
                                            %{--</g:if>--}%
                                            <a href="#" class="links1">View post</a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </g:else>
                    </div>
            </g:each>
        %{--</g:each>--}%





        %{--<g:each in="${GlobalResource.findAllByTopics(topicvar)}"  var="res">--}%
            %{--<div style="display: flex; flex-direction: column">--}%
                %{--<g:if test="${res.class == linksharing.DocumentResource}">--}%
                    %{--<div class="recent-11">--}%
                        %{--<div class="image11">--}%
                            %{--<asset:image src="${res.globalUser.photo}" alt="user_image"/>--}%
                        %{--</div>--}%
                        %{--<div class="write11">--}%
                            %{--<div style="display:flex; justify-content: space-between ">--}%
                                %{--<div style="display: flex;flex-direction: column; justify-content: flex-start">--}%
                                    %{--<p>${res.globalUser.firstname} ${res.globalUser.lastname}</p>--}%
                                    %{--<p>@${res.globalUser.username}</p>--}%
                                %{--</div>--}%
                                %{--<div>--}%
                                    %{--<g:link controller="topic" action="topicsShow" params="[id:res.topics.id]">${res.topics.topicname}</g:link>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<br>--}%
                            %{--<p>${res.descrip} </p>--}%
                            %{--<div class="link-chain">--}%
                                %{--<div>--}%
                                    %{--<i class="fa fa-google" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-twitter" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-facebook" style="font-size: larger;"></i>--}%
                                %{--</div>--}%

                                %{--<div class="linklelo">--}%
                                        %{--<g:link controller="globalresource" action="downloadPost" params="[id: res.id]" class="links1">Download</g:link>--}%

                                  %{--<g:if test="${!ReadingItem.findByGlobalUserAndResources(user,res).isRead}">--}%
                                    %{--<g:link controller="readingitem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>--}%
                                 %{--</g:if>--}%
                                    %{--<a href="#" class="links1">View post</a>--}%
                                %{--</div>--}%

                            %{--</div>--}%

                        %{--</div>--}%
                    %{--</div>--}%
                %{--</g:if>--}%
                %{--<g:else>--}%
                    %{--<div class="recent-11">--}%
                        %{--<div class="image11">--}%
                            %{--<asset:image src="${res.globalUser.photo}" alt="user_image"/>--}%
                        %{--</div>--}%
                        %{--<div class="write11">--}%
                            %{--<div style="display:flex; justify-content: space-between ">--}%
                                %{--<div style="display: flex;flex-direction: column; justify-content: flex-start">--}%
                                    %{--<p>${res.globalUser.firstname} ${res.globalUser.lastname}</p>--}%
                                    %{--<p>@${res.globalUser.username}</p>--}%
                                %{--</div>--}%
                                %{--<div>--}%
                                    %{--<g:link controller="topic" action="topicsShow" params="[id:res.topics.id]">${res.topics.topicname}</g:link>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<br>--}%
                            %{--<p>${res.descrip} </p>--}%
                            %{--<div class="link-chain">--}%
                                %{--<div>--}%
                                    %{--<i class="fa fa-google" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-twitter" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-facebook" style="font-size: larger;"></i>--}%
                                %{--</div>--}%

                                %{--<div class="linklelo">--}%

                                        %{--<a target="_blank" href="${LinkResource.findById(res.id).urloc}" class="links1">View Full Site</a>--}%

                                    %{--<g:if test="${!ReadingItem.findByGlobalUserAndResources(user,res).isRead}">--}%
                                        %{--<g:link controller="readingitem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>--}%
                                    %{--</g:if>--}%
                                    %{--<a href="#" class="links1">View post</a>--}%
                                %{--</div>--}%

                            %{--</div>--}%

                        %{--</div>--}%
                    %{--</div>--}%
                %{--</g:else>--}%
            %{--</div>--}%
        %{--</g:each>--}%
        </g:each>

    %{--<g:each in="${linksharing.Topic.findAllByTopicnameIlike("%${searchElement}%")}" var="topicvar">--}%
        %{--<g:each in="${GlobalResource.findAllByDescrip(topicvar)}"  var="res">--}%
            %{--<div style="display: flex; flex-direction: column">--}%
                %{--<g:if test="${res.class == linksharing.DocumentResource}">--}%
                    %{--<div class="recent-11">--}%
                        %{--<div class="image11">--}%
                            %{--<asset:image src="${res.globalUser.photo}" alt="user_image"/>--}%
                        %{--</div>--}%
                        %{--<div class="write11">--}%
                            %{--<div style="display:flex; justify-content: space-between ">--}%
                                %{--<div style="display: flex;flex-direction: column; justify-content: flex-start">--}%
                                    %{--<p>${res.globalUser.firstname} ${res.globalUser.lastname}</p>--}%
                                    %{--<p>@${res.globalUser.username}</p>--}%
                                %{--</div>--}%
                                %{--<div>--}%
                                    %{--<g:link controller="topic" action="topicsShow" params="[id:res.topics.id]">${res.topics.topicname}</g:link>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<br>--}%
                            %{--<p>${res.descrip} </p>--}%
                            %{--<div class="link-chain">--}%
                                %{--<div>--}%
                                    %{--<i class="fa fa-google" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-twitter" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-facebook" style="font-size: larger;"></i>--}%
                                %{--</div>--}%

                                %{--<div class="linklelo">--}%
                                    %{--<g:link controller="globalresource" action="downloadPost" params="[id: res.id]" class="links1">Download</g:link>--}%

                                    %{--<g:if test="${!ReadingItem.findByGlobalUserAndResources(user,res).isRead}">--}%
                                    %{--<g:link controller="readingitem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>--}%
                                    %{--</g:if>--}%
                                    %{--<a href="#" class="links1">View post</a>--}%
                                %{--</div>--}%

                            %{--</div>--}%

                        %{--</div>--}%
                    %{--</div>--}%
                %{--</g:if>--}%
                %{--<g:else>--}%
                    %{--<div class="recent-11">--}%
                        %{--<div class="image11">--}%
                            %{--<asset:image src="${res.globalUser.photo}" alt="user_image"/>--}%
                        %{--</div>--}%
                        %{--<div class="write11">--}%
                            %{--<div style="display:flex; justify-content: space-between ">--}%
                                %{--<div style="display: flex;flex-direction: column; justify-content: flex-start">--}%
                                    %{--<p>${res.globalUser.firstname} ${res.globalUser.lastname}</p>--}%
                                    %{--<p>@${res.globalUser.username}</p>--}%
                                %{--</div>--}%
                                %{--<div>--}%
                                    %{--<g:link controller="topic" action="topicsShow" params="[id:res.topics.id]">${res.topics.topicname}</g:link>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<br>--}%
                            %{--<p>${res.descrip} </p>--}%
                            %{--<div class="link-chain">--}%
                                %{--<div>--}%
                                    %{--<i class="fa fa-google" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-twitter" style="font-size: larger;"></i>--}%
                                    %{--<i class="fa fa-facebook" style="font-size: larger;"></i>--}%
                                %{--</div>--}%

                                %{--<div class="linklelo">--}%

                                    %{--<a target="_blank" href="${LinkResource.findById(res.id).urloc}" class="links1">View Full Site</a>--}%

                                    %{--<g:if test="${!ReadingItem.findByGlobalUserAndResources(user,res).isRead}">--}%
                                    %{--<g:link controller="readingitem" action="markRead" params="[id:res.id]" class="links1">Mark as read </g:link>--}%
                                    %{--</g:if>--}%
                                    %{--<a href="#" class="links1">View post</a>--}%
                                %{--</div>--}%

                            %{--</div>--}%

                        %{--</div>--}%
                    %{--</div>--}%
                %{--</g:else>--}%
            %{--</div>--}%
        %{--</g:each>--}%
    %{--</g:each>--}%
    </div>

</main>
</body>

</html>
