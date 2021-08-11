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
                flash.message = "Topic Already Exists"
                render("topic already exists")
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

        Subscription s = new Subscription(globalUser: user, topics: t, seriousness: Subscription.Seriousness.VERYSERIOUS)
        s.save(flush:true)
        flash.message = "Topic Successfully created"
        redirect url: request.getHeader("Referer")
    }

    def delete(){
        Topic top=Topic.findById(params.get("id") as long)
        top.delete(flush: true)
        flash.message = "Topic deleted Succesfully"
        redirect url: request.getHeader("Referer")
    }

    def changePrivacy(){
        GlobalUser user= session.getAttribute("user0") as GlobalUser
        def topic=Topic.findById(params.get("id") as long)
        def p=params.get("privacy")
        if(p=="public")
            topic.visibility= Topic.Visibility.PUBLIC
        else
            topic.visibility = Topic.Visibility.PRIVATE


        topic.validate()
        if(topic.hasErrors())
        {
            topic.errors.allErrors.each {
                println it
            }
        }
        else
            topic.save(flush:true)
        redirect url: request.getHeader("Referer")
    }
    def edit(){
        Topic t1 = Topic.findById(params.get("id") as long)
        Topic[] tall = Topic.findAll();
        for(int i=0;i<tall.length;i++){
            if(params.topicname == tall[i].topicname ){
                flash.message = "Topic Already Exists"
                render("topic already exists")
                return;
            }
        }
        t1.topicname = params.topicname;

        t1.save(flush:true);
        redirect url: request.getHeader("Referer")
    }
}
