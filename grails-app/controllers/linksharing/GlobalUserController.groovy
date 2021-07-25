package linksharing

class GlobalUserController {

    def index() {
        render(view:'user');
    }
    def draw(){

        GlobalUser user = GlobalUser.findByUsernameOrEmail(params.username,params.email);
        if(user){
            flash.message = "User Already exist";
            println("Bhai register ho to rkha hai");
            redirect(controller: 'globalUser');
        }
        else{
            GlobalUser u = new GlobalUser(params);
            println("ok finally you are in");
            u.save(flush:true,failOnError:true);
            redirect(controller:"login" )
        }
//        try{
//            GlobalUser u = new GlobalUser(params);
//            u.save(flush:true);
//            println("done printing");
//            redirect(controller:'login',action:'action1')
//        }catch(Exception e){
//            println("Error"+ e);
//            flash.message = "user/email already exist";
//            redirect(controller:'globalUser');
//        }

    }



}
