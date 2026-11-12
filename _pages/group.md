---
layout: page
permalink: /group/
title: Group
description: Current and former PhD students, postdocs and visitors.
nav: true
nav_order: 1
---

{% for s in site.data.group %}
{% if s.members and s.members.size > 0 %}
{% assign current = s.members | where: "current", true %}
{% assign former = s.members | where_exp: "m", "m.current != true" %}

<h2 class="section-heading">{{ s.section }}</h2>

{% if current.size > 0 %}
{% if former.size > 0 %}<h3 class="sub-heading">Current</h3>{% endif %}
<ul class="people-list">
{% for m in current %}{% include person.html m=m %}{% endfor %}
</ul>
{% endif %}

{% if former.size > 0 %}
{% if current.size > 0 %}<h3 class="sub-heading">Former</h3>{% endif %}
<ul class="people-list">
{% for m in former %}{% include person.html m=m %}{% endfor %}
</ul>
{% endif %}

{% endif %}
{% endfor %}

<p class="group-footnote">I am always happy to hear from prospective PhD students and postdocs. Please get in touch by email.</p>
