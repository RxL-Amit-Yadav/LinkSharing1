package linksharing

class ResourceRating {
    int score;
    static belongsTo = [globalusers:GlobalUser,globalresources:GlobalResource];
}
