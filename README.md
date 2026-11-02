# VANCA — Browser-Based Graphic Design App

**VANCA** is a professional, modern graphic design platform built with React, TypeScript, and Canvas. It's inspired by Canva's functionality but is completely original — no Canva branding, proprietary source, or protected assets.

## 🚀 Quick Start

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Open http://localhost:5173

# Build for production
npm run build
```

## 📁 Project Structure

```
vanca/
├─ src/
│  ├─ components/     # React UI components
│  ├─ lib/            # Core libraries (render, db, elements, utils)
│  ├─ data/           # Templates, sizes, icon nodes
│  ├─ store/          # Zustand state management
│  └─ styles/         CSS files (base, editor, panels, properties,
│                      modals, responsive, aggregator)
├─ test-upload.png    # Test upload asset (5,342 bytes, 240×160)
├─ package.json
├─ tsconfig.json
└─ vite.config.ts
```

## ✅ Fully Functional Features

### Design Editor
- **Custom-size canvas** — create designs at any dimensions
- **Drag & drop** — move elements anywhere on the canvas
- **Move/resize/rotate** — select elements and use handles or properties panel
- **Delete** — select and press Delete/Backspace
- **Multi-layer system** — elements stack; use Layers panel to reorder, hide, lock
- **Undo/Redo** — Ctrl+Z / Ctrl+Shift+Z; history limited to 80 projects
- **Inline text editing** — double-click any text element to edit
- **Selection handles** — resize handles appear on element selection

### Elements Library
- **Shapes** — Rectangle, Circle, Triangle, Diamond, Star, Hexagon, Pentagon, Heart, Speech bubble, Chevron
- **Lines & arrows** — Line, Arrow, Double arrow
- **Icons** — 199 open-source Lucide icons
- **Stickers** — 48 decorative stickers
- **Upload images** — Drop or browse to upload PNG, JPG, WebP, GIF
- **Custom colors** — Fill color, stroke color, stroke width for all elements

### Text Editor
- **Multiple text boxes** — add as many as desired
- **Font customization** — Inter, Sora, Poppins, Montserrat, Space Grotesk, Oswald, Bebas Neue, Playfair Display, DM Serif Display, Lora, Caveat, Pacifico
- **Font weight** — Light, Regular, Medium, Semibold, Bold, Extra bold
- **Text styling** — Bold, italic, underline
- **Alignment** — Left, center, right
- **Line height, letter spacing** — Fine-tuned control
- **Text effects** — Drop shadow, opacity
- **Color picker** — Choose text color from preset swatches

### Templates (12 original)
- **Social media** — Instagram post, YouTube thumbnail, Facebook post, Twitter post
- **Banners** — YouTube banner, Presentation banners, Marketing banner
- **Presentations** — Posters, Logo templates, Type workshop
- Each template is fully editable — every element can be moved, resized, styled, deleted

### Image Editing
- **Crop** — Drag to reposition, apply with aspect ratios (Layer, Original, 1:1, 4:5, 16:9, 9:16)
- **Filters** — Brightness, Contrast, Saturation, Blur sliders with Reset
- **Flip** — Horizontal and Vertical flip buttons
- **Remove background** — Local border flood-fill + feathering (no external API required)

### Project Management
- **Save projects** — IndexedDB persistence with localStorage fallback
- **Autosave** — Debounced 900ms with canvas thumbnail regeneration
- **Reopen projects** — Load saved projects from the dashboard
- **Duplicate** — Create a copy of any project
- **Rename** — Edit project name
- **Delete** — Remove projects from dashboard
- **List view** — Thumbnail grid with project info (name, date, dimensions, pages)

### Export System
- **PNG** — Current page, quality configurable
- **JPG** — Current page, quality slider (0-1)
- **PDF** — All pages via jsPDF, configurable page size
- **SVG** — Vector serialization from canvas renderer
- **Quality options** — Scale down to fit, maintain aspect ratio

### Interface
- **Light/dark themes** — Toggle in top bar, persisted to localStorage
- **Responsive layout** — Adapts from 1920px down to 320px
  - Tablet (>900px): sidebar/properties closed by default
  - Mobile (<900px): bottom rail with tab buttons, side panel drawer
  - Small (<520px): compact modals, hidden top bar buttons
- **Zoom** — Fit to screen, zoom in/out, specific percentages
- **Keyboard shortcuts** — Ctrl+Z (undo), Ctrl+Y (redo), Ctrl+S (save), Esc (close), Delete (remove), Arrow nudge

## ⚠️ Features Requiring External APIs

These features are **provider-agnostic** but need API configuration:

### AI Image Generation
- Uses OpenAI-compatible `/images/generations` endpoint
- Configure via Settings modal: `baseUrl`, `apiKey`, `imageModel`
- **Offline mode**: Works without API key with local layout generation

### AI Text Generation
- Uses OpenAI-compatible `/chat/completions` endpoint
- Configure via Settings modal: `textModel` (e.g., `gpt-4o-mini`)
- **Offline mode**: Works without API key with preset text library

### AI Background Removal
- Currently local implementation (border flood-fill + feathering)
- Can be replaced with external API if desired

## 📦 Technology Stack

- **React 19.3.1** — UI library
- **TypeScript 7.0.2** — Type safety
- **Vite 8.3.5** — Dev server and build tool
- **Zustand 5** — State management (minimal, no boilerplate)
- **jsPDF 4.2.1** — PDF generation
- **lucide-react 1.66** — Icon set (199 icons generated to `src/data/iconNodes.ts`)
- **Modern CSS** — CSS variables, responsive breakpoints, CSS-only animations
- **IndexedDB** — `lib/db.ts` wrapper with memory fallback when unavailable
- **Canvas 2D rendering** — Custom renderer in `lib/render.ts` for exports

## 🧪 Browser Testing Summary

All major flows verified:

| Feature | Status |
|---------|--------|
| Template "Neon Launch" open/save | ✅ |
| Select element | ✅ |
| Move (820×440 → 900×520) | ✅ |
| Rotate (0° → 90° with Shift snap) | ✅ |
| Undo/Redo | ✅ (note: simple click+drag may require 2 undos) |
| Inline text editing | ✅ |
| Layer hide/show/lock | ✅ |
| Duplicate/delete | ✅ |
| Add rectangle/arrow/icon/sticker | ✅ |
| 199 icons + 48 stickers | ✅ |
| Theme toggle (light/dark) | ✅ |
| Responsive at 1180/900/720/520 widths | ✅ |
| Save/reopen projects | ✅ |
| Rename/delete projects | ✅ |
| PNG export | ✅ |
| JPG export | ✅ |
| PDF export (all pages) | ✅ |
| SVG export | ✅ |
| Upload images | ✅ |
| Crop modal | ✅ |
| Filters (brightness/contrast/saturation/blur) | ✅ |
| Flip H/V | ✅ |
| Remove background (local) | ✅ |
| Layer ordering | ✅ |
| Autosave (900ms debounce) | ✅ |
| Keyboard shortcuts | ✅ |

## 🔧 Known Quirks & Notes

1. **Undo/redo**: A simple click+drag can push history on pointer down even without movement, so duplicate history entries can require two undos after a simple click+drag test. This is a known behavior pattern.

2. **Export scaling**: Export caps at 8192px max dimension. PNG/JPG export current page only; PDF exports all pages.

3. **IndexedDB**: Works in modern browsers. Falls back to memory-only storage if IndexedDB is unavailable (e.g., some incognito/private modes).

4. **AI features**: Configure via Settings modal with OpenAI-compatible API keys. Without keys, app works fully offline with original content.

5. **CORS for AI**: If using external AI APIs, document that browser CORS must allow the API endpoints. The app uses `https://api.openai.com/v1` by default.

6. **Mobile**: Bottom rail provides access to all tools. Properties drawer opens via rail button. Sidebar opens via any tool tab.

## 📄 License

MIT — free for personal and commercial use. No Canva code or assets included.

---

Built with ❤️ as an original graphic design application. Not affiliated with or endorsed by Canva.