package linksharing

class Topic {
    @Override
    public String toString() {
        return "Topic{" +
                "id=" + id +
                ", topicname='" + topicname + '\'' +
                ", dateCreated=" + dateCreated +
                ", lastUpdated=" + lastUpdated +
                ", visibility=" + visibility +
                '}';
    }

    enum Visibility{
        PUBLIC,
        PRIVATE
    }
    String topicname;
    Date dateCreated;
    Date lastUpdated;
    Visibility visibility;
    GlobalUser globalUser;
    static hasMany = [subscriptions:Subscription,resources:GlobalResource];
    static belongsTo = [globalUser:GlobalUser];


    static constraints = {
        topicname blank: false, nullable: false
        dateCreated nullable: true;
        lastUpdated nullable: true;
    }

}
