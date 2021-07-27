package linksharing

class Topic {
    String topicname;
    Date dateCreated;
    Date lastUpdated;
    GlobalUser createdBy;
    static hasMany = [subscriptions:Subscription,globalresources:GlobalResource];
    static belongsTo = [globalusers:GlobalUser];
}
