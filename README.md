# Haxe externs for CreateJS

Description
------------------------------

The Haxe externs of CreateJS JavaScript library.
See [website](https://www.createjs.com/ "CreateJS website") of CreateJS.

How to use
------------------------------

```
package;

import createjs.EaselJS;
import createjs.TweenJS;
import createjs.PreloadJS;
import createjs.SoundJS;

class Main
{
	static function main() {
		trace(EaselJS.version + " " + EaselJS.buildDate);
		trace(TweenJS.version + " " + TweenJS.buildDate);
		trace(PreloadJS.version + " " + PreloadJS.buildDate);
		trace(SoundJS.version + " " + SoundJS.buildDate);
	}
}
```

Include the EaselJS
------------------------------

Include the EaselJS libraries in your project by linking to the CreateJS CDN.
```
<script src="https://code.createjs.com/1.0.0/createjs.min.js"></script>
```

Adding library
------------------------------

1. Install haxelib so that you can use the Haxe libraries.
2. Run the command in the terminal to install the CreateJS externs library globally on your local machine:
```
haxelib git CreateJS https://github.com/VolkovRA/HaxeCreateJS master
```
Command syntax:
```
haxelib git [project-name] [git-clone-path] [branch]
haxelib git minject https://github.com/massiveinteractive/minject.git         # Use HTTP git path.
haxelib git minject git@github.com:massiveinteractive/minject.git             # Use SSH git path.
haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.
```
3. Add the CreateJS library to your project to use it in the code. If you are using HaxeDevelop, then simply add the entry to the .hxproj file:
```
<haxelib>
	<library name="CreateJS" />
</haxelib>
```

See more information:
 * [Documentation Haxelib](https://lib.haxe.org/documentation/using-haxelib/ "Using Haxelib")
 * [Documentation HaxeDevelop](https://haxedevelop.org/configure-haxe.html "Configure Haxe")
 * [GETTING STARTED CreateJS](https://www.createjs.com/getting-started "OFFICIAL TUTORIALS")