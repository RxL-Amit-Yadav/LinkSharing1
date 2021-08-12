package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class TopPostService {

    def createreadingitems(Topic t,GlobalUser u){
        t.resources.each {
            GlobalResource gr=GlobalResource.findById(it.id)
            ReadingItem ri = new ReadingItem(globalUser: u, resources:gr, isRead: false)
            gr.save(flush: true)
            gr.addToReadingitems(ri)
            u.addToReadingitems(ri)
        }
    }

    def deletereadingitems(Topic t,GlobalUser u){
        t.resources.each{
            GlobalResource gr=GlobalResource.get(it.id)
            ReadingItem ri=ReadingItem.findByGlobalUserAndResources(u,gr);
            u.removeFromReadingitems(ri)
            gr.removeFromReadingitems(ri)
            ri.delete(flush:true)
        }
    }
}
