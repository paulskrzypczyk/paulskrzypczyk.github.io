---
layout: page
permalink: /cv/
title: CV
description: Curriculum vitae
nav: true
nav_order: 5
---

{% assign cv = site.data.cv %}

{% if cv.pdf and cv.pdf != "" %}
<p class="entry-links"><a class="btn-link" href="{{ cv.pdf | relative_url }}"><i class="fa-solid fa-file-pdf"></i> Download PDF</a></p>
{% endif %}

<div class="cv">
{% for s in cv.sections %}
  <h2 class="section-heading">{{ s.heading }}</h2>
  {% if s.text %}<div class="cv-text">{{ s.text | markdownify }}</div>{% endif %}
  {% if s.entries %}
  <table class="cv-table">
    {% for e in s.entries %}
    <tr>
      <td class="cv-date">{{ e.date }}</td>
      <td class="cv-body">
        <span class="cv-title">{{ e.title }}</span>{% if e.detail and e.detail != "" %}<span class="cv-sep">, </span>{{ e.detail }}{% endif %}
        {% if e.note and e.note != "" %}<div class="cv-note">{{ e.note }}</div>{% endif %}
      </td>
    </tr>
    {% endfor %}
  </table>
  {% endif %}
  {% if s.footer %}<div class="cv-text">{{ s.footer | markdownify }}</div>{% endif %}
{% endfor %}
</div>
