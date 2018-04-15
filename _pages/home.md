---
layout: page
title: Home
permalink: /home/
---

<div id="background-img"></div>

<div id="side-images" class="fade-out">
	{% for post in site.posts %}
		{% if post.img %}
		<a href="#" onclick='
			var allPosts = document.getElementsByClassName("single-post"); 
			console.log(allPosts)
			for(var i = 0; i < allPosts.length; i++){allPosts[i].classList.add("hidden")}; 
			document.getElementById("{{ post.title | remove: " " }}").classList.toggle("hidden")'
		target="_top">
			<img src="{{ site.baseurl }}/assets/img/{{post.img}}" class="img-side">
		</a>
		{% endif %}
	{% endfor %}
</div>

<div id="all-posts">
{% for post in site.posts %}	
	<div class="single-post hidden" id="{{ post.title | remove: " " }}">
		{% if post.img %}
			{% if post.link %}
				<a href="{{post.link}}" target="new">
					<img src="{{ site.baseurl }}/assets/img/{{post.img}}" alt="{{ post.title }}" class="img-big">
				</a><br>
			{% else %}
				<img src="{{ site.baseurl }}/assets/img/{{post.img}}" alt="{{ post.title }}" class="img-big"><br>
			{% endif %}
		{% endif %}

		<b>{{ post.title }}</b><br>
		{{ post.location | markdownify | remove: "<p>" | remove: "</p>"}}<br><time>
		{{ post.date | date: "%b %-d, %Y" }}</time><br>
		{{post.description | markdownify | remove: "<p>" | remove: "</p>"}}<br>
		{% if post.with %}
			with <i>{{post.with | markdownify | remove: "<p>" | remove: "</p>"}}</i>
		{% endif %}
		{{post.content}}
	</div>
{% endfor %}
</div>

