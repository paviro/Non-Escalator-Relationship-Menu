{% for category in relationship_menu %}
<div class="category">
   <div class="title">{{category["name"]}}</div>
   {% for item in category["items"] %}
   <div class="item item-{{item['icon']|default('not-set', true)}}">
      <div class="item-name">
         <span>{{item["name"]}}</span>
      </div>
      {% if item["note"] is not none %}
      <div class="item-note">{{item["note"]}}</div>
      {% endif %}
   </div>
   {% endfor %}
</div>
{% endfor %}