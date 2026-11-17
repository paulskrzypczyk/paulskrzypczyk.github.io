---
layout: page
permalink: /teaching/
title: Teaching
description: Lecture notes, my textbook on semidefinite programming, and some writing on teaching.
nav: true
nav_order: 4
---

{% assign t = site.data.teaching %}

<h2 class="section-heading">Lecture notes</h2>

<div class="entry-list">
{% for c in t.courses %}
  <div class="entry">
    <div class="entry-head">
      <h3 class="entry-title">{{ c.title }}</h3>
      {% if c.status == "current" %}<span class="badge-tag current">Current</span>{% else %}<span class="badge-tag">Archived</span>{% endif %}
    </div>
    <p class="entry-meta">{% if c.unit %}{{ c.unit }} · {% endif %}{{ c.institution }} · {{ c.years }}</p>
    {% if c.description %}<p>{{ c.description }}</p>{% endif %}
    {% if c.links %}
    <p class="entry-links">
      {% for l in c.links %}<a class="btn-link" href="{{ l.url }}">{{ l.name }} <i class="fa-solid fa-arrow-up-right-from-square fa-xs"></i></a>{% endfor %}
    </p>
    {% endif %}
  </div>
{% endfor %}
</div>

{% comment %} Writing on teaching: any blog post (in _posts/) with `tags: [teaching]` is listed here automatically. {% endcomment %}
{% assign teaching_posts = site.posts | where_exp: "p", "p.tags contains 'teaching'" %}
{% if teaching_posts.size > 0 %}
<h2 class="section-heading">On teaching</h2>

<div class="entry-list">
{% for p in teaching_posts %}
  <div class="entry">
    <h3 class="entry-title"><a href="{{ p.url | relative_url }}">{{ p.title }}</a></h3>
    <p class="entry-meta">Essay · {{ p.date | date: "%B %Y" }}</p>
    {% if p.description %}<p>{{ p.description }}</p>{% endif %}
    <p class="entry-links"><a class="btn-link" href="{{ p.url | relative_url }}">Read</a></p>
  </div>
{% endfor %}
</div>
{% endif %}

<h2 class="section-heading">Textbook</h2>

{% assign b = t.book %}
<div class="entry">
  <h3 class="entry-title"><i>{{ b.title }}</i></h3>
  <p class="entry-meta">{{ b.authors }} · {{ b.publisher }} · {{ b.year }}</p>
  <p>{{ b.description }}</p>
  <p class="entry-links">
    {% for l in b.links %}<a class="btn-link" href="{{ l.url }}">{{ l.name }} <i class="fa-solid fa-arrow-up-right-from-square fa-xs"></i></a>{% endfor %}
  </p>
</div>
