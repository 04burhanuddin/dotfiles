# Unicode Icons in Ranger File Manager
#
# How to install?
# https://gist.github.com/marcbelmont/c12d2fd2519a372d3b347f665b37e74a#gistcomment-3240106

from __future__ import absolute_import, division, print_function

from itertools import repeat

import ranger.api
from ranger.core.linemode import LinemodeBase

# https://unicode.org/emoji/charts/full-emoji-list.html
EXTENSIONS = {}
for extensions, icon in [
        ('py pyc', ''),
        ('yml ini conf', ''),
        ('html', ''),
        ('md', '󰽛'),
        ('css', ''),
        ('lockb', '󰌾'),
        ('js', ''),
        ('json', '󰘦'),
        ('pdf', ''),
        ('dart', ''),
        ('java', ''),
        ('shell sh', ''),
]:
    EXTENSIONS.update(dict(zip(extensions.split(), repeat(icon))))


# https://github.com/ranger/ranger/blob/081e73152a9391211770fab56676d7d974413ae6/ranger/container/fsobject.py
@ranger.api.register_linemode
class MyLinemode(LinemodeBase):
    name = "unicode_icons"

    def filetitle(self, fobj, metadata):
        if fobj.is_directory:
            icon = ''
        elif fobj.extension in EXTENSIONS:
            icon = EXTENSIONS[fobj.extension]
        elif fobj.is_link:
            icon = '󰌷'
        elif fobj.audio:
            icon = '󰸪'
        elif fobj.container:
            icon = ''
        elif fobj.document:
            icon = '󰧮'
        elif fobj.image:
            icon = '󰈟'
        elif fobj.video:
            icon = ''
        elif 'Dockerfile' in fobj.relative_path:
            icon = ''
        else:
            icon = ''
        return (icon + ' ' if icon else '') + fobj.relative_path

    def infostring(self, fobj, metadata):
        raise NotImplementedError
