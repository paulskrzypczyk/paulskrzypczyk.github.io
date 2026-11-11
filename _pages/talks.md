---
layout: page
permalink: /talks/
title: Talks
description: Recordings and slides from seminars and conference talks.
nav: true
nav_order: 2
---

{% assign yt = site.data.talks_config %}

<h2 class="section-heading">Recordings</h2>

<p>Recorded talks given by me or my collaborators about our research, collected in a <a href="{{ yt.playlist_url }}">YouTube playlist</a>, which updates automatically.</p>

<div class="video-embed">
  <iframe src="https://www.youtube-nocookie.com/embed/videoseries?list={{ yt.playlist_id }}" title="Talks playlist on YouTube" loading="lazy" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<h2 class="section-heading">Slides</h2>

<p>Slides from selected talks. All slides are also collected on <a href="https://github.com/paulskrzypczyk/Talks">GitHub</a>.</p>

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
        {% if talk.slides %}<a class="btn-link" href="{{ talk.slides }}"><i class="fa-solid fa-file-pdf"></i> Slides</a>{% endif %}
        {% if talk.video %}<a class="btn-link" href="{{ talk.video }}"><i class="fa-brands fa-youtube"></i> Video</a>{% endif %}
      </span>
    </div>
  </li>
{% endfor %}
</ul>
