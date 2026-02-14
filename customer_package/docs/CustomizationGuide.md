# Customization Guide

## Overview
- **Color palette** – Uses navy `#0A0A2A`, gold `#D4AF37`, cream `#F9F9F9`. Defined in `shared/colors.json` and referenced via CSS variables.
- **Typography** – Headings use *Playfair Display*; body text uses *Roboto*. Font files are loaded via `shared/fonts.css`.
- **Components** – Reusable button component lives in `shared/components/button.html`. Icons are in `shared/icons/`.

## How to Change
1. **Edit `shared/colors.json`** – modify the hex values to your brand colors.
2. **Edit `shared/fonts.css`** – replace `@font-face` URLs or change the font‑family declarations.
3. **Update a section’s schema** – each section includes colour pickers for background gradients, title colour, text colour, etc. Adjust defaults or expose new settings.
4. **Add custom CSS** – create or edit `shared/css/dawn-luxury.css` and reference it in `theme.liquid`:
   ```liquid
   {{ 'dawn-luxury.css' | asset_url | stylesheet_tag }}
   ```
5. **Optional JS** – enable `assets/js/dawn-animations.js` for scroll animations.

## Example: Change the primary gold colour
```json
{
  "primaryGold": "#C5A02E"
}
```
Then in any CSS file:
```css
--color-primary-gold: {{ settings.primaryGold }};
```

## Testing
- Use the Shopify theme preview to verify changes.
- Run `tools/verify-theme.sh products/dawn-sections-pack-beauty` to catch missing assets.

---
*Keep this guide updated as you add new sections or assets.*