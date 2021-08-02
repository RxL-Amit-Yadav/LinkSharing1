package linksharing

class Subscription {
    enum Seriousness{
        SERIOUS,
        CASUAL,
        VERYSERIOUS,
    }
    Seriousness seriousness;
   Date dateCreated;
    Topic topics;
    GlobalUser globalUser;

   static belongsTo = [globalUser:GlobalUser,topics:Topic];
}