<%@ page import="linksharing.GlobalUser; linksharing.ReadingItem; linksharing.Topic.Visibility ; linksharing.Subscription.Seriousness ;  linksharing.DocumentResource; linksharing.LinkResource ; linksharing.GlobalResource ; linksharing.Topic ; linksharing.Subscription" %>

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
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
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

            <div>
            <button  type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#sendInvitations"><i class="fa fa-envelope" style="font-size: medium; height:20px;"></i></button>

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
                                <g:link controller="admin" action="topics">Topics</g:link>
                            </div>
                            <div class="col-5">
                                <g:link controller="admin" action="posts">Posts</g:link>
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
                                <g:link controller="login" action="logout">Logout</g:link>
                            </div>
                        </g:else>


                    </div>

                </div>
            </div>




        </div>

    </div>
    <br>
</header>
<main>
    <div class="container-fluid ">
        <nav class=" navbar heading rounded-top"><span><STRONG>Post List</STRONG></span></nav>
        <div style="border: 3px solid black">
            <table class="table table-striped mb-0" id="myTable">
                <thead>
                <tr>
                    <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(1)')" style="cursor:pointer">Id</th>
                    <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(2)')" style="cursor:pointer">Description</th>
                    <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(3)')" style="cursor:pointer">Resource Type</th>
                    <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(4)')" style="cursor:pointer">Topic</th>
                    <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(5)')" style="cursor:pointer">Created By</th>
                    <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(6)')" style="cursor:pointer">Update</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${linksharing.GlobalResource.list()}" var="u">
                    <tr class="item">
                        <td>${u.id}</td>
                        <td>${u.descrip}</td>
                    <td>
                        <g:if test="${u.class == linksharing.LinkResource}">Link Resource</g:if>
                        <g:else>Document Resource</g:else>
                    </td>
                        <td>${u.topics.topicname}</td>

                        <td>${u.globalUser.firstname}</td>
                        <td><g:link controller="readingitem" action="delete" params="[id:u.id]">Delete</g:link></></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

</main>
</body>
<script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#myTable').DataTable();
    } );
</script>
</html>