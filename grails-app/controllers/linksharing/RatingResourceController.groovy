package linksharing

import javax.xml.bind.ValidationException

class RatingResourceController {
    def index() {
        GlobalUser user = session.getAttribute("user0") as GlobalUser
        GlobalUser u = GlobalUser.findById(user.id)
        GlobalResource gr = GlobalResource.findById(params.get("id") as long)
        render(view: 'post',model: [user:user,res:gr]);
    }
    def addRating(){
        GlobalUser user = session.getAttribute("user0") as GlobalUser
        GlobalResource gr = GlobalResource.get(params.resourceId);
        int score = params.getInt('star')
        println(params);
//        GlobalResource resource = GlobalResource.get(resourceId);
        ResourceRating resourceRating= ResourceRating.findByGlobalUserAndResources(user,gr)

        if(resourceRating){
            resourceRating.score=score
        }
        else {
            resourceRating = new ResourceRating([score: score, globalUser: user, resources: gr]);
        }
        resourceRating = resourceRating.save(flush:true,failOnError:true)
//        println(resourceRating);
       redirect(url:request.getHeader('referar'))
    }
//    def edit(){
//        GlobalUser user = session.getAttribute("user0");
//        GlobalResource gr = GlobalResource.findByGlobalUser(user);
//        gr.descrip = params.description;
//        gr.save(flush:true,failOnError:true);
//        redirect(url:request.getHeader("referar"))
//    }

    }

