package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class HomeService {



    def fetchmodal(GlobalUser user){
        def trendingTopics = GlobalResource.createCriteria().list {
            projections {
                groupProperty("topics")
            }
            topics {
                eq("visibility", Topic.Visibility.PUBLIC)
            }
        }
        trendingTopics = trendingTopics.sort { a, b -> b.resources.size() <=> a.resources.size() }
        if (trendingTopics.size() > 5) {
            trendingTopics = trendingTopics.subList(0, 5)
        }
                def map = [
                user:user,
                trend:trendingTopics
          ]
        return map;
    }
    def serviceMethod() {

    }
}
