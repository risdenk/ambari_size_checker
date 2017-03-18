# Ambari Size Checker

## Results
```bash
39M  ambari-server-1.6.1-98.noarch.rpm
96M  ambari-server-1.7.0-169.noarch.rpm
82M  ambari-server-2.0.0-151.noarch.rpm
86M  ambari-server-2.0.1-45.noarch.rpm
59M  ambari-server-2.0.2-25.noarch.rpm
326M ambari-server-2.1.0-1470.x86_64.rpm
326M ambari-server-2.1.1-236.x86_64.rpm
376M ambari-server-2.1.2-377.x86_64.rpm
385M ambari-server-2.1.2.1-418.x86_64.rpm
406M ambari-server-2.2.0.0-1310.x86_64.rpm
409M ambari-server-2.2.1.0-161.x86_64.rpm
409M ambari-server-2.2.1.1-70.x86_64.rpm
409M ambari-server-2.2.2.0-460.x86_64.rpm
646M ambari-server-2.4.0.0-1226.x86_64.rpm
646M ambari-server-2.4.0.1-1.x86_64.rpm
646M ambari-server-2.4.1.0-22.x86_64.rpm
645M ambari-server-2.4.2.0-136.x86_64.rpm
```

From what you can see there are some significant jumps from 1.6.1 to 1.7.0 and 2.0.1 to 2.1.0. I dug a little further and found what was causing the significant change.

I ran the following command on each RPM:

```bash
rpm -qp --queryformat '[%{FILESIZES} %{FILENAMES}\n]' ambari-server-${VERSION}*.rpm | sort -n -r | head -n 5
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

### Ambari 2.0.2
```bash
40828525 /var/lib/ambari-server/resources/views/slider-0.0.1-SNAPSHOT.jar
8632395 /usr/lib/ambari-server/eclipselink-2.5.2.jar
7215180 /usr/lib/ambari-server/ambari-server-2.0.2.25.jar
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

### Ambari 2.1.1
```bash
93233842 /var/lib/ambari-server/resources/views/hive-2.1.1.236.jar
49809926 /var/lib/ambari-server/resources/views/slider-2.1.1.236.jar
43147127 /var/lib/ambari-server/resources/views/capacity-scheduler-2.1.1.236.jar
35982300 /var/lib/ambari-server/resources/views/files-2.1.1.236.jar
34321074 /var/lib/ambari-server/resources/views/pig-2.1.1.236.jar
```

### Ambari 2.1.2
```bash
95389542 /var/lib/ambari-server/resources/views/hive-2.1.2.377.jar
49772165 /var/lib/ambari-server/resources/views/slider-2.1.2.377.jar
45174986 /var/lib/ambari-server/resources/views/tez-view-2.1.2.377.jar
43151182 /var/lib/ambari-server/resources/views/capacity-scheduler-2.1.2.377.jar
35985903 /var/lib/ambari-server/resources/views/files-2.1.2.377.jar
```

### Ambari 2.1.2.1
```bash
97186807 /var/lib/ambari-server/resources/views/hive-2.1.2.1.418.jar
50893103 /var/lib/ambari-server/resources/views/slider-2.1.2.1.418.jar
46548951 /var/lib/ambari-server/resources/views/tez-view-2.1.2.1.418.jar
44451068 /var/lib/ambari-server/resources/views/capacity-scheduler-2.1.2.1.418.jar
37285681 /var/lib/ambari-server/resources/views/files-2.1.2.1.418.jar
```

### Ambari 2.2.0.0
```bash
98653006 /var/lib/ambari-server/resources/views/hive-2.2.0.0.1310.jar
52077785 /var/lib/ambari-server/resources/views/slider-2.2.0.0.1310.jar
47823825 /var/lib/ambari-server/resources/views/tez-view-2.2.0.0.1310.jar
46909320 /var/lib/ambari-server/resources/views/pig-2.2.0.0.1310.jar
45378262 /var/lib/ambari-server/resources/views/capacity-scheduler-2.2.0.0.1310.jar
```

### Ambari 2.2.1.0
```bash
98657707 /var/lib/ambari-server/resources/views/hive-2.2.1.0.161.jar
52239902 /var/lib/ambari-server/resources/views/slider-2.2.1.0.161.jar
48025481 /var/lib/ambari-server/resources/views/tez-view-2.2.1.0.161.jar
46910268 /var/lib/ambari-server/resources/views/pig-2.2.1.0.161.jar
45378971 /var/lib/ambari-server/resources/views/capacity-scheduler-2.2.1.0.161.jar
```

### Ambari 2.2.1.1
```bash
98657758 /var/lib/ambari-server/resources/views/hive-2.2.1.1.70.jar
52239943 /var/lib/ambari-server/resources/views/slider-2.2.1.1.70.jar
48025881 /var/lib/ambari-server/resources/views/tez-view-2.2.1.1.70.jar
46910317 /var/lib/ambari-server/resources/views/pig-2.2.1.1.70.jar
45379017 /var/lib/ambari-server/resources/views/capacity-scheduler-2.2.1.1.70.jar
```

### Ambari 2.2.2.0
```bash
98730855 /var/lib/ambari-server/resources/views/hive-2.2.2.0.460.jar
52277589 /var/lib/ambari-server/resources/views/slider-2.2.2.0.460.jar
48060014 /var/lib/ambari-server/resources/views/tez-view-2.2.2.0.460.jar
46944872 /var/lib/ambari-server/resources/views/pig-2.2.2.0.460.jar
45414020 /var/lib/ambari-server/resources/views/capacity-scheduler-2.2.2.0.460.jar
```

### Ambari 2.4.0.0
```bash
126641271 /var/lib/ambari-server/resources/views/hive-jdbc-2.4.0.0.1226.jar
99518844 /var/lib/ambari-server/resources/views/hive-2.4.0.0.1226.jar
53071006 /var/lib/ambari-server/resources/views/slider-2.4.0.0.1226.jar
49835833 /var/lib/ambari-server/resources/views/tez-view-2.4.0.0.1226.jar
49250950 /var/lib/ambari-server/resources/views/wfmanager-2.4.0.0.1226.jar
```

### Ambari 2.4.0.1
```bash
126641271 /var/lib/ambari-server/resources/views/hive-jdbc-2.4.0.1.1.jar
99518847 /var/lib/ambari-server/resources/views/hive-2.4.0.1.1.jar
53071022 /var/lib/ambari-server/resources/views/slider-2.4.0.1.1.jar
49835854 /var/lib/ambari-server/resources/views/tez-view-2.4.0.1.1.jar
49250942 /var/lib/ambari-server/resources/views/wfmanager-2.4.0.1.1.jar
```

### Ambari 2.4.1.0
```bash
126641534 /var/lib/ambari-server/resources/views/hive-jdbc-2.4.1.0.22.jar
99518850 /var/lib/ambari-server/resources/views/hive-2.4.1.0.22.jar
53072937 /var/lib/ambari-server/resources/views/slider-2.4.1.0.22.jar
49835858 /var/lib/ambari-server/resources/views/tez-view-2.4.1.0.22.jar
49260569 /var/lib/ambari-server/resources/views/wfmanager-2.4.1.0.22.jar
```

### Ambari 2.4.2.0
```bash
126263402 /var/lib/ambari-server/resources/views/hive-jdbc-2.4.2.0.136.jar
99130091 /var/lib/ambari-server/resources/views/hive-2.4.2.0.136.jar
52636981 /var/lib/ambari-server/resources/views/slider-2.4.2.0.136.jar
49399762 /var/lib/ambari-server/resources/views/tez-view-2.4.2.0.136.jar
48888595 /var/lib/ambari-server/resources/views/wfmanager-2.4.2.0.136.jar
```

### Conclusion
As you can see, the change from 1.6.1 to 1.7.0 was because of the addition of views and the Slider view jar at around 57 mb. This accounts for the change completely. From 1.7.0 to 2.0.0 there is a decrease also full accounted for by the decrease the the Slider view jar. The biggest increase is from 2.0.1 to 2.1.0 where the top 5 files are all views for Ambari and it accounts for a change of about 244 mb. As more views get added to Ambari, this could be a big change.

