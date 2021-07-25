package linksharing

class HomeController {

    def index() {
          render(view: "Dashboard");
    }
//    def action1(){
//        GlobalUser u = GlobalUser.findByUsername(params.id);
//        if(user){
//            println("Ok ${params.name} you are in");
//            redirect(controller:"home");
//        }
//        else{
//            println("Sorry sir niklo yaha se");
//            redirect(controller: "home");
//        }
//    }
}
