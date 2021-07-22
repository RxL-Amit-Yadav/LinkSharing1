package linksharing

class ReadingItem {
    Boolean isRead;
    static belongsTo = [globalusers:GlobalUser,globalresources:GlobalResource];
}
