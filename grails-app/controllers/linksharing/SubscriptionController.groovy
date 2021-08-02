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


        GlobalUser user = GlobalUser.findByEmail(params.email)
        Topic topic = Topic.findByTopicname(params.topic)

        if (user && !Subscription.findByTopicsAndGlobalUser(topic, user)) {

            Subscription s = new Subscription(user: user, topic: topic, seriousness: Subscription.Seriousness.SERIOUS)
            s.save(flush: true)
            topPostService.createreadingitems(topic, user)
            topic.addToSubscriptions(s)
            user.addToSubscriptions(s)
            redirect(url: request.getHeader("referer"), params: [user: session.getAttribute("user0")])
        } else
            render("IT IS AN ERROR")
    }
}