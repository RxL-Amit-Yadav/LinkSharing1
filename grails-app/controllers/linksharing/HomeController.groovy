package linksharing

class HomeController {

    def index() {
        if(session.user0==null){
            redirect(controller: 'globalUser')
        }
        GlobalUser user= session.getAttribute("user0") as GlobalUser
        render(view:'Dashboard',model:[user:user])
    }
}
