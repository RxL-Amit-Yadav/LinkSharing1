package linksharing

class HomeController {
    def homeService

    def index() {
        if(session.user0==null){
            redirect(controller: 'globalUser')
        }
        GlobalUser user= session.getAttribute("user0") as GlobalUser
       def map = homeService.fetchmodal(user);
        render(view:'Dashboard',model:map)
    }
}
