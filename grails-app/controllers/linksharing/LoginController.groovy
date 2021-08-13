package linksharing

class LoginController {

    def index() {
        render(view: 'login');
    }
    def action1(){
        GlobalUser user = GlobalUser.findByEmailAndPassword(params.get("email"),params.get("password"));
        if(!user){
            flash.message="Invalid Credentials"
            redirect(controller: 'globalUser')
        }
        else if(!user.active){
            flash.message = "Your account has been deactivated"
            redirect(controller: 'globalUser')
        }
        else{
                session.setAttribute("user0", user)
                println("login done!")
                redirect(controller: 'home')
        }
    }


    def logout(){
        session.invalidate();
        flash.message = "Logout Successfully"
        redirect(controller: 'globalUser')
    }
    def forgotPassword(){
//        String b = "Hello! Please click on this link to add new password"<a href="localhost:8000/globalUser/updatePassword?emailid = ${params.email}"></a>"
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(6);

        for (int i = 0; i < 6; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index = (int)(AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }
        GlobalUser u = GlobalUser.findByEmail(params.email);
        if(!u || params.email2 != "amityadavdtu@gmail.com"){
         render("Invalid email")
        }
        else{
            u.password = sb;
            u.save(flush:true);
        }
                sendMail{
            to params.email2
            body "Hello User!,Your new password for ${params.email} is " +sb+ ".Thank you!"
        }
//
        flash.message = "Message sent at "+new Date()
       redirect(controller: 'globalUser')
    }
    }
