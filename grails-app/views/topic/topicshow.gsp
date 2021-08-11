<%@ page import="linksharing.ReadingItem; linksharing.LinkResource; linksharing.Topic; linksharing.GlobalResource; linksharing.GlobalUser; linksharing.Subscription" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topic_show</title>
    <link rel="stylesheet"  href="${resource(dir: 'css', file: 'topic.css')}">
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

            <!-- third popup -->
            <div>
                <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#shareLink1"><i class="fa fa-paperclip" style="font-size: medium; height:20px;"></i></button>

                <div class="modal fade" id="shareLink1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                                            <g:each in="${linksharing.Subscription.findAllByGlobalUser(u).toList()}" var="t">
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

                            <g:uploadForm name="upload" method="post" controller="resource" action="fileUpload">
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
                                                            <g:each in="${Subscription.findAllByGlobalUser(u).toList()}" var="t">
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
        <div style="background-color: azure;width: 80%;border: 1px solid black;margin: auto;margin-top: 0%;margin-bottom: 0%">
        <h4>Topic: ${t.topicname}</h4>
        </div>
            <g:if test="${t.globalUser.id == (session.getAttribute("user0") as linksharing.GlobalUser).id}" >

            <div id="pro-div">

                <div class="start-img">
                    <asset:image src="${u.photo}" alt="user_image"/>
                </div>
                <div class="second-start-img">
                    <div style="display:flex; flex-direction:column; justify-content: flex-start">
                    <p style="margin: 0%">${t.globalUser.firstname}</p>
                    <g:link controller="profile" action="ownprofile" >@${t.globalUser.username}</g:link>
                   </div>
                    <Span>Subscription</Span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span>Post</span>
                    <br>
                    <span> ${Subscription.countByTopics(t)}</span>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <span> ${linksharing.GlobalResource.countByTopics(t)}</span>
                    <br><br>
                    <div class="one-footer">
                        <div class="col-4 ">
                            <g:form controller="subscription" action="changeSeriousness" params="[id: t.id]">

                                <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                                    <g:if test="${Subscription.findByTopicsAndGlobalUser(t,u).seriousness== Subscription.Seriousness.SERIOUS}">
                                        <option value="casual">Casual</option>
                                        <option value="serious" selected>Serious</option>
                                        <option value="very serious">Very serious</option>
                                    </g:if>

                                    <g:elseif test="${Subscription.findByTopicsAndGlobalUser(t,u).seriousness == Subscription.Seriousness.CASUAL}">
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
                        </div>
                        <div>


                            <a href="#" data-toggle="modal" data-target="#sendInvitation"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>
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
            <div id="pro-div">
                <!-- <h3>Topic:Grails</h3> -->
                <div class="start-img">
                <asset:image src="${t.globalUser.photo}" alt="user_image"/>
                </div>
                <div id="second-start-img">
                    ${t.topicname}<br>
                    <a href="#">@${t.globalUser.username}</a>
                    <br>
                    <div style="display: flex;flex-direction: row;justify-content: space-between">
                    <div>
                    <Span>Subscription</Span><br>
                    ${Subscription.countByTopics(t)}
                    </div>

                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div>
                    <span>Post</span><br>
                    ${GlobalResource.countByTopics(t)}
                    </div>
                    </div>

                    <div class="row">

                        <div class="col-4">
                            <g:if test="${t.globalUser.username == u.username}">

                            </g:if>
                            <g:elseif test="${Subscription.findByTopicsAndGlobalUser(t,u)}">

                                <g:link controller="subscription" action="unsubscribe" params="[id:t.id]" style=" text-decoration: underline;">Unsubscribe</g:link>

                            </g:elseif>

                            <g:else>

                                <g:link controller="subscription" action="subscribe" params="[id:t.id]" style=" text-decoration: underline;">Subscribe</g:link>

                            </g:else>
                        </div>
                    </div>



                    <g:if test="${Subscription.findByTopicsAndGlobalUser(t,u)}">
                        <div class="one-footer">
                            <div class="col-4 ">
                                <g:form controller="subscription" action="changeSeriousness" params="[id: t.id]">

                                    <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                                        <g:if test="${Subscription.findByTopicsAndGlobalUser(t,u).seriousness== Subscription.Seriousness.SERIOUS}">
                                            <option value="casual">Casual</option>
                                            <option value="serious" selected>Serious</option>
                                            <option value="very serious">Very serious</option>
                                        </g:if>

                                        <g:elseif test="${Subscription.findByTopicsAndGlobalUser(t,u).seriousness == Subscription.Seriousness.CASUAL}">
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
                            </div>
                            <!-- first pop -->
                            <div>


                                <a href="#" data-toggle="modal" data-target="#sendInvitation"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>
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
                    </g:if>
                </div>
            </div>
        </g:else>
        <br>
        <div class="first-div">
            <div class=header-section>
                <h4>Users: ${t.topicname}</h4>
            </div>
            <g:each in="${Subscription.findAllByTopics(t)}" var="num">
                <div class="recent-1">
                    <div class="image">
                        <asset:image src="${num.globalUser.photo}" alt="user_image"/>
                    </div>
                    <div class="write">
                        <div class="col-12 mt-3 name">
                            <div>
                            ${num.globalUser.username}<br>
                             ${num.globalUser.firstname}
                            </div>
                        </div>
                        <div style="display: flex;flex-direction: row;justify-content: space-around">
                            <div>
                            <Span>Subscription</Span><br>
                            <span> ${Subscription.countByGlobalUser(num.globalUser)}</span>
                           </div>

                            <div>
                            <span>Post</span><br>
                            <span>${Topic.countByGlobalUser(num.globalUser)}</span>
                           </div>
                            <br>
                        </div>
                    </div>

                </div>
            </g:each>
        </div>
        <hr>

    </div>

    <div id="recent-share">
            <div style="display: flex;background-color:azure;justify-content: space-between;border: 1px solid black;height: 40px;">
            <h4>Inbox</h4>
                <div class="col-4">
                    <g:form class="form-inline my-2 my-lg-0" controller="search" action="search">

                        <input class="form-control mr-sm-2" id="sea" type="search" placeholder="Search" aria-label="Search" name="search" style="border-radius: 60px !important">

                        <button id="btt" type="submit" style="display:none;">Submit</button>
                    </g:form>
                </div>
            </div>

        <g:each in="${GlobalResource.list()}" var="res">
            <div style="display: flex; flex-direction: column">

                <g:if test="${linksharing.ReadingItem.findByGlobalUserAndResources(u,res) && !ReadingItem.findByGlobalUserAndResources(u,res).isRead}">
                    <div class="recent-11">
                        <div class="image11">
                            <asset:image src="${res.globalUser.photo}" alt="user_image"/>
                        </div>
                        <div class="write11">
                            <div style="display:flex; justify-content: space-between ">
                                <div style="display: flex;flex-direction: column; justify-content: flex-start">
                                    <span>${res.globalUser.firstname} ${res.globalUser.lastname}</span>
                                    <span>@${res.globalUser.username}</span>
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
                    </div>
                        </g:if>


            </div>
        </g:each>

    </div>









</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>


</html>