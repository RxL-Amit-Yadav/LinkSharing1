package linksharing

class LinkResource extends GlobalResource{
    String url;
    static constraints = {
        url(blank: false,url: true)
    }
}
