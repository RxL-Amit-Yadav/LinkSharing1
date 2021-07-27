package linksharing

class GlobalResource {
    String descrip;
    Date  dateCreated;
    Date  lastUpdated;
    GlobalUser user1;
    Topic topic;

    static hasMany = [lresources:LinkResource,dresources:DocumentResource];
    static belongsTo = [globalusers: GlobalUser, topics: Topic]
}
