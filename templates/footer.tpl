{% if current_site == "menu" %}
<div class="footer">
   Relationship Menu of {{people}} (v{{document_version}}).<br />
   Older versions of this document can be found
   <a href="{{ url_for('list_versions') }}">here</a>. <br />
   Last updated on {{last_update}}.
</div>
{% endif %}