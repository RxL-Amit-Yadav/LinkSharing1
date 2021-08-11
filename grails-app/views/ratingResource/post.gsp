<%@ page import="linksharing.ReadingItem; linksharing.LinkResource; linksharing.Topic; linksharing.GlobalResource; linksharing.GlobalUser; linksharing.Subscription" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post</title>
    <link rel="stylesheet"  href="${resource(dir: 'css', file: 'ppost.css')}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <asset:stylesheet src="Rating.css"/>
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

    </div>
    <br>
</header>
<main id="main-section">
    <div id="first-half">
        <div class="first-div">
            %{--<h1>Hello everyone</h1>--}%
            <div class=header-section>
                <h5>Trending Topics</h5>
            </div>
            <g:if test="${Topic.findAllByGlobalUser(user)==null }">

            </g:if>
            <g:else>
                <g:each in="${Topic.listOrderByResources()}" var="num">
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
                                    <div style="display: flex; flex-direction: row;justify-content: space-around;width: 60%">
                                        <g:link controller="profile" action="index" params="[id:num.globalUser.id]">@${num.globalUser.username}</g:link>
                                        <div>
                                            <p>Subscription</p>
                                            ${Subscription.countByTopics(num)}
                                        </div>
                                        <div>
                                            <p>Topics</p>
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
                        </g:if>
                    </g:else>
                </g:each>
            </g:else>
        </div>
    </div>

    <div id="recent-share">
        <div>
            <div style="background-color: azure;display: flex;flex-direction: row;justify-content: space-around;width: 100%">
            <h4>Inbox</h4>

            <div id ="search_bar">
                <div class="col-4">
                    <g:form class="form-inline my-2 my-lg-0" controller="search" action="search">

                        <input class="form-control mr-sm-2" id="sea" type="search" placeholder="Search" aria-label="Search" name="search" style="border-radius: 60px !important">

                        <button id="btt" type="submit" style="display:none;">Submit</button>
                    </g:form>
                </div>
            </div>
            </div>
        </div>
            <div style="display: flex; flex-direction: column;">
                <g:if test="${linksharing.ReadingItem.findByGlobalUserAndResources(user,res) && !ReadingItem.findByGlobalUserAndResources(user,res).isRead}">
                    <div class="recent-11">
                        <div class="image11">
                            <asset:image src="${res.globalUser.photo}" alt="user_image"/>
                        </div>
                        <div class="write11" style="width: 100%;border: 1px solid black;background-color: #c8e7f7;">
                            <div style="display:flex;flex-direction: row; justify-content:space-around;width: 100% ">
                                <div style="display: flex;flex-direction: column; justify-content: flex-start;">
                                    <p>${res.globalUser.firstname} ${res.globalUser.lastname}</p>
                                    <p>@${res.globalUser.username}</p>
                                </div>
                                <div>
                                    <g:link controller="topic" action="topicsShow" params="[id:res.topics.id]">${res.topics.topicname}</g:link>
                                </div>
                                %{--<select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">--}%
                                <div class="stars" style="width:100%">
                                    <g:set var="v" value="${linksharing.ResourceRating.findByGlobalUserAndResources(user,res)?.score}"/>
                                    <h1 id="sc" style="display: none">${v}</h1>
                                    <div style="float: right">
                                        <div style="float: left">
                                            <input onclick="Rating('${res.id}' , '${5}')" class="star star-5" id="star-5" type="radio" name="star"
                                                   value="5"/> <label class="star star-5" for="star-5"></label>
                                            <input onclick="Rating('${res.id}' , '${4}')" class="star star-4" id="star-4" type="radio" name="star"
                                                   value="4"/> <label class="star star-4" for="star-4"></label>
                                            <input onclick="Rating('${res.id}' , '${3}')" class="star star-3" id="star-3" type="radio" name="star"
                                                   value="3"/> <label class="star star-3" for="star-3"></label>
                                            <input onclick="Rating('${res.id}' , '${2}')" class="star star-2" id="star-2" type="radio" name="star"
                                                   value="2"/> <label class="star star-2" for="star-2"></label>
                                            <input  onclick="Rating('${res.id}' , '${1}')" class="star star-1" id="star-1" type="radio" name="star"
                                                    value="1"/> <label class="star star-1" for="star-1"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p>${res.descrip} </p><br><br>
                            <div class="link-chain">
                                <div>
                                    <i class="fa fa-google" style="font-size: larger;"></i>
                                    <i class="fa fa-twitter" style="font-size: larger;"></i>
                                    <i class="fa fa-facebook" style="font-size: larger;"></i>
                                </div>

                                <div class="linklelo" style="width: 60%;justify-content: space-evenly;" >
                                    <g:if test ="${res.class == linksharing.LinkResource}">
                                       <a href="#" data-toggle="modal" data-target="#myModal">Edit</a>
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                              <div class="modal-dialog modal-dialog-centered" role="document">
                                                  <div class="modal-content">
                                                      <div class="modal-header">
                                                          <h5 class="modal-title">${res.topics.topicname}</h5>
                                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                              <span aria-hidden="true">&times;</span>
                                                          </button>
                                                      </div>



                                                <g:form controller="readingitem" action="editLink">
                                            <div class="modal-body">
                                                <div class="col-12">

                                                    <div class="col-12 mb-1">

                                                        <div class="col-12 ">

                                                            <div class="row">
                                                                <div class="col-4">LINK* :</div>
                                                                <div class="col-8">
                                                                    <input class="form-control" name="url" type="url" placeholder="Link">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-12">

                                                    <div class="col-12 mb-1">

                                                        <div class="row">
                                                            <div class="col-4">Description :</div>
                                                            <div class="col-8">
                                                                <textarea class="form-control" name="description" type="text" placeholder="Enter the Description"></textarea>
                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                                </g:form>
                                                  </div>
                                              </div>
                                        </div>
                                            </g:if>
                                            %{--else condition for link resource--}%
                                            <g:else>
                                                <a href="#" data-toggle="modal" data-target="#myModal2">Edit</a>
                                                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                      <div class="modal-dialog modal-dialog-centered" role="document">
                                                          <div class="modal-content">
                                                              <div class="modal-header">
                                                                  <h5 class="modal-title">${res.topics.topicname}</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                </div>
                                                <g:uploadForm controller="readingitem" action="editDocument" method="post">
                                                <div class="modal-body">
                                                    <div class="col-12">

                                                        <div class="col-12 mb-1">

                                                            <div class="row">
                                                                <div class="col-4">Choose File:</div>
                                                                <div class="col-8">
                                                                    <input class="form-control" name="documentFile" type="file" placeholder="Choose your file">
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-12">

                                                        <div class="col-12 mb-1">

                                                            <div class="row">
                                                                <div class="col-4">Description :</div>
                                                                <div class="col-8">
                                                                    <textarea class="form-control" name="description" type="text" placeholder="Enter the Description"></textarea>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </div>



                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>

                                                </g:uploadForm>

                                                          </div>
                                                      </div>
                                                </div>
                                            </g:else>



                                    <br>
                                    <g:if test="${res.globalUser.id == user.id}">
                                        <g:link controller="readingitem" action="delete" params="[id:res.id]">Delete</g:link>
                                    </g:if>
                                    <g:if test="${res.class == linksharing.DocumentResource}">
                                        <g:link controller="globalresource" action="downloadPost" params="[id: res.id]" class="links1">Download</g:link>
                                    </g:if>

                                    <g:else>
                                        <a target="_blank" href="${LinkResource.findById(res.id).urloc}" class="links1">View Full Site</a>
                                    </g:else>
                                </div>
                        </div>
                        </div>

                                </div>
                        %{--</g:if>--}%
                    </div>
                </g:if>
    </div>


</main>
    <script>
    function Rating(resourceId, star) {
        let url = "${createLink(controller:'RatingResource',action:"addRating")}"
        $.ajax({
            "url": url,
            "type": "get",
            "data": {resourceId: resourceId, star: star},
            success: function () {
                setTimeout(function (){window.location.reload()},2000);
                // helperf();
            }
        });
        // function helperf(){
        //
        //
        // }
    }

    let score = document.getElementById("sc").innerText;
    switch (score) {
        case '1':
            $("#star-1").prop("checked", true);
            break;
        case '2':
            $("#star-2").prop("checked", true);
            break;
        case '3':
            $("#star-3").prop("checked", true);
            break;
        case '4':
            $("#star-4").prop("checked", true);
            break;
        case '5':
            $("#star-5").prop("checked", true);
            break;9
     $('#myModal').modal('show')
    }
</script>
</body>
</html>