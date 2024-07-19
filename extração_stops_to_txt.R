#CRIANDO CONEXÃO COM BD GEPPI
dsn_database = "****"
dsn_hostname = "****"  
dsn_port = "****"
dsn_uid = "***"  # INSERIR O USUARIO
dsn_pwd = "***"  # INSERIR A SENHA

con <- dbConnect(RPostgres::Postgres(),
                 dbname = dsn_database,
                 host = dsn_hostname, port = 5432,
                 user = dsn_uid, password = dsn_pwd)

stops <- dbGetQuery(con, "SELECT * gtfs.stops")
stops$stop_geom<-NULL
write.table(stops,file='stops.txt',sep=',',row.names = F,na='')
