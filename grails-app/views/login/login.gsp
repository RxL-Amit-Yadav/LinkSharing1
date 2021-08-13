<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<body>
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
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                        <h2 style="color: black; background-color: lightgrey">${flash.message}</h2>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</g:if>
    %{--<div class="message" role="status">${flash.message}</div>--}%
<div class="wrapper fadeInDown">
    <div id="formContent">


        <!-- Login Form -->
        <g:form controller="login" action="action1">
            <input type="text" id="login" class="fadeIn second" name="email" placeholder="login">
            <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
            <input type="submit" class="fadeIn fourth" value="Log In">
        </g:form>

    </div>
</div>
<script>
    $("#himodal").modal("show");
</script>
</body>

</html>