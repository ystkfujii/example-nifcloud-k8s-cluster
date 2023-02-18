PASSWD ?= hoge

generate-sshkey:
	mkdir -p -m 700 out
	echo $(PASSWD)
	ssh-keygen -t rsa -f ./out/key -N $(PASSWD)
