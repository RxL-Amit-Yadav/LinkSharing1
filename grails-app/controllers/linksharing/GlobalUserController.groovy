package linksharing

class GlobalUserController {
    def index() {
            List publicTopic = Topic.findAllByVisibility(0)
            List resource = GlobalResource.createCriteria().list() {
                inList("topics", publicTopic)
            }

            List<GlobalResource> top = ResourceRating.createCriteria().list() {
                projections {
                    avg("score", "average")
                }
                order("average", "desc")
                inList("resources", resource)
                groupProperty("resources")
            }
            def topList = new ArrayList()
            for (int i = 0; i < top.size(); i++) {
                topList[i] = top[i][1]
            }
            render(view: 'user',model: [top:topList]);
        }

    def draw() {

        GlobalUser user = GlobalUser.findByUsernameOrEmail(params.username, params.email);
        if (user) {
            flash.message = "User Already exist";
            redirect(controller: 'globalUser');
        } else {
            GlobalUser u = new GlobalUser(email: params.email, username: params.username, password: params.password, firstname: params.firstname, lastname: params.lastname, confirmpassword: params.cpassword, admin: false, active: true);
            if (u.validate()) {
                // do something with user
                if (u.password != u.confirmpassword) {
                    flash.message = "Password Doesn't match"
                    redirect(url: request.getHeader('referar'))
                } else {
                    def image = request.getFile('photo')
                    def origin = image.getOriginalFilename()
                    println(origin)
                    if (origin) {
                        File file = new File("/home/rxlogix/LinkSharing/grails-app/assets/images/profile/${u.username}.jpeg")
                        image.transferTo(file)
                        u.photo = "/profile/${u.username}.jpeg"
                    } else {
                        u.photo = "/profile/user.jpg"
                    }
                    println("ok finally you are in");
                    u.save(flush: true, failOnError: true);
                    flash.message = "Registration successfull"
                    redirect(controller: "login");
                }
            } else {
                flash.message = "Email Invalid/Credentials are missing"
                redirect(url: request.getHeader('referar'))
            }


        }
    }

    def updatePassword() {
        GlobalUser u = GlobalUser.findByEmail(params.emailid);
        if (u) {
            render(view: 'changepassword', model: [user: u])
        } else {
            flash.message = "Email doesn't Exists"
            redirect(controller: 'globalUser')
        }
    }
}
