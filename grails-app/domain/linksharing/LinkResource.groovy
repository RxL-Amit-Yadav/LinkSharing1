package linksharing

class LinkResource extends GlobalResource{
    String urloc;
    static constraints = {
        urloc(blank: false,url: true)
    }
}
