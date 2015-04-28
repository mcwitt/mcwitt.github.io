try:
    from urllib.parse import quote  # Py 3
except ImportError:
    from urllib2 import quote  # Py 2
import os
import sys

c = get_config()
c.NbConvertApp.export_format = 'markdown'
c.MarkdownExporter.template_file = 'jekyll-post'
c.Exporter.file_extension = '.md'

def path2url(path):
    """Turn a file path into a URL"""
    parts = path.split(os.path.sep)
    return '{{ site.baseurl }}/notebooks/' + '/'.join(quote(part) for part in parts)

c.MarkdownExporter.filters = {'path2url': path2url}

