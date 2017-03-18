# Ambari Size Checker

## Results
```bash
ls -lh ambari-server-*
-rw-r--r--  1 risdenk  staff    39M Jul 15  2014 ambari-server-1.6.1-98.noarch.rpm
-rw-r--r--  1 risdenk  staff    96M Nov 24  2014 ambari-server-1.7.0-169.noarch.rpm
-rw-r--r--  1 risdenk  staff    82M Apr 13 12:30 ambari-server-2.0.0-151.noarch.rpm
-rw-r--r--  1 risdenk  staff    86M May 22 08:20 ambari-server-2.0.1-45.noarch.rpm
-rw-r--r--  1 risdenk  staff   326M Jul 20 11:53 ambari-server-2.1.0-1470.x86_64.rpm
```

From what you can see there are some significant jumps from 1.6.1 to 1.7.0 and 2.0.1 to 2.1.0. I dug a little further and found what was causing the significant change.

I ran the following command on each RPM:

```bash
rpm -qp --queryformat '[%{FILESIZES} %{FILENAMES}\n]' ambari-server-VERSION.noarch.rpm | sort -n -r | head -n 100 > ~/Downloads/ambari-VERSION-size.txt
```

Outlined below are the top 5 files from each RPM based on size in bytes (largest to smallest):
### Ambari 1.6.1
```bash
8352140 /usr/lib/ambari-server/eclipselink-2.4.0.jar
5921635 /usr/lib/ambari-server/web/javascripts/app.js.map
4705860 /usr/lib/ambari-server/ambari-server-1.6.1.98.jar
2703892 /usr/lib/ambari-server/derby-10.9.1.0.jar
2334911 /usr/lib/ambari-server/web/javascripts/vendor.js.map
```

### Ambari 1.7.0
```bash
56684640 /var/lib/ambari-server/resources/views/slider-0.0.1-SNAPSHOT.jar
8352140 /usr/lib/ambari-server/eclipselink-2.4.0.jar
6511968 /usr/lib/ambari-server/web/javascripts/app.js.map
5571293 /usr/lib/ambari-server/ambari-server-1.7.0.169.jar
2703892 /usr/lib/ambari-server/derby-10.9.1.0.jar
```

### Ambari 2.0.0
```bash
40828524 /var/lib/ambari-server/resources/views/slider-0.0.1-SNAPSHOT.jar
8632395 /usr/lib/ambari-server/eclipselink-2.5.2.jar
7176626 /usr/lib/ambari-server/ambari-server-2.0.0.151.jar
2703892 /usr/lib/ambari-server/derby-10.9.1.0.jar
2189117 /usr/lib/ambari-server/guava-14.0.1.jar
```

### Ambari 2.0.1
```bash
40828522 /var/lib/ambari-server/resources/views/slider-0.0.1-SNAPSHOT.jar
8632395 /usr/lib/ambari-server/eclipselink-2.5.2.jar
7213760 /usr/lib/ambari-server/ambari-server-2.0.1.45.jar
2703892 /usr/lib/ambari-server/derby-10.9.1.0.jar
2189117 /usr/lib/ambari-server/guava-14.0.1.jar
```

### Ambari 2.1.0
```bash
93233165 /var/lib/ambari-server/resources/views/hive-2.1.0.1470.jar
49823169 /var/lib/ambari-server/resources/views/slider-2.1.0.1470.jar
43147094 /var/lib/ambari-server/resources/views/capacity-scheduler-2.1.0.1470.jar
35982268 /var/lib/ambari-server/resources/views/files-2.1.0.1470.jar
34319034 /var/lib/ambari-server/resources/views/pig-2.1.0.1470.jar
```

### Conclusion
As you can see, the change from 1.6.1 to 1.7.0 was because of the addition of views and the Slider view jar at around 57 mb. This accounts for the change completely. From 1.7.0 to 2.0.0 there is a decrease also full accounted for by the decrease the the Slider view jar. The biggest increase is from 2.0.1 to 2.1.0 where the top 5 files are all views for Ambari and it accounts for a change of about 244 mb. As more views get added to Ambari, this could be a big change.

