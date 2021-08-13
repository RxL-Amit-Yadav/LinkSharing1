package linksharing

class ReadingItem {
    Boolean isRead;
    GlobalUser globalUser;
    GlobalResource resources;
    static belongsTo = [globalUser:GlobalUser,resources:GlobalResource];
}
