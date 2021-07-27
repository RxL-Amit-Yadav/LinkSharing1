package linksharing

class GlobalUser {
    String email;
    String username;
    String password;
    String firstname;
    String lastname;
    String confirmpassword;
//    byte[] photo;
    boolean admin;
    boolean active;
    Date dateCreated;
    Date lastUpdated;
   static hasMany = [subscriptions:Subscription,topics:Topic,resources:GlobalResource,readingitems:ReadingItem,resoruceratings:ResourceRating];
    static transients = ['confirmpassword'];
    static constraints = {
        email(unique: true,email: true,blank: false)
        username (size: 4..10,unique: true,blank: false)
        password (size: 4..15,blank: false)
        admin (nullable: true)
        active (nullable: true)
        firstname(blank: false)
        lastname(blank: false)
        confirmpassword(bindable: true,nullable: true,blank: true)
    }
}