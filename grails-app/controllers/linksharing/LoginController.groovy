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
            if(user.password != user.confirmpassword){
                println("incorrect password");
                return;
            }
            println("aajaao bhai");
            redirect(controller: 'home');
        }
    }
}
