package linksharing

class GlobalResource {
    String descrip;
    Date  dateCreated;
    Date  lastUpdated;
    GlobalUser globalUser ;
    Topic topics;

    static hasMany = [lresources:LinkResource,dresources:DocumentResource];
    static belongsTo = [globalUser: GlobalUser, topics: Topic]
}
