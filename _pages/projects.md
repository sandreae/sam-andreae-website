---
layout: projects
title: Projects
permalink: /projects/
---

<span class="compositions">
{% for post in site.categories.composition %}
	<div class="composition">
		<table>

			<tr>
				<td>
					<a href="{{post.link}}">{{ post.title }}</a><br>
					<time>{{ post.date | date: "%b %-d, %Y" }}</time><br>
					{{post.description}}<br>
					{% if post.with %} with <i>{{ post.with}}</i><br>{% endif %}
				</td>
			</tr>
		</table>
	</div>
{% endfor %}
</span>