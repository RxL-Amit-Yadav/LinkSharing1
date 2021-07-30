package linksharing

import org.hibernate.Session

class TopicController {

    def topicsave() {

        if (session.userId == null) {
            render("there is no user present");
        }
        GlobalUser u = GlobalUser.get(session.userId);
        GlobalUser user = GlobalUser.get(u.id);
        println(user.firstname);
//        Topic t = Topic.findAll();
        List [] l1 = Topic.executeQuery("select visibility from Topic where topicname = werwerwer");
        println(l1);
        Topic t = new Topic(topicname: params.get("topicname"), globalUser: user)
        String v = params.get("visible");
        if (v == "public")
            t.visibility = Topic.Visibility.PUBLIC
        else{
            t.visibility = Topic.Visibility.PRIVATE
    }
        println(t);
        t.validate();
            try {
                t.save(flush: true, failOnError: true)

            }
        catch(Exception e){
            println(e);
        }
        Subscription s = new Subscription(globalUser: user,topics: t)
        String s1 = params.get("serious");;
        if(s1=="serious"){
            s.seriousness = Subscription.seriousness.SERIOUS
        }
        else if(s1=='veryserious'){
            s.seriousness = Subscription.seriousness.VERYSERIOUS
        }
        else{
            s.seriousness = Subscription.seriousness.CASUAL
        }
        s1.save(flush:true)
        render(view:'/home/Dashboard',model: [users:u.topics])
    }
    def delete(){
        GlobalUser u = GlobalUser.get(session.userId);
        GlobalUser user=User.get(u.id)
        Topic top=Topic.findById(params.get("id"))
//        user.removeFromTopics(top)
        top.delete(flush: true)
        redirect url: request.getHeader("Referer")
    }

}
