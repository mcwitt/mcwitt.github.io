{% extends 'markdown.tpl' %}

{%- block header -%}
---
layout: post
title: "{{resources['metadata']['name'].replace('_',' ')}}"
tags:
    - python
    - notebook
comments: true
---
{%- endblock header -%}

{% block in_prompt %}
<div class="input_prompt">
In [{{ cell.execution_count }}]:
</div>
{% endblock in_prompt %}

{% block input %}
<div class="input_area">
{{ '{% highlight python %}' }}
{{ cell.source }}
{{ '{% endhighlight %}' }}
</div>
{% endblock input %}

{% block output_prompt %}
<div class="output_prompt">
Out [{{ cell.execution_count }}]:
</div>
{% endblock output_prompt %}

{% block data_png %}
<img class='img-output' src='{{ output.metadata.filenames['image/png'] | path2url }}' alt='png'>
{% endblock data_png %}
