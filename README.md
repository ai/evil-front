# Evil Front

Helpers, shortcuts and my common frontend workflows
from [Evil Martians](http://evilmartians.com/).

The project is separated into 3 gems:
* [Evil Front](evil-front/) only contains helpers and doesn’t change
  the application environment.
* [Evil Front All](evil-front-all/) loads the workflow gems: Autoprefixer, Csso,
  Slim, JqueryCdn, Evil Blocks, Uglifier.
* [Evil Front Rails](evil-front-rails/) loads the workflow gems and changes Rails
  settings to create my common frontend workflow with a single line of code.

You can safely use Evil Front Core, but the other two gems have side effects,
so I recommend to only use them for new projects.

Some of the view helpers from Evil Front Core may require Rails, but most of them
work with any Ruby application.

## Helpers

The Evil Front Core gem contains assets and view helpers:

### View Helpers

#### Russian Typography

* [russian_typograph](evil-front/lib/evil-front/helpers/russian_typograph.rb)
  to add typographical symbols (like Russian quotes, em-dash), flying quotes,
  non-breaking spaces.
* [ruble](evil-front/lib/evil-front/helpers/ruble.rb) to insert the Russian
  currency character.
* [capitalize_first](evil-front/lib/evil-front/helpers/capitalize_first.rb)
  to capitalize only first letter.

#### Head Tags

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

####  Other

* [tel](evil-front/lib/evil-front/helpers/tel.rb) to insert phone numbers as
  links with the `tel:` protocol.

### Sass Helpers

* `black(alpha)` and `white(alpha)` shortcut
  [functions](evil-front/lib/assets/stylesheets/evil-front/colors.sass).
* [+import-ruble](evil-front/lib/assets/stylesheets/evil-front/import-ruble.sass)
  mixin to enable `ruble` helper.
* [+flying-quotes](evil-front/lib/assets/stylesheets/evil-front/flying-quotes.sass)
  mixin to enable flying quotes helper.
* [+no-hover](evil-front/lib/assets/stylesheets/evil-front/no-hover.sass) and
  [+styled-taps](evil-front/lib/assets/stylesheets/evil-front/styled-taps.sass)
  mixin to work with hover/tap styles on touch devices.
* [Variables](evil-front/lib/assets/stylesheets/evil-front/easings.sass)
  with [easings](http://easings.net/).
* CSS Media Queries
  [shortcuts](evil-front/lib/assets/stylesheets/evil-front/media.sass).
* [+stroke-text(color)](evil-front/lib/assets/stylesheets/evil-front/stroke-text.sass)
  shortuct to add text shadow for every side of text.
* [+height(size)](evil-front/lib/assets/stylesheets/evil-front/height.sass)
  shortcut to set `height` and `line-height` properties.
* [+size(width, height)](evil-front/lib/assets/stylesheets/evil-front/size.sass)
  shortcut.
* Compact and nice
  [+sticky-footer](evil-front/lib/assets/stylesheets/evil-front/sticky-footer.sass)
  mixin.
* [+clearfix](evil-front/lib/assets/stylesheets/evil-front/clearfix.sass)
  by `::after` with `clear: both`.

### JS Helpers

* [after(ms, callback)](evil-front/lib/assets/javascripts/evil-front/after.js)
  and
  [every(ms, callback)](evil-front/lib/assets/javascripts/evil-front/every.js)
  syntactic sugar to clean up `setTimeout` in CoffeeScript.
* [Script](evil-front/lib/assets/javascripts/evil-front/links.js) to prevent
  default behavior for AJAX links with `href="#"` to clean event listeners from
  noisy `return false`.
* [$.fn.evil.outside](evil-front/lib/assets/javascripts/evil-front/outside.js)
  to listen click outside element.
* [$.fn.evil.ajax(opts)](evil-front/lib/assets/javascripts/evil-front/ajax.js)
  to create AJAX forms.
* [evil.queue(name, callback)](evil-front/lib/assets/javascripts/evil-front/queue.js)
  to synchronizate animations.
* [Script](evil-front/lib/assets/javascripts/evil-front/tappable.js)
  to enable tapped styles for touch devices.
* [Script](evil-front/lib/assets/javascripts/evil-front/detect-3d.js)
  to detect 3D support.
* `evil.post`, `evil.del` and `evil.put`
  [shortcuts](evil-front/lib/assets/javascripts/evil-front/http.js).
* `evil.win`, `evil.body` and `evil.doc`
  [shortcuts](evil-front/lib/assets/javascripts/evil-front/core.js).

## Workflow

The Evil Front All gem loads my must-have tools:

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

The Evil Front Rails gem alters default Rails settings:

* **Autoprecompile** is added to precompile all files in root of
  `app/assets/stylesheets` and `app/assets/javascripts`.
  You should only store loadable files in subdirs.
* **Disable assets generation** on controller and action generation.
