<html>
<head>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'user.css')}">
</head>
<body>
<g:form controller="login" action="forgotPassword">
    <div class="field">
        <input type="text" name="email" placeholder="Email Address" >
    </div>
    <div class="field">
        <input type="text" name="subject" placeholder="Subject" >
    </div>
    <div class="field">
        <textarea type="text" name="body" placeholder="Body" >
    </div>

</g:form>
</body>

</html>