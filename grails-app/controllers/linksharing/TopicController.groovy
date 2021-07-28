package linksharing

import org.hibernate.Session

class TopicController {

    def index() {
    render(view: '/home/Dashboard');
    }
    def action1(){
//        GlobalUser g =GlobalUser.get(Session.userId);
//        String name = Topic.get(params.topicname)
        Topic t = new Topic(params);
        println(t.topicname);
//        String topicname = Topic.get(params.topicname)
//        int userid = g.get(params.get());

//        println(t.topicname);
    redirect(controller:'globalUser');
    }

}
