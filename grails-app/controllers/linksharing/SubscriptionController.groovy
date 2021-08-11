package linksharing

class SubscriptionController {
    def topPostService;

    def changeSeriousness() {
        GlobalUser u = session.getAttribute("user0") as GlobalUser
        def top = Topic.findById(params.get("id") as long)
        def sub = Subscription.findByTopicsAndGlobalUser(top, u)
        def s = params.get("serious")
        if (s == "serious")
            sub.seriousness = Subscription.Seriousness.SERIOUS
        else if (s == "Casual" || s == "CASUAL" || s == "casual")
            sub.seriousness = Subscription.Seriousness.CASUAL
        else
            sub.seriousness = Subscription.Seriousness.VERYSERIOUS
        sub.validate()
        if (sub.hasErrors()) {
            sub.errors.allErrors.each {
                println it
            }
        } else
            sub.save(flush: true)

        redirect url: request.getHeader("Referer")
    }

    def unsubscribe() {
        GlobalUser u = session.getAttribute("user0") as GlobalUser
        GlobalUser user = GlobalUser.get(u.id)
        Topic top = Topic.findById(params.get("id") as long)
        Subscription sub = Subscription.findByTopicsAndGlobalUser(top, user)
        user.removeFromSubscriptions(sub)
        top.removeFromSubscriptions(sub)
        sub.delete(flush: true)
        topPostService.deletereadingitems(top, user)
        session.setAttribute("user0", user)
        redirect url: request.getHeader("Referer")
    }

    def subscribe() {
        GlobalUser u = session.getAttribute("user0") as GlobalUser
        GlobalUser user = GlobalUser.get(u.id)
        Topic top = Topic.findById(params.get("id") as long)
        Subscription s = new Subscription(user: user, topic: top, seriousness: Subscription.Seriousness.SERIOUS)
        top.addToSubscriptions(s)
        user.addToSubscriptions(s)
        s.save(flush: true)
        topPostService.createreadingitems(top, user)
        session.setAttribute("user0", user)
        redirect url: request.getHeader("Referer")
    }


    def viewAll() {
        GlobalUser u = session.getAttribute("user0") as GlobalUser
        render(view: "viewAll", model: [u: u])
    }

    def invite() {
        GlobalUser u = session.getAttribute("user0") as GlobalUser
//        Topic t = Topic.findById(params.get("id") as long)
        String s1 = params.get("topic")
        GlobalUser user = GlobalUser.get(u.id);
            sendMail{
                to params.email
                subject "Subject"+params.subject
                text "Hi," +
                        " ${user.firstname} has invited you to subscribe a ${s1} topic"
            }

            flash.message = "Message sent at "+new Date()
            redirect(controller:'home',action:'index')
    }
}