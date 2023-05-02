<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Relationship Menu</title>
      <link rel="stylesheet" href="{{ url_for('static', filename='fonts/nunito_sans/stylesheet.css') }}" />
      <link href="https://cdn.jsdelivr.net/npm/@mdi/font@7.2.96/css/materialdesignicons.min.css" rel="stylesheet" />
      <link rel="stylesheet" href="{{ url_for('static', filename='css/style.css') }}" />
   </head>
   <body>
      {% include 'modal.tpl' %} {% include 'menu_bar.tpl' %}
      <div class="wrapper">
         <div class="content">
            {% if current_site == "menu" %} 
               {% include 'menu_content.tpl' %} 
            {% elif current_site == "versions" %} 
               {% include 'available_versions.tpl' %} 
            {% endif %}
         </div>
         {% include 'footer.tpl' %}
      </div>
      <script type="text/javascript" src="{{ url_for('static', filename='js/modal.js') }}" ></script>
   </body>
</html>