---
layout: post
title:  Blogging in Jekyll with IPython 3
date:   2015-04-29 00:00:00
comments: true
---

I've found the IPython notebook to be an extremely useful tool in my day to day
work. Combined with 
[pandas](http://pandas.pydata.org)
and
[matplotlib](http://matplotlib.org/)
it's an awesome tool for analyzing data, and, just as importantly, sharing
results in a way that is both beautiful and self-documenting.

Recently I've been interested in publishing some of my IPython tinkering on my
Jekyll blog. Jekyll blog posts are typically written in Markdown, but I found
that IPython's built-in Markdown conversion, using

{% highlight bash %}
ipython nbconvert --to markdown notebook.ipynb
{% endhighlight %}

left a lot of manual work to be done to create a nice-looking post.  In order
to have Jekyll process the resulting file, I had to insert the necessary Jekyll
front-matter at the top of the Markdown by hand. But even then some crucial
things were missing, like syntax highlighting, execution counts in cells, and a
way to automatically generate URLs for the image resources.

After a bit of searching I found a solution in
[adamj's post](http://adamj.eu/tech/2014/09/21/using-ipython-notebook-to-write-jekyll-blog-posts/),
which involves writing a Python script that parses the JSON from a notebook
file and outputs Markdown directly. While this is a flexible solution, I
preferred
[Christop Corley's approach](http://cscorley.github.io/2014/02/21/blogging-with-ipython-and-jekyll/),
which is to essentially use the existing infrastructure of nbconvert and just
create a template file, enabling something like

{% highlight bash %}
ipython nbconvert --to jekyll-post notebook.ipynb
{% endhighlight %}

Christop's template file is broken by IPython 3.x, but it's a relatively easy
fix. The problem is that the names of several cell properties have changed, but
since we only need to modify a few parts of the Markdown template that ships
with IPython, it's easier to let our template inherit from `markdown.tpl`.

Below are my modified versions of Christop's files.

To enable `--to jekyll-post` we just add the following template file in the
current directory (or anywhere in nbconvert's search path):

{% gist eaec84a6b50ad5ac9fb2 jekyll-post.tpl %}

This modifies nbconvert's standard Markdown template to include a header with
the Jekyll front-matter, include execution counts in each cell, and use
Jekyll's syntax highlighting for Python cells.

The last thing that I was missing was automatic generation of URLs for the
images, which in a Jekyll environment are generally not in the same folder as
the post as nbconvert assumes. This is solved with the following nbconvert
config script (adapted from Christop's, here I've only removed some
environment-specific paths and simplified for my usage):

{% gist eaec84a6b50ad5ac9fb2 jekyll-post.py %}

Here we're assuming that notebook files are kept in the folder `/notebooks`
under the site's base URL. Now we can simply run, for example

{% highlight bash %}
ipython nbconvert --config jekyll-post notebook.ipynb
mv notebook.md ../_drafts # or ../_posts, if we're feeling lucky
{% endhighlight %}

and that's it! The generated Markdown has the necessary front-matter and the
Jekyll-generated post is syntax-highlighted, has execution counts, and
correctly links to the images. Examples coming soon!

