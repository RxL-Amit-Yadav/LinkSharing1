package linksharing

class Topic {
    String topicname;
    Date dateCreated;
    Date lastUpdated;
//    Visibility visibility;
//    GlobalUser createdBy;
    static hasMany = [subscriptions:Subscription,globalresources:GlobalResource];
    static belongsTo = [globalusers:GlobalUser];

//    enum Visibility{
//        PUBLIC,PRIVATE
//    }
}
