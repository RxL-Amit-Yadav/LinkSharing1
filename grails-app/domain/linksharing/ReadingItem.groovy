package linksharing

class ReadingItem {
    Boolean isRead;
    GlobalUser user1;
    GlobalResource resource1;
    static belongsTo = [globalusers:GlobalUser,globalresources:GlobalResource];
}
