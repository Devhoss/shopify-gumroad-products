#!/usr/bin/env bash
set -e

# Template with placeholder for SECTION_NAME
read -r -d '' TEMPLATE <<'EOT'
{% comment %}
  Section: {{ SECTION_NAME }}
{% endcomment %}

<div class="beauty-section" id="section-{{ section.id }}">
  <div class="page-width">
    {% if section.settings.heading != blank %}
      <h2>{{ section.settings.heading }}</h2>
    {% endif %}
    {% if section.settings.text != blank %}
      <p>{{ section.settings.text }}</p>
    {% endif %}

    <div class="beauty-grid">
      {% for block in section.blocks %}
        <div class="beauty-card" {{ block.shopify_attributes }}>
          {% if block.settings.image != blank %}
            <img src="{{ block.settings.image | image_url: width: 600 }}"
                 alt="{{ block.settings.title | escape }}"
                 loading="lazy">
          {% endif %}
          {% if block.settings.title != blank %}
            <h3>{{ block.settings.title }}</h3>
          {% endif %}
          {% if block.settings.description != blank %}
            <p>{{ block.settings.description }}</p>
          {% endif %}
          {% if block.settings.link != blank and block.settings.button_text != blank %}
            <a href="{{ block.settings.link }}" class="button">
              {{ block.settings.button_text }}
            </a>
          {% endif %}
        </div>
      {% endfor %}
    </div>
  </div>
</div>

{% schema %}
{
  "name": "{{ SECTION_NAME }}",
  "settings": [
    {
      "type": "text",
      "id": "heading",
      "label": "Heading",
      "default": "Luxury Beauty Collection"
    },
    {
      "type": "textarea",
      "id": "text",
      "label": "Text",
      "default": "Showcase your premium products with elegance."
    },
    {
      "type": "color",
      "id": "background",
      "label": "Background color",
      "default": "#ffffff"
    }
  ],
  "blocks": [
    {
      "type": "card",
      "name": "Card",
      "settings": [
        { "type": "image_picker", "id": "image", "label": "Image" },
        { "type": "text", "id": "title", "label": "Title", "default": "Premium Item" },
        { "type": "textarea", "id": "description", "label": "Description", "default": "Short description here." },
        { "type": "url", "id": "link", "label": "Button link", "default": "" },
        { "type": "text", "id": "button_text", "label": "Button text", "default": "Shop now" }
      ]
    }
  ],
  "max_blocks": 8,
  "presets": [
    {
      "name": "{{ SECTION_NAME }}",
      "blocks": [
        { "type": "card" },
        { "type": "card" },
        { "type": "card" }
      ]
    }
  ]
}
{% endschema %}
EOT

# Ensure required directories exist
mkdir -p assets snippets
# Placeholder asset and snippet
cat > assets/style.css <<'EOF'
/* Placeholder CSS */
