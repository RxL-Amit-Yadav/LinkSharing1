package linksharing

class LoginController {

    def index() {
        render(view: 'login');
    }
    def action1(){
        GlobalUser user = GlobalUser.findByEmailAndPassword(params.email,params.password);
        if(!user){
            flash.message = "Invalid Credentials/User doesn't Exist"
            println("Kaun ho bhai?");
            redirect(controller: 'login')
        }
        else{
            println("aajaao bhai");
            redirect(controller: 'home');
        }
    }
}
