package linksharing

class Subscription {
   Date datecreated;
    Topic topic;
    GlobalUser user1;
//    public enum seriousness {
//        SERIOUS,
//        CASUAL,
//        VERYSERIOUS
//    }
   static belongsTo = [globalusers:GlobalUser,topics:Topic];
}