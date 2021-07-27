package linksharing

class GlobalUserController {

    def index() {
        render(view:'user');
    }
    def draw(){

        GlobalUser user = GlobalUser.findByUsernameOrEmail(params.username,params.email);
        if(user){
            flash.message ="User Already exist";
            println("Bhai register ho to rkha hai");
            redirect(controller: 'globalUser');
        }
        else{
            GlobalUser u = new GlobalUser(params);
            println("ok finally you are in");
            u.save(flush:true,failOnError:true);
            redirect(controller:"login" )
        }


    }



}
