<%@ page import="linksharing.ReadingItem; linksharing.Topic.Visibility ; linksharing.Subscription.Seriousness ;  linksharing.DocumentResource; linksharing.LinkResource ; linksharing.GlobalResource ; linksharing.Topic ; linksharing.Subscription" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>dash_page</title>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'Dashboard.css')}">--}%
    <asset:stylesheet src="Dashboard.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

<header>
   <g:render template="/navBar" model="[user:user]"/>
</header>
<br>

<main id="main-section">

    <div id="first-half">
        <div id="pro-div">

            <div id="start-img">
                <asset:image src="${user.photo}" alt="user_image"/>
            </div>

            <div id="second-start-img">
                %{--<g:h3></g:h3>--}%
               <strong>​ ${user.firstname} ${user.lastname}</strong><br>
                <g:link controller="profile" action="ownprofile"><span>@${user.username}</span></g:link>
                <br>
                <Span>Subscription</Span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <span>Topics</span>
                <br>
                <g:link controller="profile" action="ownprofile"><span>${linksharing.Subscription.countByGlobalUser(user)}</span></g:link>
                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <g:link controller="profile" action="ownprofile"> <span>${linksharing.Topic.countByGlobalUser(user)}</span></g:link>

            </div>
        </div>



        <div class="first-div">
            <div class=header-section>
                <h4>Subscription</h4>
                %{--<button id="but-v">View All</button>--}%
            </div>
            <g:if test="${linksharing.Subscription.findAllByGlobalUser(user)== null}">

            </g:if>
            <g:else>
                <g:each in="${linksharing.Subscription.findAllByGlobalUser(user)}" var="num">
                    <g:if test="${num.globalUser == num.topics.globalUser || num.globalUser.admin}">
                        <div class="recent-1">
                            <div class="image" style="border: 1px solid black">
                                <asset:image src="${user.photo}" alt="user_image"/>
                            </div>

                            <div class="write">
                                <g:link controller="topic" action="topicsShow" params="[id:num.topics.id]">${num.topics.topicname}</g:link>
                                <br>
                                <g:link controller="profile" action="index" params="[id:num.globalUser.id]">@${user.username}</g:link>&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;

                                <Span>Subscription</Span>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <span>Post</span>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${Subscription.countByTopics(Topic.findByGlobalUser(user))}
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                <span>${linksharing.GlobalResource.countByTopics(num.topics)}</span>
                                <div class="one-footer">
                                    <g:form controller="subscription" action="changeSeriousness" params="[id: num.topics.id]">
                                        %{--<g:select onChange="submit()" name="seriousness" from="${linksharing.Subscription.Seriousness}" value="${linksharing.Subscription.findAllByGlobalUserAndTopics(num.globalUser,num.topics).seriousness}" />--}%

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
                                    <g:form controller="topic" action="changePrivacy"  params="[id: num.topics.id]">
                                        <g:if test="${num.topics.visibility ==  Topic.Visibility.PUBLIC}">
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
                                                        <h4 class="modal-title">Edit Topic</h4>
                                                    </div>
                                                <g:form controller="topic" action="edit" params="[id:num.topics.id]">
                                                    <div class="modal-body">

                                                            <div class="row">
                                                                <div class="col-4">Topicname :</div>
                                                                <div class="col-8">
                                                                    <input class="form-control" name="topicname" type="text" placeholder="Topic">
                                                                </div>
                                                            </div>


                                                    </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Submit</button>
                                                        </div>
                                                        </g:form>
                                                </div> <!--model contnt-->

                                            </div>
                                        </div>

                                    </div>
                                    <!-- third popup -->
                                    <div>
                                    <g:if test="${num.globalUser.admin || num.globalUser == num.topics.globalUser}">
                                        <g:link controller="topic" action="delete" params="[id:num.topics.id]">
                                            <button type="button" class="btn btn-info btn-md"><i class="fa fa-trash" style="font-size: medium; height:20px;"></i></button>
                                        </g:link>
                                    </g:if>


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
                                <div style="display: flex; flex-direction: row;justify-content: space-around;width: 60%">
                                <g:link controller="profile" action="index" params="[id:num.topics.globalUser.id]">@${num.topics.globalUser.username}</g:link>
                               <div>
                                <p>Subscription</p>
                                ${Subscription.countByTopics(num.topics)}
                            </div>
                                <div>
                                <p>Post</p>
                                    <span>${GlobalResource.countByTopics(num.topics)}</span>
                                </div>
                            </div>
                                <g:link controller="subscription" action="unsubscribe" params="[id:num.topics.id]" style=" text-decoration: underline;">Unsubscribe</g:link>

                                <div class="one-footer">
                                    <g:form controller="subscription" action="changeSeriousness" params="[id: num.topics.id]">


                                    <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                                            <g:if test="${num.seriousness== Subscription.Seriousness.SERIOUS}">
                                                <option value="casual">Casual</option>
                                                <option value="serious" selected>Serious</option>
                                                <option value="very serious">Very serious</option>
                                            </g:if>
                                            %{--<g:select  onChange="submit()" name="visibility" from="${linksharing.Topic.Visibility}" value="${topic.visibility}" />--}%

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
            <g:if test="${linksharing.Topic.findAllByGlobalUser(user)==null }">

            </g:if>
        <g:else>
            <g:each in="${trend}" var="num">
                <g:if test="${(num.globalUser.id == user.id || num.globalUser.admin) && num.visibility != linksharing.Topic.Visibility.PRIVATE}">
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
                                %{--Second Pop-up--}%
                                <div>
                                    <a href="#" data-toggle="modal" data-target="#sendInvitation6" data-val="${num.topicname}"><button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal5"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button></a>
                                    <div class="modal fade" id="sendInvitation6" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                <div>
                                    <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit" style="font-size: medium; height:20px;"></i></button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Edit Topic</h4>
                                                </div>
                                                <g:form controller="topic" action="edit" params="[id:num.id]">
                                                    <div class="modal-body">

                                                        <div class="row">
                                                            <div class="col-4">Topicname :</div>
                                                            <div class="col-8">
                                                                <input class="form-control" name="topicname" type="text" placeholder="Topic">
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                </g:form>
                                            </div> <!--model contnt-->

                                        </div>
                                    </div>

                                </div>
                                %{--third pop-up--}%
                                <div>
                                    <g:if test="${num.globalUser.admin || num.globalUser.id == user.id}">
                                        <g:link controller="topic" action="delete" params="[id:num.id]">
                                            <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-val="${num.topicname}"><i class="fa fa-trash-o" style="font-size: medium; height:20px;"></i></button>
                                        </g:link>
                                    </g:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    %{--<g:if test="${num.visibility != linksharing.Topic.Visibility.PRIVATE}">--}%
                        <div class="recent-1">
                            <div class="image">
                                <asset:image src="${num.globalUser.photo}" alt="user_image"/>
                            </div>
                            <div class="write">
                                <g:link controller="topic" action="topicsShow" params="[id: num.id]">${num.topicname}</g:link><br>
                                <div style="display: flex; flex-direction: row;justify-content: space-around;width: 60%">
                                    <g:link controller="profile" action="index" params="[id:num.globalUser.id]">@${num.globalUser.username}</g:link>
                                    <div>
                                        <p>Subscription</p>
                                        ${Subscription.countByTopics(num)}
                                    </div>
                                    <div>
                                        <p>Post</p>
                                        <span>${GlobalResource.countByTopics(num)}</span>
                                    </div>
                                </div>
                                %{--<g:link controller="profile" action="index" params="[id:num.globalUser.id]"><span>@${num.globalUser.username}</span></g:link>&nbsp;&nbsp;&nbsp;&nbsp;--}%
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

                            </div>
                        </div>
                    %{--</g:if>--}%
                </g:else>
            </g:each>
        </g:else>

        </div>
    </div>


    <div id="recent-share">
        <div style="border: 2px solid black; background-color: azure;margin-bottom: 0%">
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
        <div style="display: flex; flex-direction: column;margin-top: 0%">
      <g:if test="${ReadingItem.findByGlobalUserAndResources(user,res) && !ReadingItem.findByGlobalUserAndResources(user,res).isRead}">
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
                        <g:if test="${res.class == DocumentResource}">
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
            </g:if>
        </div>
        </g:each>
        </div>

</main>

<script>
    // $('#show').hide();
    // $('#but-v').on('click',function () {
    //     $('#show').show();
    //     $('.first-div').hide()
    //
    // })
    %{--let newpost = $('#but-v');--}%
    %{--let url = "${createLink(controller:'Topic',action:'findall')}"--}%
    %{--newpost.on('click',function () {--}%
        %{--$.ajax({--}%
            %{--type:'get',--}%
            %{--url:url,--}%
            %{--data:url.serialize()--}%
            %{--success:function (data) {--}%
                %{--console.log(data)--}%
            %{--}--}%
        %{--})--}%

    %{--})--}%

    // $.ajax({
    //     type:'get',
    //     url:url,
    //     success:function (data) {
    //         console.log(data);
    //     }
    // })
    // $('#but-v').on('click',function () {
    //     alert('Hi');
    // })
    // var hello = document.getElementById('but-v');
    // hello.addEventListener('click',function () {
    //     alert('Hi');
    // })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</body>


</html>