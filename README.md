# galera-cluster-docker

* Simple Galera cluster with 3 nodes using docker for your local environment.
* IP address and subnet is predefined in the `up.sh`. If it doesn't work for you, you can change to a different subnet and IP.
* Data is persisted on each directory. You can add new node by duplicating the directory and update the IP list in `db.cnf`.
* Port Mapping `13306, 23306, 33306` for feach of the respective nodes `db01, db02, db03`

# How to use
* Make sure docker service is running
  
```bash
bash up.sh
```

# How to connect from your host

```bash
➜  mysql -uroot -h127.0.0.1 -P13306
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 5.5.5-10.6.15-MariaDB-1:10.6.15+maria~ubu2004-log mariadb.org binary distribution

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql> SHOW STATUS LIKE 'wsrep_cluster%';
+----------------------------+--------------------------------------+
| Variable_name              | Value                                |
+----------------------------+--------------------------------------+
| wsrep_cluster_weight       | 3                                    |
| wsrep_cluster_capabilities |                                      |
| wsrep_cluster_conf_id      | 5                                    |
| wsrep_cluster_size         | 3                                    |
| wsrep_cluster_state_uuid   | 79bfb743-c6fd-11ee-8b58-63417100cdde |
| wsrep_cluster_status       | Primary                              |
+----------------------------+--------------------------------------+
6 rows in set (0.00 sec)
```


