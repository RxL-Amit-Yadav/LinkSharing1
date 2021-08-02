package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class TopPostService {

    def serviceMethod() {

    }
    List<Topic> toppost(){
        Map<Long,Integer> m=[:]
        Topic.list().each{
            m.put(it.id,it.globalresources.size())
        }
        m=m.sort{it.value}
        m
        List<Topic> l=[]
        Set<Integer> s= m.keySet()
        for(int i=0;i<s.size();i++)
        {
            l.add(Topic.findById(s[i]))
        }
        l=l.reverse()
        return l
    }

    def createreadingitems(Topic t,GlobalUser u){
        t.globalresources.each {
            GlobalResource re=GlobalResource.findById(it.id)
            ReadingItem r = new ReadingItem(user: u, resource: re, isRead: false)
            r.save(flush: true)
            re.addToDresources(r)
            u.addToReadingitems(r)
        }
    }

    def deletereadingitems(Topic t,GlobalUser u){
        t.globalresources.each{
            GlobalResource re=GlobalResource.get(it.id)
            ReadingItem r=ReadingItem.findByGlobalUserAndGlobalResource(u,re);
            u.removeFromReadingitems(r)
            re.removeFrom(r)
            r.delete(flush:true)
        }
    }
}
