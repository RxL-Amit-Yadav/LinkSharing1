package linksharing

class LoginController {

    def index() {
        render(view: 'login');
    }
    def action1(){
        GlobalUser user = GlobalUser.findByEmailAndPassword(params.get("email"),params.get("password"));

        if(!user){
            flash.message = "Invalid Credentials/User doesn't Exist"
            println("Kaun ho bhai?");
            redirect(controller: 'globalUser')
        }
        else{

            session.setAttribute("user0",user)
            println("login done!")
            redirect(controller: 'home');
        }
    }



            session.userId=user.id;
            redirect(controller: 'home');
        }
    }

    def logout(){
        session.invalidate();
        redirect(controller: 'globalUser')
    }
    def forgotPassword(){

        GlobalUser u = GlobalUser.findByEmail(params.email)
        def user=GlobalUser.get(u.id)
//        render(user)
        user.password=params.get("password")


        if(user.admin == true){
            render("ADMIN USER CANNOT CHANGE");
            return
        }

//        if(user.admin == true){
//            render("ADMIN USER CANNOT CHANGE")
//            return
//        }



        if(user.password == params.get('cpassword')){
            user.confirmpassword=user.password
        }
        else{
            render("PLEASE ENTER SAME PASSWORD")
        }


        user.username=user.username
        user.firstname=user.firstname
        user.lastname=user.lastname
        user.email=user.email
        user.confirmpassword=user.password
        user.save(flush:true)
        redirect (controller: 'globalUser')
    }
}
