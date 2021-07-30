package linksharing

class GlobalUserController {

    def index() {
        render(view:'user');
    }
    def draw(){

        GlobalUser user = GlobalUser.findByUsernameOrEmail(params.username,params.email);
        if(user){
            flash.toast ="User Already exist";
            println("Bhai register ho to rkha hai");
            redirect(controller: 'globalUser');
        }
        else{
            GlobalUser u = new GlobalUser(email:params.email,username: params.username,password:params.password,firstname: params.firstname,lastname: params.lastname,confirmpassword: params.confirmpassword,admin:false,active: true);
            println("ok finally you are in");
            u.save(flush:true,failOnError:true);
            redirect(controller:"login");
        }


    }



}
