### STEPS

- Create dir
```
mkdir -p /var/lib/mysql/mysqldump
```

- Go to dir and clone
```
cd /var/lib/mysql/mysqldump
git clone https://github.com/rendyproklamanta/docker-mysqldump-restore.git .
```

- Open and edit environments
```
nano env.sh
```

- Using mysqldump
```
chmod +x mysqldump.sh && ./mysqldump.sh
```

- Using mysql import/restore
```
chmod +x import.sh && ./import.sh
```

### NOTE
- mysqldump : output will be in current directory "."

- import : before import create database <dbname_dbs> in PMA and copy your database <dbname_dbs>.sql.gz to /var/lib/mysql/mysqldump

- If you import or dump large data, you can use screen
```
$ apt install screen -y
$ screen -S <screen_name>

>> Execute the commands here <<

$ CTRL + A + D
$ screen -ls
$ screen -r <screen_name>
```