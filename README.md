### STEPS

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
If you import or dump large data, you can use screen
```
$ apt install screen -y
$ screen -S <screen_name>

>> Execute the commands here <<

$ CTRL + A + D
$ screen -ls
$ screen -r <screen_name>
```