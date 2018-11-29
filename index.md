---
layout: default
slug: call
---
<div class = "row">
 <div class="col-md-11" markdown="1">

# Model Based Systems Engineering 
## The competence field „Model-based Systems Engineering“ works intensively on the topic of software & systems engineering and with the objective of enabling the implementation of software-intensive systems.

Especially in mobility domains, e.g. automotive, avionic, railway, and the energy sector or industry automation, systems are characterized by an increasing complexity, arising from an increasing set of functions and requirements, their interaction and integration on more performant and parallel hardware as well as their heterogeneity w.r.t. variability. The need and request for these systems to be better integrated and more adaptable than ever entails a need for better software and systems engineering approaches.

One of the design goals is to reduce costs by guaranteeing quality of such systems in early phases. These activities, namely “frontloading” activities, can be applied by a more efficient use of constructive quality assurance methods that are tightly bound to a proper tool support enabling better productivity and quality.

</div>
</div>
  <div class="row">
    <div class="col-xs-12">
      <!-- <img class="logo img-responsive" src="/assets/logos/models-logo.png" alt="models2018-logo" /> -->
     <!-- <div class="flexslider">
      <ul class="slides" style="min-width: 6000px;">
        <li>
          <img src="/assets/copenhagen-pictures/opera-resized.jpg" /> 
        </li>
        
        <li>
          <img src="/assets/copenhagen-pictures/nyhavn3-resized.jpg" />
        </li>
        <li>
          <img src="/assets/copenhagen-pictures/tivoli-resized.jpg" />
        </li>
        <li>
          <img src="/assets/copenhagen-pictures/itu-outside-resized.jpg" />
        </li>
        
      </ul>
    </div> -->
    </div>
  </div>


<div class="row">

 <div class="col-md-8" markdown="1">


## Some other information can be here. 

One of the design goals is to reduce costs by guaranteeing quality of such systems in early phases. These activities, namely “frontloading” activities, can be applied by a more efficient use of constructive quality assurance methods that are tightly bound to a proper tool support enabling better productivity and quality.

## About
<p class="text-justify">

A few words about us 

</p>

</div>

<div class="col-md-4">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">News</h3>
      </div>
      <ul class="list-group">
        {% for post in site.posts limit:4 %}
        <li class="list-group-item">
          <h5 class="list-group-item-heading">{{ post.date | date: "%B %-d, %Y" }}</h5>
          <p class="list-group-item-text">{{ post.title }}</p>
        </li>
        {% endfor %}
        <div class="panel-footer text-left">
        <a href="/news">More News</a>
        </div>
      </ul>

  </div>
  <a class="twitter-timeline" data-lang="en" data-width="400" data-height="400" href="https://twitter.com/mbse">Tweets by ... </a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
 </div>
</div>


