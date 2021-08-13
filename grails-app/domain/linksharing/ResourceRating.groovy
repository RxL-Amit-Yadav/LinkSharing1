package linksharing

class ResourceRating {
    int score;
    GlobalUser globalUser;
    GlobalResource resources;
    static belongsTo = [globalUser:GlobalUser,resources:GlobalResource];
}
