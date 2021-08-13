package linksharing

class AdminController {


        def adminView(){
            GlobalUser u= session.getAttribute("user0") as GlobalUser
            render(view: "/globalUser/adminView", model: [u:u])
        }

        def activate(){
            GlobalUser u= session.getAttribute("user0") as GlobalUser

            def u1 = GlobalUser.get(params.get("id"))
            def u2= GlobalUser.findById(params.get("id"))
            u1.username=u2.username
            u1.password=u2.password
            u1.firstname=u2.firstname
            u1.lastname=u2.lastname
            u1.email=u2.email
            u1.confirmpassword=u2.password
            u1.active=true
            u1.save(flush:true)
            render(view: "/globalUser/adminView", model: [u:u])
        }

        def deactivate() {
            GlobalUser u= session.getAttribute("user0") as GlobalUser
            def u1 = GlobalUser.get(params.get("id"))
            def u2= GlobalUser.findById(params.get("id"))
            u1.username=u2.username
            u1.password=u2.password
            u1.firstname=u2.firstname
            u1.lastname=u2.lastname
            u1.email=u2.email
            u1.confirmpassword=u2.password
            u1.active=false
            u1.save(flush:true)
            render(view: "/globalUser/adminView", model: [u:u])
        }
    def topics(){
        GlobalUser u= session.getAttribute("user0") as GlobalUser
        GlobalUser user = GlobalUser.findById(u.id)
        render(view:'/globalUser/topicv',model: [u:user])
    }
    def posts(){
        GlobalUser u= session.getAttribute("user0") as GlobalUser
        GlobalUser user = GlobalUser.findById(u.id)
        render(view:'/globalUser/posts',model: [u:user])
    }

    }


