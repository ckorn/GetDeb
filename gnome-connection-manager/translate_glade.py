#!/bin/python
import gettext
import re

if __name__ == "__main__":
	gladeFile = "gnome-connection-manager.glade"
	gladeTmpFile = gladeFile + ".tmp"

	trans = gettext.translation("gcm-lang", "./lang", languages=["en"])
	trans.install(unicode=1)

	r = re.compile('(?P<a>.*<.*translatable="yes".*>)(?P<ID>.*)(?P<b></.*>.*)')
	f = open(gladeFile)
	t = open(gladeTmpFile, "w")
	for line in f.readlines():
		line = line.strip("\r\n")
		m = r.match(line)
		if not m:
			t.write(line)
		else:
			ID = m.group('ID')
			if ID != "":
				msg = _(unicode(ID, 'utf-8'))
				a = m.group('a')
				b = m.group('b')
				t.write(a+msg+b)
			else:
				t.write(line)
		t.write("\n")
	f.close()
	t.close()
