# Evil Front

Helpers, shortcuts and my common frontend workflows from Evil Martians.

Project is separated to 2 gems:
* [evil-front](evil-front/), which doesn’t depend on Rails and
  don’t change anything if you no ask.
* [evil-front-rails](evil-front-rails/), which change Rails settings to create
  my common frontend workflow by single code line.

## Workflow

Gem load my must-have tools:
* Sass to write pretty styles.
* Slim to write pretty views.
* CoffeeScript to write pretty scripts.
* Uglifier to compress JS.
* Csso to compress CSS.
* Sprockets to work with assets in best way.
* JqueryCdn to load latest jQuery in best way.
* Autoprefixer to add CSS3 prefixes.
* Rails Sass Images to inline images and get their sizes from Sass.
* Evil Blocks to manage your scripts.

## Rails Settings

* Autoprecompile: add to precompile all files in root of
  `app/assets/stylesheets` and `app/assets/javascripts`.
  Store loadable files only in subdirs.
* Disable creating empty script, style and helper files
  on controller generation.

## Helpers

### Head Tags

* `title` to set page title in view file and `title_tag` to use title from view
  in layout.
* `standard_assets` shortcut to add `application.css`, jQuery from CDN and
  `application.js`.
* `head_content` to add some tags to head from view and `head_tag` to use views
  head tags in layout.
* `disable_mobile_zoom` shortcut for common viewport usage.

### Russian typography

* `russian_typograph` to add real symbols (like Russian quotes, em-dash),
  flying quotes, non-break spaces.
* `capitalize_first` to capitalize only first letter.
* `ruble` to insert symbol for Russian currency.

### Other

* `tel` to insert telephone as link with `tel:` protocol.

## Sass Helpers

* `black(alpha)` and `white(alpha)` shortcut functions.
* `+clearfix` by `::after` with `clear: both`.
* Variables with [easings](http://easings.net/).
* `+flying-quotes` mixin to enable flying quotes helper.
* `+height(size)` shortcut to set `height` and `line-height` properties.
* `+import-ruble` mixin to enable `ruble` helper.
* CSS Media Queries shortcuts.
* `+size(width, height)` shortcut.
* Compact and nice `+sticky-footer` mixin.
* `+stroke-text(color)` shortuct to add text shadow for every side of text.
* `+no-hover` and `+styled-taps` mixin to works with hover/tap styles
  on touch devices.

## JS helpers

* `after(ms, callback)` and `every(ms, callback)` syntax sugars to clean up
  `setTimeout` in CoffeeScript.
* `$.fn.evil.ajax(opts)` to create AJAX forms.
* `evil.queue(name, callback)` to synchronizate animations.
* `$.fn.evil.outside` to listen click outside element.
* Script to enable tapped styles for touch devices.
* Script to detect 3D support.
* `evil.post`, `evil.del` and `evil.put` shortcuts.
* `evil.win`, `evil.body` and `evil.doc` shortcuts.
