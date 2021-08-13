package linksharing

class BootStrap {

    def init = { servletContext ->
        createUser()
    }
    def destroy = {
    }
    def createUser(){
        GlobalUser admin = new GlobalUser(firstname: "Amit", password: "Amit123", username: "Amit12",
                lastname: "Yadav", email: "amit779@gmail.com",admin: "true",active: "true",
                confirmpassword: "Amit123",photo:"/profile/user.jpg")

        admin.save(flush:true);
    }
}
