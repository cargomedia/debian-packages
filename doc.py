import os
import re
from string import Template

str = ""
for codename in os.listdir('packages'):
    str += "#### %s\n\n" % codename
    subdir1 = os.path.join('packages', codename)
    for pkg in os.listdir(subdir1):
        try:
            str += "**%s**\n" % pkg
            subdir2 = os.path.join(subdir1, pkg)
            with open(os.path.join(subdir2, 'debian', 'changelog'), 'r') as f:
                first_line = f.readline()
                m = re.search('\((.+?)\)', first_line)
                if m:
                    version = m.group(1)
                    str += " - Version: %s\n" % version
            subdir3 = os.path.join(subdir2, 'pkg')
            str += " - Packages: "
            for deb in os.listdir(subdir3):
                str += "%s, " % deb
            str += "\n\n"
        except:
            pass

readmein = open('README.md.in', 'r')
readmeout = open('README.md', 'w')
src = Template(readmein.read())
out = src.substitute({'packages': str})
readmeout.write(out)
