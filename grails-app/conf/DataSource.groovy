dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/campestre_dev?autoReconnect=true&characterEncoding=utf-8"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 1
                initialSize = 1
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                numTestsPerEvictionRun = 3
                maxWait = 10000

                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false

                validationQuery = "SELECT 1"
            }
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
        dataSource {
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/campestre?autoReconnect=true&characterEncoding=utf-8"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 1
                initialSize = 1
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                numTestsPerEvictionRun = 3
                maxWait = 10000

                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false

                validationQuery = "SELECT 1"
            }
        }
    }
}
