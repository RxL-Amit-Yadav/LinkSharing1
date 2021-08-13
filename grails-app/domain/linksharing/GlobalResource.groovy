package linksharing

class GlobalResource {
    String descrip;
    Date  dateCreated;
    Date  lastUpdated;
    GlobalUser globalUser ;
    Topic topics;

    static hasMany = [readingitems:ReadingItem,resourceratings:ResourceRating];
    static belongsTo = [topics:Topic , globalUser:GlobalUser]
}
