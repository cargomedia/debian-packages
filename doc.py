import os
import re
from string import Template

content = ""
for codename in sorted(os.listdir('packages')):
    content += "#### %s\n\n" % codename
    subdir1 = os.path.join('packages', codename)
    for pkg in sorted(os.listdir(subdir1)):
        try:
            content += "**%s**\n" % pkg
            subdir2 = os.path.join(subdir1, pkg)
            sep = "_"
            with open(os.path.join(subdir2, 'debian', 'changelog'), 'r') as f:
                first_line = f.readline()
                m = re.search('\((.+?)\)', first_line)
                if m:
                    version = m.group(1)
                    sep += version.split(":")[-1]  # in case of epoch versions
                    content += " - Version: %s\n" % version
            subdir3 = os.path.join(subdir2, 'pkg')
            content += " - Packages: "
            for deb in sorted(os.listdir(subdir3)):
                deb = deb.split(sep)[0]
                content += "%s, " % deb
            content = content[:-2]
            content += "\n\n"
        except:
            pass

readmein = open('README.md.in', 'r')
readmeout = open('README.md', 'w')
src = Template(readmein.read())
out = src.substitute({'packages': content})
readmeout.write(out)
