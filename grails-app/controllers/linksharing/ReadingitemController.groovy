package linksharing

import org.springframework.web.multipart.MultipartFile

class ReadingitemController {
    def markRead(){
        GlobalUser u= session.getAttribute("user0") as GlobalUser
        GlobalUser user=GlobalUser.get(u.id)
        GlobalResource r=GlobalResource.findById(params.get("id") as long)
        ReadingItem rd=ReadingItem.findByGlobalUserAndResources(user,r)

        rd.isRead=true
        rd.globalUser=user
        rd.resources=r
        rd.validate()
        if(rd.hasErrors())
        {
            rd.errors.allErrors.each {
                println it
            }
        }
        else
            rd.save(flush:true)
        redirect url: request.getHeader("referer")
    }
    def editLink() {
        GlobalUser u = session.getAttribute("user0") as GlobalUser
        GlobalUser user = GlobalUser.get(u.id)
        GlobalResource gr = LinkResource.findByGlobalUser(user);
        println(params);
        gr.urloc = params.url;
        gr.descrip = params.description
        gr.save(flush:true,failOnError:true);
        redirect url: request.getHeader("referer")
    }
    def editDocument(){
            GlobalUser u = session.getAttribute("user0") as GlobalUser
            GlobalUser user = GlobalUser.get(u.id)
            GlobalResource dr = DocumentResource.findByGlobalUser(user);
            println(dr);
            MultipartFile myFile = params.documentFile
            File file = new File("/home/rxlogix/Desktop/downloadpost/${myFile.originalFilename}")
            myFile.transferTo(file)
            String path=file.getAbsolutePath()
            dr.descrip = params.description
            dr.filepath = path
            dr.save(flush:true,failOnError:true)
            redirect url:request.getHeader("referer")
        }

    def delete(){
        GlobalUser u = session.getAttribute("user0") as GlobalUser
        GlobalUser user = GlobalUser.get(u.id)
//        Topic t1 = Topic.findByGlobalUser(user);
        GlobalResource gr = GlobalResource.findById(params.get("id") as long);
        gr.delete(flush: true)
        flash.message = "Resource deleted Successfully"
        redirect(url:request.getHeader("referer"))
    }
}
