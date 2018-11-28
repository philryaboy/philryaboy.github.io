---
layout: default
slug: news
---

<div class="row">
 <div class="col-md-12" markdown="1">

<div class="col-md-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">News</h3>
      </div>
      <ul class="list-group">
        {% for post in site.posts %}
        <li class="list-group-item">
          <h5 class="list-group-item-heading">{{ post.date | date: "%B %-d, %Y" }}</h5>
          <p class="list-group-item-text">{{ post.title }}</p>
        </li>
        {% endfor %}
      </ul>

  </div>
  </div>
  </div>
  </div>