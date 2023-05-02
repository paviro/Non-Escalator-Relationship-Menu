{% for version in versions %}
<div class="category versions">
   <div class="title">Version {{version}}</div>
   <div class="item">
      <div class="item-name">Information about this Relationship Menu</div>
      <div class="item-note">
         Menu by: {{databases[version]["people"]|join(", ")}} <br />
         Last updated: {{databases[version]["last_update"]}}
      </div>
   </div>
   <div class="item">
      <div class="item-name">Technical notes</div>
      <div class="item-note">
         Menu Version: v{{databases[version]["document_version"]}} <br />
         Schema Version: v{{databases[version]["schema_version"]}}
      </div>
   </div>
   <br />
   <div class="item">
      <div class="item-name">
         <a href="{{ url_for('relationship_menu', version=version) }}">Open menu</a>
      </div>
   </div>
   <br />
</div>
{% endfor %}