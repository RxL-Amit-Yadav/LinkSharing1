package linksharing

import org.springframework.web.multipart.MultipartFile

class GlobalresourceController {

    def createLink(){
        GlobalUser user = session.getAttribute("user0") as GlobalUser
        def t=params.get("urlTopic")
        Topic topic = Topic.findByTopicname(t)
        GlobalResource r=new LinkResource(descrip: params.get("urlDescription"),globalUser: user ,topics: topic ,urloc: params.get("url"))
        r.validate()
        r.save(flush:true)
        ReadingItem rt = new ReadingItem(globalUser: user,resources: r,isRead: false);
        rt.save(flush:true,failOnError:true);
        flash.message = "Link resource Created Succesfully"
        redirect url: request.getHeader("Referer")
    }
    def fileUpload(){
        GlobalUser user= session.getAttribute("user0") as GlobalUser
        MultipartFile myFile = params.documentFile
        File file = new File("/home/rxlogix/Desktop/downloadpost/${myFile.originalFilename}")
        myFile.transferTo(file)
        String path=file.getAbsolutePath()

        def t=params.get("documentTopic")
        Topic topic=Topic.findByTopicname(t)
        GlobalResource r=new DocumentResource(descrip: params.get("documentDescription"),
                globalUser: user ,topics: Topic.findByTopicname(t) ,filepath: path)
        r.validate()
        r.save(flush:true)
        ReadingItem rt = new ReadingItem(globalUser: user,resources: r,isRead: false);
        rt.save(flush:true,failOnError:true);
        flash.message = "Document resource Created Succesfully"
        redirect url: request.getHeader("Referer")
    }

    def downloadPost() {
        DocumentResource rs = GlobalResource.findById(params.get("id") as long)
        File file = new File("${rs.filepath}")
        byte[] orderPDF = file.getBytes()
        response.setHeader("Content-disposition", "attachment; filename=" + file.name)
        response.contentLength = orderPDF.length
        response.outputStream << orderPDF
        redirect url: request.getHeader("Referer")
    }
}
