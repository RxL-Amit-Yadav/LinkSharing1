package linksharing

class ProfileController {

    def index() {
        GlobalUser user = session.getAttribute("user0") as GlobalUser
        def u = GlobalUser.findById(params.get("id")as long)
        render (view:'profile',model:[user:user , u:u])
    }
    def ownprofile(){
        GlobalUser user = session.getAttribute("user0") as GlobalUser
        render(view: 'ownprofile',model: [u:user])
    }
}
