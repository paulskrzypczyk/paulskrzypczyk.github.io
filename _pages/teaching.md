---
layout: page
permalink: /teaching/
title: Teaching
description: Lecture notes, my textbook on semidefinite programming, and slides from talks.
nav: true
nav_order: 3
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

<h2 class="section-heading">Talks</h2>

<p>Slides from selected seminars and conference talks. All slides are also collected on <a href="https://github.com/paulskrzypczyk/Talks">GitHub</a>.</p>

<ul class="talk-list">
{% for talk in site.data.talks %}
  <li>
    <span class="talk-year">{{ talk.year }}</span>
    <div class="talk-body">
      <span class="talk-title">{{ talk.title }}</span>
      <span class="talk-event">{{ talk.event | markdownify | remove: '<p>' | remove: '</p>' | strip }}</span>
      {% if talk.papers %}<span class="talk-papers">Based on:
        {% for p in talk.papers %}<a href="{{ p.url }}"><i>{{ p.title }}</i></a>{% unless forloop.last %}; {% endunless %}{% endfor %}
      </span>{% endif %}
      <span class="entry-links">
        <a class="btn-link" href="{{ talk.slides }}"><i class="fa-solid fa-file-pdf"></i> Slides</a>
        {% if talk.video %}<a class="btn-link" href="{{ talk.video }}"><i class="fa-brands fa-youtube"></i> Video</a>{% endif %}
      </span>
    </div>
  </li>
{% endfor %}
</ul>
