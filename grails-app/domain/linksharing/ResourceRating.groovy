package linksharing

class ResourceRating {
    int score;
    GlobalUser globalUser;
    GlobalResource globalResource;
    static belongsTo = [globalUser:GlobalUser,globalResource:GlobalResource];
}
