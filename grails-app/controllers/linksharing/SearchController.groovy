package linksharing

class SearchController {

    def index() { }
    def search(){
        GlobalUser u=session.getAttribute("user0") as GlobalUser
        render (view:"/home/search" ,model: [searchElement:params.get("search"),user:u])
    }
}
