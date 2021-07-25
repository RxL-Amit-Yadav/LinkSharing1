package linksharing

class GlobalUser {
    String email;
    String username;
    String password;
    String firstname;
    String lastname;
    byte [] photo;
    boolean admin;
    boolean active;
    Date dateCreated;
    Date lastUpdated;
   static hasMany = [subscriptions:Subscription,topics:Topic,resources:GlobalResource,readingitems:ReadingItem,resoruceratings:ResourceRating];

    static constraints = {
        admin nullable :true;
        active nullable:true;
        firstname maxSize: 25;
        username unique: true;
        email unique: true;
        photo nullable: true;
    }
}