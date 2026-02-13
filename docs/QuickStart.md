# Quick Start Guide

1. **Download** the zip from the GitHub Releases page (or run the build script).
2. **Extract** the archive. You will see the following structure:
   - `sections/` – all 25 Liquid sections.
   - `snippets/` – shared snippets (buttons, icons).
   - `assets/` – CSS/JS assets.
3. **Copy** the folders into your Dawn theme directory:
   ```bash
   cp -R sections/ <your‑theme>/sections/
   cp -R snippets/ <your‑theme>/snippets/
   cp -R assets/ <your‑theme>/assets/
   ```
4. **Open** the Shopify admin → **Online Store → Themes → Customize**.
5. Click **Add section**, select any of the new sections (e.g., *Perfume Fragrance Oil*), and configure the settings via the schema.
6. **Save** and **publish**.

### Optional: Enable optional JS animations
If you want the animated scroll effects, enable `assets/dawn-animations.js` in your theme’s `theme.liquid`:

```liquid
{{ 'dawn-animations.js' | asset_url | script_tag }}
```

That’s it – your store now has a premium, performance‑first beauty theme extension.