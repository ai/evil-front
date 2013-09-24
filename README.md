# Evil Front

Helpers, shortcuts and my common frontend workflows
from [Evil Martians](http://evilmartians.com/).

Project is separated to 2 gems:
* [Evil Front](evil-front/), which doesn’t depend on Rails and
  don’t change anything if you no ask.
* [Evil Front Rails](evil-front-rails/), which change Rails settings to create
  my common frontend workflow by single code line.

## Workflow

Gem load my must-have tools:
* [Sass](http://sass-lang.com/) to write pretty styles.
* [Slim](http://slim-lang.com/) to write pretty views.
* [CoffeeScript](http://coffeescript.org/) to write pretty scripts.
* [Uglifier](https://github.com/lautis/uglifier) to compress JS.
* [Csso](http://bem.info/tools/csso/) to compress CSS.
* [Sprockets](https://github.com/sstephenson/sprockets) to work with assets
  in best way.
* [JqueryCdn](https://github.com/ai/jquery-cdn) to load latest jQuery
  in best way.
* [Autoprefixer](https://github.com/ai/autoprefixer) to add CSS3 prefixes.
* [Rails Sass Images](https://github.com/ai/rails-sass-images) to inline images
  and get their sizes from Sass.
* [Evil Blocks](https://github.com/ai/evil-blocks) to manage your scripts.

## Rails Settings

* Autoprecompile: add to precompile all files in root of
  `app/assets/stylesheets` and `app/assets/javascripts`.
  Store loadable files only in subdirs.
* Disable creating empty script, style and helper files
  on controller generation.

## Helpers

### Head Tags

* [title](evil-front/lib/evil-front/helpers/title.rb) to set page title
  in view file and [title_tag](evil-front/lib/evil-front/helpers/title_tag.rb)
  to use title from view in layout.
* [standard_assets](evil-front/lib/evil-front/helpers/standard_assets.rb)
  shortcut to add `application.css`, jQuery from CDN and `application.js`.
* [head_content](evil-front/lib/evil-front/helpers/head_content.rb)
  to add some tags to head from view and
  [head_tag](evil-front/lib/evil-front/helpers/head_tag.rb) to use views
  head tags in layout.
* [disable_mobile_zoom](evil-front/lib/evil-front/helpers/disable_mobile_zoom.rb)
  shortcut for common viewport usage.

### Russian typography

* [russian_typograph](evil-front/lib/evil-front/helpers/russian_typograph.rb)
  to add real symbols (like Russian quotes, em-dash), flying quotes,
  non-break spaces.
* [capitalize_first](evil-front/lib/evil-front/helpers/capitalize_first.rb)
  to capitalize only first letter.
* [ruble](evil-front/lib/evil-front/helpers/ruble.rb) to insert symbol
  for Russian currency.

### Other

* [tel](evil-front/lib/evil-front/helpers/tel.rb) to insert telephone as link
  with `tel:` protocol.

## Sass Helpers

* `black(alpha)` and `white(alpha)` shortcut
  [functions](evil-front/lib/assets/stylesheets/evil-front/colors.sass).
* [+clearfix](evil-front/lib/assets/stylesheets/evil-front/clearfix.sass)
  by `::after` with `clear: both`.
* [Variables](evil-front/lib/assets/stylesheets/evil-front/easings.sass)
  with [easings](http://easings.net/).
* [+flying-quotes](evil-front/lib/assets/stylesheets/evil-front/flying-quotes.sass)
  mixin to enable flying quotes helper.
* [+height(size)](evil-front/lib/assets/stylesheets/evil-front/height.sass)
  shortcut to set `height` and `line-height` properties.
* [+import-ruble](evil-front/lib/assets/stylesheets/evil-front/import-ruble.sass)
  mixin to enable `ruble` helper.
* CSS Media Queries shortcuts.
* [+size(width, height)](evil-front/lib/assets/stylesheets/evil-front/size.sass)
  shortcut.
* Compact and nice
  [+sticky-footer](evil-front/lib/assets/stylesheets/evil-front/sticky-footer.sass)
  mixin.
* [+stroke-text(color)](evil-front/lib/assets/stylesheets/evil-front/stroke-text.sass)
  shortuct to add text shadow for every side of text.
* [+no-hover](evil-front/lib/assets/stylesheets/evil-front/no-hover.sass) and
  [+styled-taps](evil-front/lib/assets/stylesheets/evil-front/styled-taps.sass)
  mixin to works with hover/tap styles on touch devices.

## JS helpers

* [after(ms, callback)](evil-front/lib/assets/javascripts/evil-front/after.js)
  and
  [every(ms, callback)](evil-front/lib/assets/javascripts/evil-front/every.js)
  syntax sugars to clean up `setTimeout` in CoffeeScript.
* [$.fn.evil.ajax(opts)](evil-front/lib/assets/javascripts/evil-front/ajax.js)
  to create AJAX forms.
* [evil.queue(name, callback)](evil-front/lib/assets/javascripts/evil-front/queue.js)
  to synchronizate animations.
* [$.fn.evil.outside](evil-front/lib/assets/javascripts/evil-front/outside.js)
  to listen click outside element.
* [Script](evil-front/lib/assets/javascripts/evil-front/tappable.js)
  to enable tapped styles for touch devices.
* [Script](evil-front/lib/assets/javascripts/evil-front/detect-3d.js)
  to detect 3D support.
* `evil.post`, `evil.del` and `evil.put`
  [shortcuts](evil-front/lib/assets/javascripts/evil-front/http.js).
* `evil.win`, `evil.body` and `evil.doc`
  [shortcuts](evil-front/lib/assets/javascripts/evil-front/core.js).
