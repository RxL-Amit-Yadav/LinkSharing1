package linksharing

class ReadingItem {
    Boolean isRead;
    GlobalUser globalUser;
    GlobalResource globalResource;
    static belongsTo = [globalUser:GlobalUser,globalResource:GlobalResource];
}
