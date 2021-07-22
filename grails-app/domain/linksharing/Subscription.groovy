package linksharing

class Subscription {
   Date datecreated;
    public enum seriousness {
        SERIOUS,
        CASUAL,
        VERYSERIOUS
    }
   static belongsTo = [globalusers:GlobalUser,topics:Topic];
}