package createjs.loader;

import haxe.extern.EitherType;

/**
 * An list of files to load.
 * The loadManifest call supports four types of manifests:
 *   1. string path, which points to a manifest file, which is a JSON file that contains a "manifest" property, which defines
 * 		the list of files to load, and can optionally contain a "path" property, which will be prepended to each file in the list.
 *   2. An object which defines a "src", which is a JSON or JSONP file. A "callback" can be defined for JSONP file.
 * 		The JSON/JSONP file should contain a "manifest" property, which defines the list of files to load, and can optionally
 * 		contain a "path" property, which will be prepended to each file in the list.
 *   3. An object which contains a "manifest" property, which defines the list of files to load, and can optionally contain a
 * 		"path" property, which will be prepended to each file in the list.
 *   4. An Array of files to load.
 * 
 * Each "file" in a manifest can be either:
 *   1. A LoadItem instance.
 *   2. An object containing properties defined by LoadItem.
 *   3. OR A string path to a resource. Note that this kind of load item will be converted to a LoadItem in the background.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/LoadQueue.html#method_loadManifest
 * @author VolkovRA
 */
typedef Manifest = EitherType<String, EitherType<ManifestArray, Dynamic>>;

/**
 * An Array of files to load.
 */
typedef ManifestArray = Array<EitherType<LoadItem, LoadItemObject>>;