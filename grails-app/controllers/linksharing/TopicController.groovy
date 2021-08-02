package linksharing

import org.hibernate.Session

class TopicController {
    def topicsShow(){
        GlobalUser u= session.getAttribute("user0") as GlobalUser
        def topic=Topic.findById(params.get("id")as long)
        render (view:'topicshow',model:[t:topic,u:u])
    }
    def createTopic() {

        if (session.user0 == null) {
            render("there is no user present");
        }
        GlobalUser u= session.getAttribute("user0") as GlobalUser
        def user = GlobalUser.get(u.id)
        Topic t = new Topic(topicname: params.get("topicname"), globalUser: user)
        Topic[] tall = Topic.findAll();
        for(int i=0;i<tall.length;i++){
            if(t.topicname == tall[i].topicname ){
                render("This topic exists");
                return;
            }
        }

        String v = params.get("visible");
        if (v == "public")
            t.visibility = Topic.Visibility.PUBLIC
        else{
            t.visibility = Topic.Visibility.PRIVATE
    }
        t.validate();
            try {
                t.save(flush: true, failOnError: true)
            }
        catch(Exception e){
            println(e);
        }
        Subscription s = new Subscription(globalUser: user, topics: t, seriousness: Subscription.Seriousness.SERIOUS)
        s.save(flush:true)
        redirect url: request.getHeader("Referer")
    }

    def delete(){
        Topic top=Topic.findById(params.get("id") as long)
        top.delete(flush: true)
        redirect url: request.getHeader("Referer")
    }

}
