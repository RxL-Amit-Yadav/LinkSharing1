package linksharing

class GlobalResource {
    String descrip;
    Date  dateCreated;
    Date  lastUpdated;

    static hasMany = [lresources:LinkResource,dresources:DocumentResource];
    static belongsTo = [globalusers: GlobalUser, topics: Topic]
}
