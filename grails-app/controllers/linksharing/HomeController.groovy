package linksharing

class HomeController {

    def index() {
        if(session.userId==null){
            redirect(controller: 'globalUser')
        }
        GlobalUser user = GlobalUser.get(session.userId)
        render(view:'Dashboard',model:[user:user])
    }
}
