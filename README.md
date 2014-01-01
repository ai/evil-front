# Evil Front

Helpers, shortcuts and my common frontend workflows
from [Evil Martians](http://evilmartians.com/).

Project is separated to 2 gems:
* [Evil Front Core](evil-front-core/) contains only helper and doesn’t change
  application environment.
* [Evil Front All](evil-front-all/) load workflows gems: Autoprefixer, Csso,
  JqueryCdn, Evil Blocks, Uglifier.
* [Evil Front Rails](evil-front-rails/) changes Rails settings to create
  my common frontend workflow by single code line.

You can safely use Evil Front Core, but 2 other gems has side effects,
so I recommend to use them only on new projects.

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

### Russian Typography

* [russian_typograph](evil-front-core/lib/evil-front/helpers/russian_typograph.rb)
  to add real symbols (like Russian quotes, em-dash), flying quotes,
  non-break spaces.
* [ruble](evil-front-core/lib/evil-front/helpers/ruble.rb) to insert symbol
  for Russian currency.
* [capitalize_first](evil-front-core/lib/evil-front/helpers/capitalize_first.rb)
  to capitalize only first letter.

### Head Tags

* [title](evil-front-core/lib/evil-front/helpers/title.rb) to set page title
  in view file and [title_tag](evil-front-core/lib/evil-front/helpers/title_tag.rb)
  to use title from view in layout.
* [standard_assets](evil-front-core/lib/evil-front/helpers/standard_assets.rb)
  shortcut to add `application.css`, jQuery from CDN and `application.js`.
* [head_content](evil-front-core/lib/evil-front/helpers/head_content.rb)
  to add some tags to head from view and
  [head_tag](evil-front-core/lib/evil-front/helpers/head_tag.rb) to use views
  head tags in layout.
* [disable_mobile_zoom](evil-front-core/lib/evil-front/helpers/disable_mobile_zoom.rb)
  shortcut for common viewport usage.

### Other

* [tel](evil-front-core/lib/evil-front/helpers/tel.rb) to insert telephone as link
  with `tel:` protocol.

## Sass Helpers

* `black(alpha)` and `white(alpha)` shortcut
  [functions](evil-front-core/lib/assets/stylesheets/evil-front/colors.sass).
* [+import-ruble](evil-front-core/lib/assets/stylesheets/evil-front/import-ruble.sass)
  mixin to enable `ruble` helper.
* [+flying-quotes](evil-front-core/lib/assets/stylesheets/evil-front/flying-quotes.sass)
  mixin to enable flying quotes helper.
* [+no-hover](evil-front-core/lib/assets/stylesheets/evil-front/no-hover.sass) and
  [+styled-taps](evil-front-core/lib/assets/stylesheets/evil-front/styled-taps.sass)
  mixin to works with hover/tap styles on touch devices.
* [Variables](evil-front-core/lib/assets/stylesheets/evil-front/easings.sass)
  with [easings](http://easings.net/).
* CSS Media Queries
  [shortcuts](evil-front-core/lib/assets/stylesheets/evil-front/media.sass).
* [+stroke-text(color)](evil-front-core/lib/assets/stylesheets/evil-front/stroke-text.sass)
  shortuct to add text shadow for every side of text.
* [+height(size)](evil-front-core/lib/assets/stylesheets/evil-front/height.sass)
  shortcut to set `height` and `line-height` properties.
* [+size(width, height)](evil-front-core/lib/assets/stylesheets/evil-front/size.sass)
  shortcut.
* Compact and nice
  [+sticky-footer](evil-front-core/lib/assets/stylesheets/evil-front/sticky-footer.sass)
  mixin.
* [+clearfix](evil-front-core/lib/assets/stylesheets/evil-front/clearfix.sass)
  by `::after` with `clear: both`.

## JS Helpers

* [after(ms, callback)](evil-front-core/lib/assets/javascripts/evil-front/after.js)
  and
  [every(ms, callback)](evil-front-core/lib/assets/javascripts/evil-front/every.js)
  syntax sugars to clean up `setTimeout` in CoffeeScript.
* [Script](evil-front-core/lib/assets/javascripts/evil-front/links.js) to prevent
  default behavior for AJAX links with `href="#"` to clean event listeners from
  noisy `return false`.
* [$.fn.evil.outside](evil-front-core/lib/assets/javascripts/evil-front/outside.js)
  to listen click outside element.
* [$.fn.evil.ajax(opts)](evil-front-core/lib/assets/javascripts/evil-front/ajax.js)
  to create AJAX forms.
* [evil.queue(name, callback)](evil-front-core/lib/assets/javascripts/evil-front/queue.js)
  to synchronizate animations.
* [Script](evil-front-core/lib/assets/javascripts/evil-front/tappable.js)
  to enable tapped styles for touch devices.
* [Script](evil-front-core/lib/assets/javascripts/evil-front/detect-3d.js)
  to detect 3D support.
* `evil.post`, `evil.del` and `evil.put`
  [shortcuts](evil-front-core/lib/assets/javascripts/evil-front/http.js).
* `evil.win`, `evil.body` and `evil.doc`
  [shortcuts](evil-front-core/lib/assets/javascripts/evil-front/core.js).
