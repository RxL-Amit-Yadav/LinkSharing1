package linksharing

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "globalUser")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}