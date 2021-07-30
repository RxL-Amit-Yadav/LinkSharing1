package linksharing

class Subscription {
   Date datecreated;
    Topic topics;
    GlobalUser globalUser;
     enum seriousness {
        SERIOUS,
        CASUAL,
        VERYSERIOUS
    }
   static belongsTo = [globalUser:GlobalUser,topics:Topic];
}