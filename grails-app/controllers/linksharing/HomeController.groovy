package linksharing

class HomeController {

    def index() {

        if(session.user0==null){
            redirect(controller: 'globalUser')
        }
        GlobalUser user= session.getAttribute("user0") as GlobalUser

        if(session.userId==null){
            redirect(controller: 'globalUser')
        }
        GlobalUser user = GlobalUser.get(session.userId)
        render(view:'Dashboard',model:[user:user])
    }
}
