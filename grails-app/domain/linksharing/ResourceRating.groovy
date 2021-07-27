package linksharing

class ResourceRating {
    int score;
    GlobalUser user1;
    GlobalResource resource1;
    static belongsTo = [globalusers:GlobalUser,globalresources:GlobalResource];
}
