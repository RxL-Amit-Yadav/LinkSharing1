package linksharing

class UserController {
    def edit(){
        GlobalUser user = session.getAttribute("user0") as GlobalUser
        render(view:"/globalUser/editProfile",model: [user:user] )
    }

    def updateProfile(){

        GlobalUser a= session.getAttribute("user0") as GlobalUser
        def user=GlobalUser.get(a.id)

        if(params.get("username") && params.("firstname") && params.("lastname")){

            if(user.admin){
                render("CANNOT CHANGE DETAILS ADMIN USER")
            }
            else{
                user.firstname = params.get("firstname")
                user.lastname = params.get("lastname")
                user.email = params.get("email")
                user.username = params.get("username")
                user.password = user.password
                user.confirmpassword = user.password
                def image = request.getFile('photo')
                def origin = image.getOriginalFilename()
                println(origin)
                if (origin) {
                    File file = new File("/home/rxlogix/LinkSharing/grails-app/assets/images/profile/${user.username}.jpeg")
                    image.transferTo(file)
                    user.photo = "/profile/${user.username}.jpeg"
                } else {
                    user.photo = "/profile/user.jpg"
                }
                user.save(flush: true)
                session.setAttribute("user0", user)
                redirect(controller: "user", action: "edit")
            }
        }
    }

    def updatePassword(){

        GlobalUser u= session.getAttribute("user0") as GlobalUser

        def user=GlobalUser.get(u.id)
        user.password=params.get("password")
        if(user.password == params.get("cpassword"))
            user.confirmpassword = user.password
        else{
            render("please type same password")
            return;
        }
        user.username = user.username
        user.firstname = user.firstname
        user.lastname = user.lastname
        user.email = user.email
        user.confirmpassword = user.password
        user.save(flush: true)
        session.setAttribute("user0", user)

        redirect(controller: "user", action: "edit")
    }

}
