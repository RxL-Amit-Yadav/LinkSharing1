package linksharing

class Topic {
    String topicname;
    Date dateCreated;
    Date lastUpdated;
    static hasMany = [subscriptions:Subscription,globalresources:GlobalResource];
    static belongsTo = [globalusers:GlobalUser];
    enum visibility{
        PUBLIC,
        PRIVATE
    }
}
