---
layout: calendar
title: Calendar
permalink: /calendar/
---

{% for gig in site.data.gigs %}
   | {{gig.date}} | {{ gig.group | url }} | {{gig.venue | venue}} |
{% endfor %}
